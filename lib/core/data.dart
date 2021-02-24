class Data {
  static bool isSignedIn;
  static String email;
  static String displayName;
  static List barcodes;
  static String apiURL;
}

const Map<String, dynamic> defaultSettings = {
  'isLoggedIn': false,
  'email': '',
  'display_name': '',
};