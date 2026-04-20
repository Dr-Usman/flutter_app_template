enum APIMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  const APIMethod(this.value);
  final String value;
}

class ApiService {
  static const String baseUrl = "https://api.example.com";

  static Future<dynamic> request({
    required String endpoint,
    APIMethod method = APIMethod.get,
    Map<String, dynamic>? data,
  }) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Mock response based on endpoint
    switch (endpoint) {
      case '/login':
        return {
          'success': true,
          'token': 'mock_token_123',
          'user': {
            'id': 1,
            'name': 'John Doe',
            'email': 'john.doe@example.com',
          },
        };
      default:
        return {'success': false, 'message': 'Endpoint not found'};
    }
  }
}
