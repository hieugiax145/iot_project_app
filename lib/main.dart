import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_app/app/app_themes.dart';
import 'package:iot_app/provider/sensors_provider.dart';
import 'package:iot_app/screen/home_main.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppThemes.background,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>SensorsProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppThemes.background),
          useMaterial3: true,
        ),
        home: const HomeMain()
      ),
    );
  }
}