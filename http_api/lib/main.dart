import 'package:flutter/material.dart';
import 'package:http_api/model/posts.dart';
import 'package:http_api/network/get_request.dart';
import 'package:http_api/network/post_request.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Post> postData = [];

  @override
  void initState() {
    super.initState();
    PostRequest.fetchPosts().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: postData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Text(
                '''
              userId :  ${postData[index].userId}
              id     :  ${postData[index].id}
              title  :  ${postData[index].title}
              body   : ${postData[index].body}''',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
            );
          },
        ));
  }
}
