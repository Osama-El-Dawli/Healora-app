import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healora/core/helper/service_locator.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/features/auth/login/cubit/login_cubit.dart';
import 'package:healora/features/auth/login/data/repositories/login_repository.dart';
import 'package:healora/features/auth/login/presentation/screens/login_screen.dart';
import 'package:healora/features/auth/register/cubit/register_cubit.dart';
import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:healora/features/auth/register/data/repositories/register_repository.dart';
import 'package:healora/features/auth/register/presentation/screens/register_screen.dart';
import 'package:healora/features/chat/cubit/chat_cubit/chat_cubit.dart';
import 'package:healora/features/chat/data/repositories/chat_repo.dart';
import 'package:healora/features/chat/presentation/screens/doctor_chat.dart';
import 'package:healora/features/doctor_feature/presentation/screens/appointment_details_screen.dart';
import 'package:healora/features/doctor_feature/presentation/screens/doctor_screen.dart';
import 'package:healora/features/home/presentation/screens/home_screen.dart';
import 'package:healora/features/lab_results/presentation/screens/lab_results_screen.dart';
import 'package:healora/features/medical_chatbot/presentation/screens/medical_chatbot_screen.dart';
import 'package:healora/features/medical_history/presentation/screens/medical_history_screen.dart';
import 'package:healora/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:healora/features/select_doctor/presentation/screens/select_doctor_screen.dart';
import 'package:healora/features/settings/presentation/screens/settings_screen.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(builder: (_) => HomeScreen(user: userModel));

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                LoginCubit(ServiceLocator.getIt<LoginRepository>()),
            child: const LoginScreen(),
          ),
        );

      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                RegisterCubit(ServiceLocator.getIt<RegisterRepository>()),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutes.chatScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final chatId = args['chatId'];
        final UserModel user = args['user'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ChatCubit(ServiceLocator.getIt<ChatRepo>())
                  ..loadMessages(chatId: chatId),
            child: DoctorChat(user: user, chatId: chatId),
          ),
        );

      case AppRoutes.chatBotScreen:
        return MaterialPageRoute(builder: (_) => const MedicalChatbotScreen());

      case AppRoutes.labResultsScreen:
        return MaterialPageRoute(builder: (_) => const LabResultsScreen());

      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case AppRoutes.medicalHistoryScreen:
        return MaterialPageRoute(builder: (_) => const MedicalHistoryScreen());

      case AppRoutes.selectDoctorScreen:
        return MaterialPageRoute(builder: (_) => const SelectDoctorScreen());

      case AppRoutes.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case AppRoutes.doctorScreen:
        final userModel = settings.arguments as UserModel;

        return MaterialPageRoute(builder: (_) => DoctorScreen(user: userModel));

      case AppRoutes.appointmentDetailsScreen:
        final avatarTag = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => AppointmentDetailsScreen(avatarTag: avatarTag),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
