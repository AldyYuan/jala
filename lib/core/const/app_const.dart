class AppConst {
  // App Information
  static const String appName = 'Jala';
  static const String appVersion = '1.0.0';

  // Api URLS
  static const String baseApiUrl = 'https://app.jala.tech/api/';
  static const String shrimpPrices = '/shrimp_prices';
  static const String region = '/regions';
  static const String posts = '/posts';
  static const String diseases = '/diseases';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
