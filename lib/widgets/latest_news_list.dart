import 'package:flutter/material.dart';
import 'package:era_developers_test_flutter/repositories/news/repository.dart';

import 'news_item.dart';

class LatestNewsList extends StatelessWidget {
  final List<Article> articles;

  const LatestNewsList({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return NewsItem(
            article: article,
            containerColor: theme.primaryColor,
          );
        },
      ),
    );
  }
}