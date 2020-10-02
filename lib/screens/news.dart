import 'package:flutter/material.dart';
import 'package:reog_apps_flutter/models/article.dart';
import 'package:reog_apps_flutter/screens/widget/article_item.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Article> articles;

  @override
  Widget build(BuildContext context) {
    if (articles == null) {
      articles = List<Article>();
    }

    setDummyArticles();

    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(12.0),
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return ArticleItem(
              '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',
              articles[index].title,
              articles[index].description,
              articles[index].date);
        },
      ),
    );
  }

  void setDummyArticles() {
    for (int i = 0; i < 20; i++) {
      articles.add(Article(
          i.toString(),
          'Title $i Lorem ipsum dolor sit amet ipsum dolor sit amet ipsum dolor sit amet',
          '$i Lorem ipsum dolor sit amet ipsum dolor sit amet ipsum dolor sit amet',
          'Sun, $i Oct 20 08:30pm',
          200 + i,
          ['']));
    }
  }
}
