import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animesalt/utils/theme.dart';
import 'package:animesalt/pages/main_screen.dart';
import 'package:animesalt/providers/app_provider.dart';

class AnimeSaltApp extends StatelessWidget {
  const AnimeSaltApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        title: 'Anime Salt',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const MainScreen(),
      ),
    );
  }
}
