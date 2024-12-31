class ApiEndpoints {
  static const String _baseUrl = 'https://django-dev.aakscience.com';
  static var auth = _AuthEndpoints();
}

class _AuthEndpoints {
  final String signup = '${ApiEndpoints._baseUrl}/signup/';
}
