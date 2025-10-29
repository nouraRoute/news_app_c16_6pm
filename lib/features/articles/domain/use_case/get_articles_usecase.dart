import 'package:injectable/injectable.dart';
import 'package:news_app_c16_6pm/common/error/response_model.dart';
import 'package:news_app_c16_6pm/features/articles/domain/entities/article_entity.dart';
import 'package:news_app_c16_6pm/features/articles/domain/repository/articles_repository.dart';

@injectable
class GetArticlesUsecase {
  final ArticlesRepository _articlesRepository;

  GetArticlesUsecase({required ArticlesRepository articlesRepository})
    : _articlesRepository = articlesRepository;

  Future<Response<List<ArticleEntity>>> call(String sourceId) async {
    return await _articlesRepository.getArticles(sourceId);
  }
}
