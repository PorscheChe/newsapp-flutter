import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/news_model.dart';

Future<Status> fetchStatus() async {
  var url =
      'https://newsapi.org/v2/top-headlines?country=th&category=business&apiKey=f3b44931f95248909a96416646483db3';

  var response = await http.get(Uri.parse(url));

  var body = response.body;
  //print(body);

  final jsonResponse = json.decode(body);

  // ignore: unnecessary_new
  Status status = new Status.fromJson(jsonResponse);
  //print(status.articles[0].author);
  return status;
}
