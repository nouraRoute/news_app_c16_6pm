import 'package:flutter/material.dart';
import 'package:news_app_c16_6pm/common/widgets/error_widget.dart';
import 'package:news_app_c16_6pm/features/articles/model/articles_model.dart';
import 'package:news_app_c16_6pm/features/articles/model/source_mode.dart';
import 'package:news_app_c16_6pm/features/articles/view/widgets/article_card_widget.dart';
import 'package:news_app_c16_6pm/features/articles/view_model/articles_provider.dart';
import 'package:news_app_c16_6pm/features/categories/view_model/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider provider = Provider.of<CategoryProvider>(context);
    return ChangeNotifierProvider(
      create: (context) =>
          ArticlesProvider()..getSources(provider.selectedCategory!.name),
      child: Consumer<ArticlesProvider>(
        builder: (context, viewModel, child) {
          if (viewModel.sourcesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.sourcesError != null) {
            return ErrorView(
              error: viewModel.sourcesError!,
              onRefresh: () =>
                  viewModel.getSources(provider.selectedCategory!.name),
            );
          }
          List<Sources> sources = viewModel.sources?.sources ?? [];
          return DefaultTabController(
            length: sources.length,
            child: Column(
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // indicatorPadding: EdgeInsetsGeometry.all(0),
                  tabAlignment: TabAlignment.start,
                  tabs: sources.map((e) => Tab(text: e.name ?? '')).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: sources
                        .map((e) => ArticlesList(sourceID: e.id!))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ArticlesList extends StatefulWidget {
  const ArticlesList({super.key, required this.sourceID});
  final String sourceID;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ArticlesProvider>().getArticles(widget.sourceID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.articlesLoading || viewModel.articles == null) {
          return Center(child: CircularProgressIndicator());
        } else if (viewModel.articlesError != null) {
          return ErrorView(
            error: viewModel.articlesError!,
            onRefresh: () => viewModel.getArticles(widget.sourceID),
          );
        }
        ArticlesModel articlesModel = viewModel.articles!;
        List<Articles> articles = articlesModel.articles ?? [];

        return RefreshIndicator(
          onRefresh: () async {
            viewModel.getArticles(widget.sourceID);
          },
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                ArticleCardWidget(articles: articles[index]),
          ),
        );
      },
    );
  }
}
