part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {}

class MarkAllRead extends NewsEvent {}

class ReadArticle extends NewsEvent {
  final String articleId;

  const ReadArticle(this.articleId);

  @override
  List<Object> get props => [articleId];
}
