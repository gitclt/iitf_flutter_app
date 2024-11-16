// const String kBaseUrl = "https://crmtrail.demospro2023.tk";

const String kBaseUrl = s1;
// const String kBaseUrlForImage = "$kBaseUrl/public/assets/web";
const bool isStaging = true;

//const String s1 = "http://192.168.1.101:8088/api";
const String s1 = "http://iitfkeralapavilion.com/api";

class LocalStorageKey {
  static String token = "USER_TOKEN";
  static String type = "USER_TYPE";
  static String stallId = "STALL_ID";
  static double rating = 5;
  static String stallName = "STALL_NAME";
  static String userName = "USER_NAME";
  static String address = "ADDRESS";
  static String phone = "PHONE";
  static String department = "DEPARTMENT";
  static String websiteAddress = "WEBSITE";
  static String image = "IMAGE";
}

class AppSettings {
  int appVersionNo = 18;
  String versioncode = '1.0.18';
  bool isStaging = true;
  int timeout = 10;

  static String userId = '';
  String name = '';
}
