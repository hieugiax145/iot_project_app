import 'package:flutter/material.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/resource/images/app_images.dart';
import 'package:iot_app/screen/dashboard/dashboard_screen.dart';
import 'package:iot_app/screen/history/action_history_screen.dart';
import 'package:iot_app/screen/profile/profile_screen.dart';
import 'package:iot_app/screen/sensor/data_sensor_screen.dart';
import 'package:iot_app/widgets/tab_navigation.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  List tabs = [
    const DashboardScreen(),
    const DataSensorScreen(),
    const ActionHistoryScreen(),
    const ProfileScreen()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppThemes.background,
      bottomNavigationBar: Container(
        height: 64,
        decoration: const BoxDecoration(color: AppThemes.background),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1),
                spreadRadius: 0.2,
                blurRadius: 1)
          ], color: AppThemes.background),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabNavigation(
                label: "Dashboard",
                icon: AppImages.iconDashboard,
                iconSelected: AppImages.iconDashboardFill,
                isSelected: _currentIndex == 0,
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              TabNavigation(
                label: "Sensor",
                icon: AppImages.iconChart,
                iconSelected: AppImages.iconChartFill,
                isSelected: _currentIndex == 1,
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              TabNavigation(
                label: "Action",
                icon: AppImages.iconHistory,
                iconSelected: AppImages.iconHistoryFill,
                isSelected: _currentIndex == 2,
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
              TabNavigation(
                label: "Profile",
                icon: AppImages.iconInfo,
                iconSelected: AppImages.iconInfoFill,
                isSelected: _currentIndex == 3,
                onTap: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (idx) {
      //     setState(() {
      //       _currentIndex = idx;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Image.asset(
      //           AppImages.iconDashboard,
      //           height: 30,
      //         ),
      //         label: "Dashboard",
      //         backgroundColor: AppThemes.background),
      //     BottomNavigationBarItem(
      //         icon: Image.asset(AppImages.iconChart),
      //         label: "Sensors",
      //         backgroundColor: AppThemes.background),
      //     BottomNavigationBarItem(
      //         icon: Image.asset(AppImages.iconHistory),
      //         label: "Action",
      //         backgroundColor: AppThemes.background),
      //     BottomNavigationBarItem(
      //         icon: Image.asset(AppImages.iconInfo),
      //         label: "Profile",
      //         backgroundColor: AppThemes.background)
      //   ],
      // ),
      body: tabs[_currentIndex],
    );
  }
}
