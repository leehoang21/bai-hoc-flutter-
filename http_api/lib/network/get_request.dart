import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_api/model/posts.dart';

class GetRequest {
  static Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  static List<Post> parsePost(String responseBody) {
    List<dynamic> list = jsonDecode(responseBody);

    return list.map((model) => Post.fromJson(model)).toList();
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await get(url);
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('không tìm thấy');
    } else {
      throw Exception('không thể lấy Bài viết');
    }
  }
}
