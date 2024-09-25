import 'package:flutter/material.dart';
import 'package:iot_app/model/action_model.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';

import '../app/app_themes.dart';
import '../utils/app_function.dart';

class TableHistory extends StatefulWidget {
  const TableHistory({super.key, required this.listData});

  final List<ActionModel> listData;

  @override
  State<TableHistory> createState() => _TableHistoryState();
}

class _TableHistoryState extends State<TableHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text("No",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    child: Text("Device",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    child: Text("Action",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold())),
                Expanded(
                    flex: 2,
                    child: Text("Time",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold()))
              ],
            ),
          ),
          const Divider(
              color: AppThemes.background,
              height: 2,
              thickness: 2,
              indent: 8,
              endIndent: 8),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.listData.length,
              itemBuilder: (context, index) {
                var data = widget.listData[index];
                return _buildRowData(index + 1, data);
              })
        ],
      ),
    );
  }

  Widget _buildRowData(int index, ActionModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(index.toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text(data.device ?? "",
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              child: Text((data.action ?? 0).toString(),
                  textAlign: TextAlign.center, style: AppFonts.light())),
          Expanded(
              flex: 2,
              child: Text(
                  AppFunction.formatDateTimeFromApi(data.time, haveTime: true),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppFonts.light()))
        ],
      ),
    );
  }
}
