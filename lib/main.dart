import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healora/bloc_observer.dart';
import 'package:healora/core/cache/hive_manager.dart';
import 'package:healora/core/helper/service_locator.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/core/routes/routes_generator.dart';
import 'package:healora/core/notifications/messaging_config.dart';
import 'package:healora/core/theme/app_theme.dart';
import 'package:healora/core/theme/cubit/theme_cubit.dart';
import 'package:healora/core/theme/cubit/theme_state.dart';
import 'package:healora/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  await dotenv.load(fileName: ".env", isOptional: true);
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();

  await HiveManager.init();
  final isOnboardingVisited = HiveManager.isOnboardingVisited();

  await MessagingConfig.initFirebaseMessaging();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: BlocProvider(
          create: (_) => ThemeCubit(),
          child: Healora(isOnboardingVisited: isOnboardingVisited),
        ),
      ),
    );
  });
}

class Healora extends StatefulWidget {
  const Healora({super.key, required this.isOnboardingVisited});
  final bool isOnboardingVisited;

  @override
  State<Healora> createState() => _HealoraState();
}

class _HealoraState extends State<Healora> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ThemeCubit>().initTheme(context);
    });
    MessagingConfig.setupInteractedMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final isDark = state is DarkThemeState;
          final user = HiveManager.getUser();

          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Healora',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            onGenerateRoute: (settings) {
              final user = HiveManager.getUser();
              if (settings.name == AppRoutes.homeScreen ||
                  settings.name == AppRoutes.doctorScreen) {
                return AppRouteGenerator.generateRoute(
                  RouteSettings(name: settings.name, arguments: user),
                );
              }
              return AppRouteGenerator.generateRoute(settings);
            },

            theme: AppTheme.lightMode,
            darkTheme: AppTheme.darkMode,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

            initialRoute: widget.isOnboardingVisited
                ? (user != null
                      ? (user.role == 'doctor'
                            ? AppRoutes.doctorScreen
                            : AppRoutes.homeScreen)
                      : AppRoutes.loginScreen)
                : AppRoutes.onBoardingScreen,
          );
        },
      ),
    );
  }
}
