import 'package:assignment_5/model/models.dart';
import 'package:http/http.dart' as http;

class PostHelper {
  Future<List<Welcome>?> getPost() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
