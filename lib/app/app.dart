import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/resources/themes_manager.dart';
import '../presentation/screens/auth_screen.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static MyApp? _myApp;

  static MyApp getInstance() {
    _myApp ??= const MyApp._internal();
    return _myApp!;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(100, 100),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'RecycleX',
        debugShowCheckedModeBanner: false,
        // initialRoute: AppRouter.getIntialRoute(),
        home: const AuthScreen(),
        onGenerateRoute: AppRouter.getRoute,
        theme: ThemeManager.getLightTheme(),
      ),
    );
  }
}
