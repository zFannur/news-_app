import 'package:cached_network_image/cached_network_image.dart';
import 'package:era_developers_test_flutter/blocs/blocs.dart';
import 'package:era_developers_test_flutter/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:era_developers_test_flutter/repositories/news/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedCarousel extends StatelessWidget {
  final List<Article> articles;

  const FeaturedCarousel({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: PageView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return GestureDetector(
            onTap: () {
              context.read<NewsBloc>().add(ReadArticle(article.id));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(article: article),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(4, 4), // x4, y4
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: article.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.7), // 30% opacity
                      ),
                      Positioned(
                        bottom: 40,
                        left: 20,
                        right: 68,
                        child: Text(
                          article.title,
                          maxLines: 2,
                          style: theme.textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}