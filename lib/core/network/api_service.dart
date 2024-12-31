import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> post(String url, dynamic body) async {
    final response = await http.post(Uri.parse(url),
        body: body, headers: {'Content-Type': 'application/json'});
    return response;
  }
}
