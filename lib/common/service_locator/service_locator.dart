import 'package:news_app_c16_6pm/features/articles/model/apis_data_source.dart';
import 'package:news_app_c16_6pm/features/articles/model/articles_data_source.dart';
import 'package:news_app_c16_6pm/features/articles/repository/articles_repository.dart';
import 'package:news_app_c16_6pm/features/articles/view_model/articles_provider.dart';

class ServiceLocator {
  static ArticlesDataSource articlesDataSource = ApisDataSource();
  static ArticlesRepository articlesRepository = ArticlesRepository(
    articlesDataSource: articlesDataSource,
  );
  static ArticlesProvider articlesProvider = ArticlesProvider(
    articlesRepository: articlesRepository,
  );
}
