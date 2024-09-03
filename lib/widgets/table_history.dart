import 'package:flutter/material.dart';
import 'package:iot_app/resource/fonts/app_fonts.dart';

class TableHistory extends StatefulWidget {
  const TableHistory({super.key});

  @override
  State<TableHistory> createState() => _TableHistoryState();
}

class _TableHistoryState extends State<TableHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Text("Time",
                        textAlign: TextAlign.center,
                        style: AppFonts.normalBold()))
              ],
            ),
          )
        ],
      ),
    );
  }
}
