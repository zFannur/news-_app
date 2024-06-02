import 'package:era_developers_test_flutter/repositories/news/mock_news_repository.dart';
import 'package:era_developers_test_flutter/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'blocs/blocs.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NewsBloc(MockNewsRepository())..add(FetchNews()),
        child: const NewsListScreen(),
      ),
    );
  }
}
