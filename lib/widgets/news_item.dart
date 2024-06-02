import 'package:cached_network_image/cached_network_image.dart';
import 'package:era_developers_test_flutter/blocs/blocs.dart';
import 'package:era_developers_test_flutter/repositories/news/repository.dart';
import 'package:era_developers_test_flutter/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  final Color containerColor;

  const NewsItem({
    Key? key,
    required this.article,
    required this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
      child: Container(
        height: 103,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: article.readed ? theme.hintColor : containerColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // 10% opacity black
              offset: const Offset(4, 4),
              blurRadius: 20,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.6), // 60% opacity white
              offset: const Offset(-4, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl: article.imageUrl,
                  width: 90,
                  height: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.9), // Line height set to 1.9
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${DateTime.now().difference(article.publicationDate).inDays} days ago',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
