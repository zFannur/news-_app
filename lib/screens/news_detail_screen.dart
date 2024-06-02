import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:era_developers_test_flutter/repositories/news/repository.dart';
import 'package:flutter_svg/svg.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      imageUrl: article.imageUrl,
                      height: 496,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    height: 496,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 87),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0), // Увеличивает радиус нажатия
                        child: Transform.rotate(
                          angle: -90 * 3.141592653589793 / 180,
                          child: SvgPicture.asset(
                            'assets/vectors/vector_2_x2.svg',
                            width: 24,
                            height: 9,
                            colorFilter: ColorFilter.mode(
                              theme.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 48,
                    right: 96,
                    child: Text(
                      article.title,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 21.0, vertical: 20.0),
              child: Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
