// import 'package:flutter/material.dart';
// import 'package:iot_app/screen/sensor/data_filter.dart';
//
// import '../app/app_themes.dart';
// import '../resource/images/app_images.dart';
// import '../widgets/table_history.dart';
// import '../widgets/touchable_widget.dart';
//
// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: AppThemes.background,
//       body: Column(
//         children: [
//           SizedBox(height: 100,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: AppThemes.white,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Search",
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 8)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 TouchableWidget(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => DataSensorFilter()));
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                         color: AppThemes.white, shape: BoxShape.circle),
//                     child: Image.asset(
//                       AppImages.iconFilter,
//                       height: 24,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//               child: TableHistory(),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             decoration: const BoxDecoration(
//                 color: AppThemes.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16))),
//             child: const Row(
//               children: [
//                 Expanded(child: Text("Tổng: 0")),
//                 Icon(Icons.navigate_before),
//                 Icon(Icons.navigate_next)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
