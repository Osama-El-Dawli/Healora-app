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
import 'package:healora/features/diet_chart/presentation/screens/settings_screen.dart';
import 'package:healora/features/choose_specialty/presentation/screens/choose_specialty_screen.dart';
import 'package:healora/features/doctor_feature/cubit/doctor_feature_cubit.dart';
import 'package:healora/features/doctor_feature/data/repositories/doctor_feature_repo.dart';
import 'package:healora/features/doctor_feature/presentation/screens/appointment_details_screen.dart';
import 'package:healora/features/doctor_feature/presentation/screens/doctor_screen.dart';
import 'package:healora/features/edit_account/cubit/update_account_info_cubit.dart';
import 'package:healora/features/edit_account/data/repositories/update_user_info_repository.dart';
import 'package:healora/features/edit_account/data/repositories/upload_profile_image_repo.dart';
import 'package:healora/features/edit_account/presentation/screens/edit_account_screen.dart';
import 'package:healora/features/home/presentation/screens/home_screen.dart';
import 'package:healora/features/lab_results/cubit/lab_results_cubit.dart';
import 'package:healora/features/lab_results/data/repositories/lab_results_repo.dart';
import 'package:healora/features/lab_results/presentation/screens/lab_results_screen.dart';
import 'package:healora/features/medical_chatbot/cubit/chat_bot_cubit/chat_bot_cubit.dart';
import 'package:healora/features/medical_chatbot/data/repositories/chat_bot_repo.dart';
import 'package:healora/features/medical_chatbot/presentation/screens/medical_chatbot_screen.dart';
import 'package:healora/features/medical_history/cubit/medical_history_cubit/medical_history_cubit.dart';
import 'package:healora/features/medical_history/data/repositories/medical_history_repo.dart';
import 'package:healora/features/medical_history/presentation/screens/medical_history_screen.dart';
import 'package:healora/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:healora/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:healora/features/select_appointment/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:healora/features/select_appointment/data/repository/appointment_repo.dart';
import 'package:healora/features/select_appointment/presentation/screens/booking_details_screen.dart';
import 'package:healora/features/select_appointment/presentation/screens/select_appointment_screen.dart';
import 'package:healora/features/select_doctor/cubit/select_doctor_cubit/select_doctor_cubit.dart';
import 'package:healora/features/select_doctor/data/repositories/select_doctor_repo.dart';
import 'package:healora/features/select_doctor/presentation/screens/select_doctor_screen.dart';
import 'package:healora/features/settings/cubits/logout_cubit/logout_cubit.dart';
import 'package:healora/features/settings/data/repositories/logout_repo.dart';
import 'package:healora/features/settings/presentation/screens/settings_screen.dart';

class AppRouteGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UpdateAccountCubit(
              ServiceLocator.getIt<UpdateUserInfoRepository>(),
              ServiceLocator.getIt<UploadProfileImageRepo>(),
              userModel: userModel,
            ),
            child: HomeScreen(user: userModel),
          ),
        );

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ChatBotCubit(ServiceLocator.getIt<ChatBotRepo>())
                  ..initChatBot(),
            child: const MedicalChatbotScreen(),
          ),
        );

      case AppRoutes.labResultsScreen:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                LabResultsCubit(ServiceLocator.getIt<LabResultsRepo>())
                  ..getLabResultsList(uid: userModel.uid),
            child: LabResultsScreen(userModel: userModel),
          ),
        );
      case AppRoutes.editAccountScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final userModel = args['user'] as UserModel;
        final updateCubit = args['cubit'] as UpdateAccountCubit;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: updateCubit,
            child: EditAccountScreen(user: userModel),
          ),
        );

      case AppRoutes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case AppRoutes.medicalHistoryScreen:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                MedicalHistoryCubit(ServiceLocator.getIt<MedicalHistoryRepo>())
                  ..getMedicalHistoryList(uid: userModel.uid),
            child: MedicalHistoryScreen(userModel: userModel),
          ),
        );

      case AppRoutes.selectDoctorScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                SelectDoctorCubit(ServiceLocator.getIt<SelectDoctorRepo>())
                  ..getDoctorsBySpecialty(specialty: arguments['specialty']),
            child: SelectDoctorScreen(patient: arguments['patient']),
          ),
        );

      case AppRoutes.dietChartScreen:
        return MaterialPageRoute(builder: (_) => const DietChartScreen());

      case AppRoutes.settingsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final userModel = args['user'] as UserModel;
        final updateCubit = args['cubit'] as UpdateAccountCubit;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    LogoutCubit(ServiceLocator.getIt<LogoutRepo>()),
              ),
              BlocProvider.value(value: updateCubit),
            ],
            child: SettingsScreen(user: userModel),
          ),
        );

      case AppRoutes.doctorScreen:
        final userModel = settings.arguments as UserModel;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => DoctorFeatureCubit(
                  ServiceLocator.getIt<DoctorFeatureRepo>(),
                )..fetchBookedPatients(doctorId: userModel.uid),
              ),
              BlocProvider(
                create: (context) => UpdateAccountCubit(
                  ServiceLocator.getIt<UpdateUserInfoRepository>(),
                  ServiceLocator.getIt<UploadProfileImageRepo>(),
                  userModel: userModel,
                ),
              ),
            ],
            child: DoctorScreen(user: userModel),
          ),
        );

      case AppRoutes.appointmentDetailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => AppointmentDetailsScreen(
            doctor: arguments['doctor'],
            patientWithAppointment: arguments['patientWithAppointment'],
          ),
        );

      case AppRoutes.selectAppointmentScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AppointmentCubit(ServiceLocator.getIt<AppointmentRepo>()),
            child: SelectAppointmentScreen(
              doctorModel: arguments['doctorModel'],
              patientModel: arguments['patientModel'],
            ),
          ),
        );

      case AppRoutes.chooseSpecialtyScreen:
        final patientModel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => ChooseSpecialtyScreen(patient: patientModel),
        );

      case AppRoutes.bookingDetailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AppointmentCubit(ServiceLocator.getIt<AppointmentRepo>()),
            child: BookingDetailsScreen(
              patient: arguments['patient'],
              doctor: arguments['doctor'],
              appointment: arguments['appointment'],
            ),
          ),
        );
      default:
        return null;
    }
  }
}
