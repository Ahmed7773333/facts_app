import 'package:facts_app/fact_screen.dart';
import 'package:facts_app/observer.dart';
import 'package:facts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 870),
      child: MaterialApp(
        theme: AppTheme.mode,
        home: FactScreen(),
      ),
    );
  }
}
