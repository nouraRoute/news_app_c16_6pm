import 'package:news_app_c16_6pm/common/error/response_model.dart';
import 'package:news_app_c16_6pm/features/articles/domain/entities/article_entity.dart';
import 'package:news_app_c16_6pm/features/articles/domain/entities/source_entity.dart';

abstract class ArticlesRepository {
  Future<Response<List<ArticleEntity>>> getArticles(String sourceId);
  Future<Response<List<SourceEntity>>> getSources(String catId);
}
