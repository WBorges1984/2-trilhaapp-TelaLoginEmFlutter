import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilhaapp/model/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    var respose =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (respose.statusCode == 200) {
      var json = jsonDecode(respose.body);
      return (json as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
