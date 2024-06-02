import 'package:era_developers_test_flutter/repositories/news/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final AbstractNewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
    on<MarkAllRead>(_onMarkAllRead);
    on<ReadArticle>(_onReadArticle);
  }

  void _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoadInProgress());
    try {
      final featuredArticles = await newsRepository.getFeaturedArticles();
      final latestArticles = await newsRepository.getLatestArticles();
      emit(NewsLoadSuccess(featuredArticles, latestArticles));
    } catch (_) {
      emit(NewsLoadFailure());
    }
  }

  void _onMarkAllRead(MarkAllRead event, Emitter<NewsState> emit) async {
    if (state is NewsLoadSuccess) {
      final currentState = state as NewsLoadSuccess;
      final updatedFeaturedArticles = currentState.featuredArticles.map((article) {
        return article.copyWith(readed: true);
      }).toList();
      final updatedLatestArticles = currentState.latestArticles.map((article) {
        return article.copyWith(readed: true);
      }).toList();
      emit(NewsLoadSuccess(updatedFeaturedArticles, updatedLatestArticles));
    }
  }

  void _onReadArticle(ReadArticle event, Emitter<NewsState> emit) async {
    if (state is NewsLoadSuccess) {
      final currentState = state as NewsLoadSuccess;
      final updatedFeaturedArticles = currentState.featuredArticles.map((article) {
        if (article.id == event.articleId) {
          return article.copyWith(readed: true);
        }
        return article;
      }).toList();
      final updatedLatestArticles = currentState.latestArticles.map((article) {
        if (article.id == event.articleId) {
          return article.copyWith(readed: true);
        }
        return article;
      }).toList();
      emit(NewsLoadSuccess(updatedFeaturedArticles, updatedLatestArticles));
    }
  }
}