import 'package:flutter/material.dart';
import 'package:votal_app/ui/shared/app_colors.dart';

ThemeData theme(context) => ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.purple,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.surface, foregroundColor: Colors.white),
      bottomAppBarColor: AppColors.surface,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColors.purple),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.purple,
          unselectedItemColor: AppColors.purple.withOpacity(0.2)),
      primaryTextTheme: Theme.of(context)
          .textTheme
          .apply(bodyColor: Colors.white, displayColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white12,
        filled: true,
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.all(16),
        hintStyle: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.white60),
      ),
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          primary: Colors.black,
          backgroundColor: AppColors.purple,
        ),
      ),
    );
