import 'package:news_app_c16_6pm/features/articles/model/articles_data_source.dart';
import 'package:news_app_c16_6pm/features/articles/model/articles_model.dart';
import 'package:news_app_c16_6pm/features/articles/model/source_mode.dart';

class ArticlesRepository {
  final ArticlesDataSource articlesDataSource;

  ArticlesRepository({required this.articlesDataSource});
  Future<SourceModel> getSources(String categoryId) async {
    return await articlesDataSource.getSources(categoryId);
  }

  Future<ArticlesModel> getArticles(String sourceId) async {
    return await articlesDataSource.getArticles(sourceId);
  }
}
