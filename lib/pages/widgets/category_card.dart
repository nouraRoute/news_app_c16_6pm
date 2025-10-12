import 'package:flutter/material.dart';
import 'package:news_app_c16_6pm/common/extention/theme_extention.dart';
import 'package:news_app_c16_6pm/enums/category_enum.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryEnum,
    required this.isRight,
  });
  final CategoryEnum categoryEnum;
  final bool isRight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 200,
      alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(categoryEnum.imagePath)),
        borderRadius: BorderRadius.circular(25),
        color: context.getTheme.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            categoryEnum.name,
            style: context.getTextTheme.displayLarge!.copyWith(
              fontSize: 24,
              color: context.getTheme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
