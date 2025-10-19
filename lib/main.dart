import 'package:flutter/material.dart';
import 'package:news_app_c16_6pm/common/app_theme.dart';
import 'package:news_app_c16_6pm/features/categories/view/main_layer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {MainLayerPage.routeName: (_) => MainLayerPage()},
      initialRoute: MainLayerPage.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
