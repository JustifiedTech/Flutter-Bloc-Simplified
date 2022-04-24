import 'package:http/http.dart' as http;

class IpInfoService {
  IpInfoService._sharedInstance();
  final IpInfoService instance = IpInfoService._sharedInstance();

  Future<String?> getIpAddress() async {
    final url = Uri.parse('https://api.ipify.org');
    try {
      final response = await http.get(url);
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      return null;
    }
  }
}
