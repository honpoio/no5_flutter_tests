import 'package:http/http.dart' as http;



class ConpassAPI{
  Future<String> fetchPosts(String searchWord ) async {
    http.Response response = await http.get('https://connpass.com/api/v1/event/?count=100&order=1&keyword=$searchWord');
    // http.Response response = await http.get('https://connpass.com/api/v1/event/?count=100&order=1&keyword=$searchWord');
      return response.body;

  }

}