import 'package:wallpaperflutter/models/categories_model.dart';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/3573555/pexels-photo-3573555.jpeg?cs=srgb&dl=cloth-with-artistic-design-3573555.jpg&fm=jpg";
  categoriesModel.categoryName = "Abstract";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/161154/stained-glass-spiral-circle-pattern-161154.jpeg?cs=srgb&dl=worms-eye-view-of-spiral-stained-glass-decors-through-the-161154.jpg&fm=jpg";
  categoriesModel.categoryName = "Art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/3230927/pexels-photo-3230927.jpeg?cs=srgb&dl=burj-khalifa-dubai-at-night-3230927.jpg&fm=jpg";
  categoriesModel.categoryName = "Dark";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/573294/pexels-photo-573294.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.categoryName = "Black & White";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1393996/pexels-photo-1393996.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoryName = "Drone";

  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1331386/pexels-photo-1331386.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoryName = "Bokehlicious";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}
