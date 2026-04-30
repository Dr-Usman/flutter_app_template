class ApiEndpoints {
  // static final ApiEndpoints _instance = ApiEndpoints._internal();
  // factory ApiEndpoints() => _instance;
  // ApiEndpoints._internal();

  static const String baseUrl = 'https://api.shapes.com/v1';

  // Auth Endpoints
  static const String authBase = '/auth';
  static const String login = '$authBase/login';
  static const String signup = '$authBase/signup';
  static const String forgotPassword = '$authBase/forgot-password';
  static const String resetPassword = '$authBase/reset-password';
}
