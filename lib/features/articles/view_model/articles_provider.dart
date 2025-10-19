import 'package:flutter/material.dart';
import 'package:news_app_c16_6pm/features/articles/model/apis_service.dart';
import 'package:news_app_c16_6pm/features/articles/model/articles_model.dart';
import 'package:news_app_c16_6pm/features/articles/model/source_mode.dart';

class ArticlesProvider extends ChangeNotifier {
  SourceModel? sources;
  ArticlesModel? articles;
  String? sourcesError, articlesError;
  bool sourcesLoading = false, articlesLoading = false;
  getSources(String catName) async {
    sourcesError = null;
    sourcesLoading = true;
    notifyListeners();
    try {
      sources = await ApisService.getSources(catName);
    } catch (e) {
      sourcesError = e.toString();
    }
    sourcesLoading = false;
    notifyListeners();
  }

  getArticles(String sourceId) async {
    articlesError = null;
    articlesLoading = true;
    notifyListeners();
    try {
      articles = await ApisService.getArticles(sourceId);
    } catch (e) {
      articlesError = e.toString();
    }
    articlesLoading = false;
    notifyListeners();
  }
}
