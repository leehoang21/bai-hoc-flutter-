import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_api/model/posts.dart';

class PostRequest {
  static List<Post> parsePost(String responseBody) {
    List<dynamic> list = jsonDecode(responseBody);

    return list.map((model) => Post.fromJson(model)).toList();
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    // cài đặt tham số POST request
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"title": "Hello", "body": "body text", "userId": 1}';
    Response response = await post(url, headers: headers, body: json);
    //
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('không tìm thấy');
    } else {
      throw Exception('không thể lấy Bài viết');
    }
  }
}
