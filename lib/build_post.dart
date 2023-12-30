// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/news_model.dart';

Widget buildPosts(Status status) {
  return ListView.builder(
    itemCount: status.articles.length,
    itemBuilder: (context, index) {
      final statuss = status.articles;
      Widget networkSvg = SvgPicture.network(
        "https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg",
        width: 100,
        height: 100,
        placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(14),
          child: const CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
          ),
        ),
      );
      return Container(
        color: Colors.grey.shade300,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: 100,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Row(
          children: [
            networkSvg,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                    child: Text(
                      statuss[index].title.toString(),
                    ),
                  ),
                  Text("- ${statuss[index].author.toString()} - "),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
