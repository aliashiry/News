import 'package:app_news/model/category_home.dart';
import 'package:app_news/pages/search_widget.dart';
import 'package:app_news/theme/my_theme.dart';
import 'package:app_news/widgets/category/category_details.dart';
import 'package:app_news/widgets/category/category_fragment_home.dart';
import 'package:app_news/widgets/drawer/home_drawer.dart';
import 'package:app_news/widgets/future_tabs/settings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedMenuItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: NewsSearch());
                    },
                    child: Icon(Icons.search)),
              ),
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryItemClick: onCategoryItemClickAction,
                    )
                  : CategoryDetails(categoryDM: selectedCategory!),
        ),
      ],
    );
  }

  CategoryDataModel? selectedCategory;

  void onCategoryItemClickAction(CategoryDataModel newSelectedCategory) {
    // todo : newSelectedCategory => User
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
