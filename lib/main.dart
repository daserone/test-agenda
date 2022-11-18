import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test/data/models/schedule_model.dart';
import 'package:test/domain/provider/field_provider.dart';
import 'package:test/domain/provider/position_provider.dart';
import 'package:test/domain/provider/schedule_provider.dart';
import 'package:test/domain/provider/weather_provider.dart';
import 'package:test/presentation/home/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme/theme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ScheduleModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScheduleProvider()),
        ChangeNotifierProvider(create: (context) => FieldProvider()),
        ChangeNotifierProvider(create: (context) => PositionProvider()),
        ChangeNotifierProvider(create: (context) => WeatherProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'test flutter',
        theme: ThemeConfig.lightTheme,
        home: const HomeView(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('es', ''), // Spanish, no country code
        ],
      ),
    );
  }
}
