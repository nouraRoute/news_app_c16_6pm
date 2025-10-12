import 'package:flutter/material.dart';
import 'package:news_app_c16_6pm/common/extention/theme_extention.dart';
import 'package:news_app_c16_6pm/enums/category_enum.dart';
import 'package:news_app_c16_6pm/pages/widgets/category_card.dart';

class MainLayerPage extends StatelessWidget {
  const MainLayerPage({super.key});
  static const String routeName = '/mainLayerPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'Home', //TODO:localization
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '''Good Morning
Here is Some News For You''',
              style: context.getTextTheme.titleMedium!.copyWith(fontSize: 24),
            ),
            ...List.generate(
              CategoryEnum.values.length,
              (index) => CategoryCard(
                categoryEnum: CategoryEnum.values[index],
                isRight: (index % 2 == 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
