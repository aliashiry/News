import 'package:app_news/dependency_injection/dependency_injection_category.dart';
import 'package:app_news/model/category_home.dart';
import 'package:app_news/theme/my_theme.dart';
import 'package:app_news/widgets/category/cubit/category_details_view_model.dart';
import 'package:app_news/widgets/category/cubit/states.dart';
import 'package:app_news/widgets/future_tabs/tab_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  CategoryDataModel categoryDM;

  CategoryDetails({required this.categoryDM});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(sourceRepositoryContract: injectSourceRepositoryContract());

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getDetails(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingSourceState) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.primaryLightColor,
            ),
          );
        } else if (state is FailedSourceState) {
          return Column(
            children: [
              Text('Something went wrong '),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getDetails(widget.categoryDM.id);
                  },
                  child: Text('Try Again'))
            ],
          );
        } else if (state is SuccessSourceState) {
          return TabHomeWidget(sourcesList: state.sourcesList);
        }
        return Container();
      },
    );

    // FutureBuilder<SourceResponse?>(
    //     future: ApiManager.getSources(widget.categoryDM.id),
    //     builder: (context, snapshot) {
    //       /// handle future loading data
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             backgroundColor: MyTheme.primaryLightColor,
    //           ),
    //         );
    //
    //         /// handel user network disable => catch Api getSources (throw e)
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text('Something went wrong '),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.categoryDM.id);
    //                   setState(() {});
    //                 },
    //                 child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //
    //       /// server ( success   == error)
    //       if (snapshot.data?.status != 'ok') {
    //         return Column(
    //           children: [
    //             Text(snapshot.data!.message!),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.categoryDM.id);
    //                   setState(() {});
    //                 },
    //                 child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       var sourcesList = snapshot.data?.sources ?? [];
    //       return TabHomeWidget(sourcesList: sourcesList);
    //     });
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 2834e41a6cd94fb484f8df821c7606fd

 */
