
import 'package:fitflow/core/helper/on_generate_routes.dart';
import 'package:fitflow/core/services/shared_preferences_singleton.dart';
import 'package:fitflow/core/utils/app_colors.dart';
import 'package:fitflow/features/spalsh/splash_view.dart';
import 'package:fitflow/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const FitFlow());
}

class FitFlow extends StatelessWidget {
  const FitFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
                fontFamily: 'Cairo',
                scaffoldBackgroundColor: AppColors.primaryColor,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primaryColor,
                )),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: onGenerateRoutes,
            initialRoute: SplashView.routeName,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
