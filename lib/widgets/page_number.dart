import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';
import 'package:iot_app/utils/extension.dart';
import 'package:iot_app/widgets/touchable_widget.dart';

class PageNumber extends StatelessWidget {
  const PageNumber(
      {super.key,
      required this.currentPage,
      required this.totalPage,
      required this.onTap});

  final int currentPage;
  final int totalPage;
  final void Function(int) onTap;

  List<Widget> _buildListPage() => [
        for (int i = 1; i <= totalPage; i++)
          ItemPage(
              text: i.toString(),
              value: currentPage == i,
              onTap: () => onTap(i))
      ];

  Widget _baseRow(BuildContext context, List<Widget> numberPages) {
    return Row(
      children: [
        currentPage == 1
            ? const SizedBox.shrink()
            : TouchableWidget(
                onPressed: () => onTap(currentPage - 1),
                child: const Icon(Icons.navigate_before),
              ),
        ...numberPages.addBetween(const SizedBox(
          width: 8,
        )),
        currentPage == totalPage
            ? const SizedBox.shrink()
            : TouchableWidget(
                onPressed: () => onTap(currentPage + 1),
                child: const Icon(Icons.navigate_next),
              )
      ],
    );
  }

  List<Widget> _morePage(BuildContext context) {
    return [
      ItemPage(
        text: '1',
        value: currentPage == 1,
        onTap: () => onTap(1),
      ),
      currentPage == 1 || currentPage == 2
          ? ItemPage(text: '2', value: currentPage == 2, onTap: () => onTap(2))
          : ItemPage(
              icon: Icon(
                Icons.more_horiz,
                color: const Color(0xff232325),
                size: MediaQuery.of(context).size.width / 27,
              ),
            ),
      currentPage == 1 || currentPage == 2
          ? ItemPage(text: '3', value: currentPage == 3, onTap: () => onTap(3))
          : currentPage == totalPage || currentPage == totalPage - 1
              ? ItemPage(
                  text: (totalPage - 2).toString(),
                  value: currentPage == (totalPage - 2),
                  onTap: () => onTap(totalPage - 2),
                )
              : ItemPage(
                  text: currentPage.toString(),
                  value: currentPage == totalPage ? false : true,
                  onTap: () => onTap(currentPage)),
      currentPage == totalPage || currentPage == totalPage - 1
          ? ItemPage(
              text: (totalPage - 1).toString(),
              value: currentPage == totalPage - 1,
              onTap: () => onTap(totalPage - 1),
            )
          : ItemPage(
              icon: Icon(
                Icons.more_horiz,
                color: const Color(0xff232325),
                size: MediaQuery.of(context).size.width / 27,
              ),
            ),
      ItemPage(
        text: totalPage.toString(),
        value: currentPage == totalPage,
        onTap: () => onTap(totalPage),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (totalPage < 2) {
      return const ItemPage(
        text: '1',
        value: true,
      );
    }
    if (totalPage <= 5) {
      return _baseRow(context, _buildListPage());
    }
    if (totalPage > 5) {
      return _baseRow(context, _morePage(context));
    }
    return const SizedBox.shrink();
  }
}

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, this.text, this.value, this.onTap, this.icon});

  final String? text;
  final bool? value;
  final Widget? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableWidget(
        onPressed: onTap,
        child: icon ??
            Text(
              text ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.regular(
                  14, value == true ? AppThemes.background : Colors.black),
            ));
  }
}
