import 'package:flutter/material.dart';
import 'package:healora/core/routes/routes.dart';
import 'package:healora/features/auth/login/presentation/screens/login_screen.dart';
import 'package:healora/features/auth/register/presentation/screens/register_screen.dart';
import 'package:healora/features/chat/presentation/screens/doctor_chat.dart';
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
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case AppRoutes.chatScreen:
        return MaterialPageRoute(builder: (_) => const DoctorChat());

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

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: const Center(
          child: Text(
            '404\nPage not found',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
