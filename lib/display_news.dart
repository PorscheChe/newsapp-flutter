// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newsapp/build_post.dart';
import 'package:newsapp/news_model.dart';
import 'package:newsapp/news_service.dart';

class DisplayNews extends StatefulWidget {
  const DisplayNews({super.key});

  @override
  State<DisplayNews> createState() => _DisplayNewsState();
}

class _DisplayNewsState extends State<DisplayNews> {
  Future<Status> status = fetchStatus();

  @override
  void initState() {
    super.initState();
    status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS"),
        shadowColor: Colors.black,
        elevation: 1,
      ),
      body: Center(
        child: FutureBuilder<Status>(
          future: status,
          builder: (context, abc) {
            if (abc.hasData) {
              final statusData = abc.data!;
              return buildPosts(statusData);
            } else if (abc.hasError) {
              return Text("$abc.error");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
