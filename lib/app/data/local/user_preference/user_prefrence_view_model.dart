import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:iitf_flutter_tab/app/data/model/auth/auth_model.dart';
import 'package:iitf_flutter_tab/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(
    UserData userData,
    // List<Branch> branch,
    // List<Privilage> privilages,
  ) async {
    await addUserDataToLocalStorage(userData);
    await setUserLocalData();

    // LocalStorageKey.userName = userData.name ?? '';
    // LocalStorageKey.stallId = userData.stallId.toString();
    // LocalStorageKey.stallName = userData.name.toString();
    // LocalStorageKey.address = userData.address ?? '';
    // LocalStorageKey.phone = userData.mobile ?? '';
    // LocalStorageKey.websiteAddress = userData.address ?? '';
    // LocalStorageKey.department = userData.department ?? '';
    // LocalStorageKey.rating = userData.rating ?? 5.0;
    return true;
  }

  Future setUserLocalData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    LocalStorageKey.userName = sp.getString('userName') ?? '';
    LocalStorageKey.stallId = sp.getString('stallId') ?? '';
    LocalStorageKey.stallName = sp.getString('stallName') ?? '';
    LocalStorageKey.address = sp.getString('address') ?? '';
    LocalStorageKey.phone = sp.getString('phone') ?? '';
    LocalStorageKey.websiteAddress = sp.getString('websiteAddress') ?? '';
    LocalStorageKey.department = sp.getString('department') ?? '';
    LocalStorageKey.rating = sp.getDouble('rating') ?? 5.0;
  }

  Future addUserDataToLocalStorage(
    UserData userData,
  ) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('userName', userData.name ?? '');
    await sp.setString('stallId', userData.stallId.toString());
    await sp.setString('stallName', userData.name ?? '');
    await sp.setString('address', userData.address ?? '');
    await sp.setString('phone', userData.mobile ?? '');
    await sp.setString('websiteAddress', userData.websiteAddress ?? '');
    await sp.setString('department', userData.department ?? '');
    await sp.setDouble('rating', userData.rating ?? 5.0);
  }

  Future<dynamic> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? storedValue = sp.getString('token');

    return storedValue;
  }

  Future<dynamic> isLoged() async {
    //SharedPreferences sp = await SharedPreferences.getInstance();
    await setUserLocalData();
    String? storedValue = LocalStorageKey.userName;

    return storedValue;
  }

  Future<void> addToken(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', token);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.clear();
    return true;
  }

  void goToSplash() async {
    Get.rootDelegate.offNamed(Routes.login);
  }

  // void goToSplas1h() async {
  //   Get.rootDelegate.offNamed(Routes.root);
  // }
}
