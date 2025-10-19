import 'package:flutter/material.dart';
import 'package:news_app_c16_6pm/features/articles/view/category_details_view.dart';
import 'package:news_app_c16_6pm/features/categories/view/views/category_view.dart';
import 'package:news_app_c16_6pm/features/categories/view/views/home_dreawer.dart';
import 'package:news_app_c16_6pm/features/categories/view_model/category_provider.dart';
import 'package:provider/provider.dart';

class MainLayerPage extends StatelessWidget {
  const MainLayerPage({super.key});
  static const String routeName = '/mainLayerPage';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: Consumer<CategoryProvider>(
        builder: (BuildContext context, CategoryProvider value, Widget? child) {
          return Scaffold(
            drawer: HomeDrawer(),
            appBar: AppBar(
              title: Text(
                value.selectedCategory != null
                    ? value.selectedCategory!.name
                    : 'Home', //TODO:localization
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            body: value.selectedCategory != null
                ? CategoryDetailsView()
                : CategoryListView(),
          );
        },
      ),
    );
  }
}
