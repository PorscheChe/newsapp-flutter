class Status {
  final String? status;
  final int? totalResults;
  final List<News> articles;

  Status(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory Status.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson["articles"] as List;
    print(list.runtimeType);
    List<News> newsList = list.map((i) => News.fromJson(i)).toList();

    return Status(
        status: parsedJson['status'],
        totalResults: parsedJson['totalResults'],
        articles: newsList);
  }
}

class News {
  final String? author;
  final String? title;
  final String? url;

  News({required this.author, required this.title, required this.url});

  factory News.fromJson(Map<String, dynamic> parsedJson) {
    return News(
        author: parsedJson["author"],
        title: parsedJson["title"],
        url: parsedJson["description"]);
  }
}
