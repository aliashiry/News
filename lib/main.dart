import 'package:app_news/bloc_observer.dart';
import 'package:app_news/ui/news/news_item_details.dart';
import 'package:app_news/ui/pages/home_screen.dart';
import 'package:app_news/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsItemDetails.routeName: (context) => NewsItemDetails(),
      },
      theme: MyTheme.LightTheme,
    );
  }
}
