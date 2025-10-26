import 'package:news_app_c16_6pm/features/articles/model/articles_model.dart';
import 'package:news_app_c16_6pm/features/articles/model/source_mode.dart';

abstract class ArticlesDataSource {
  Future<ArticlesModel> getArticles(String sourceID);
  Future<SourceModel> getSources(String catId);
}
