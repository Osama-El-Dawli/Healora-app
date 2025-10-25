import 'package:healora/features/auth/register/data/models/user_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class HiveManager {
  static const String hiveUserBox = 'user_box';
  static const String hiveSettingsBox = 'settings';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>(hiveUserBox);
    await Hive.openBox(hiveSettingsBox);
  }

  static Future<void> saveUser(UserModel user) async {
    await Hive.openBox<UserModel>(hiveUserBox);
    await Hive.box<UserModel>(hiveUserBox).put(user.uid, user);
  }

  static UserModel? getUser() {
    final box = Hive.box<UserModel>(hiveUserBox);
    return box.values.firstOrNull;
  }

  static Future<void> removeUser(String uid) async {
    await Hive.openBox<UserModel>(hiveUserBox);
    await Hive.box<UserModel>(hiveUserBox).delete(uid);
  }

  static bool isOnboardingVisited() {
    final box = Hive.box(hiveSettingsBox);
    return box.get('onboardingVisited', defaultValue: false);
  }

  static void setOnboardingVisited() {
    final box = Hive.box(hiveSettingsBox);
    box.put('onboardingVisited', true);
  }
}
