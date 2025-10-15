import 'package:flutter/widgets.dart';
import 'package:news_app_c16_6pm/enums/category_enum.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryEnum? selectedCategory;
  selectCategory(CategoryEnum category) {
    selectedCategory = category;
    notifyListeners();
  }

  emptyCategory() {
    selectedCategory = null;
    notifyListeners();
  }
}
