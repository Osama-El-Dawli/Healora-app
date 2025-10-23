import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/bloc_observer.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/routes/routes_generator.dart';
import 'package:healora/core/theme/app_theme.dart';
import 'package:healora/features/choose_specialty/presentation/screens/choose_speciality_scrren.dart';
import 'package:healora/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const Healora(),
    ),
  );
}

class Healora extends StatelessWidget {
  const Healora({super.key});

  @override
  Widget build(BuildContext context) {
    return

    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(

        title: 'Healora',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: AppRouteGenerator.generateRoute,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.light,

        home: ChooseSpecialityScrren(),
      ),
    );
  }
  }

