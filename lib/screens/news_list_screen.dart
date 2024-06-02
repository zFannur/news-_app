import 'package:era_developers_test_flutter/app/app.dart';
import 'package:era_developers_test_flutter/blocs/blocs.dart';
import 'package:era_developers_test_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const AppAppBar(),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsLoadSuccess) {
                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28, bottom: 20),
                        child: Text('Featured', style: theme.textTheme.displayMedium),
                      ),
                      FeaturedCarousel(articles: state.featuredArticles),
                      Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: Text('Latest news', style: theme.textTheme.displayMedium),
                      ),
                      LatestNewsList(articles: state.latestArticles),
                    ],
                  );
                } else {
                  return const Center(child: Text('Failed to load news'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}