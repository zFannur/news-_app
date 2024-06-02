part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoadInProgress extends NewsState {}

class NewsLoadSuccess extends NewsState {
  final List<Article> featuredArticles;
  final List<Article> latestArticles;

  const NewsLoadSuccess(this.featuredArticles, this.latestArticles);

  @override
  List<Object> get props => [featuredArticles, latestArticles];
}

class NewsLoadFailure extends NewsState {}
