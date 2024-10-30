import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/auth/auth_model.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';

class UserPreference {
  Future<bool> saveUser(
    UserData userData,
    // List<Branch> branch,
    // List<Privilage> privilages,
  ) async {
    LocalStorageKey.userName = userData.name ?? 'Error';
    LocalStorageKey.stallId = userData.stallId.toString();
    // LocalStorageKey.roleName = userData.rolename ?? 'Error';
    // LocalStorageKey.empId = userData.employeeId ?? 'Error';
    // LocalStorageKey.userBranch = branch;
    // LocalStorageKey.privilage = privilages;
    return true;
  }

  Future<dynamic> getUser() async {
    var box = Hive.box('token');

    // SharedPreferences sp = await SharedPreferences.getInstance();

    String? storedValue = box.get('token');

    return storedValue;
  }

  Future<void> addToken(String token) async {
    final box1 = Hive.box('token');

    await box1.put('token', token);

    await box1.add(token);
  }

  Future<void> addMac(String type) async {
    final box1 = Hive.box('token');

    await box1.put('macId', type);
  }

  Future<bool> removeUser() async {
    final tokenBox = Hive.box('token');

    tokenBox.clear();
    return true;
  }

  void goToSplash() async {
    Get.rootDelegate.offNamed(Routes.login);
  }

  // void goToSplas1h() async {
  //   Get.rootDelegate.offNamed(Routes.root);
  // }
}
