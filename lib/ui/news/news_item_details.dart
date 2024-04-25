
import 'package:app_news/data/model/NewsResponse.dart';
import 'package:app_news/ui/pages/web_view.dart';
import 'package:app_news/ui/theme/my_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatelessWidget {
  static const routeName = 'news_item_details';
  final f = DateFormat.jm();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as News;
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: args.urlToImage ?? '',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.30,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        backgroundColor: MyTheme.primaryLightColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    args.author ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.greyColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(args.title ?? '',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 8,
                  ),

                  //  Text(f.format(new DateTime.fromMillisecondsSinceEpoch((news.publishedAt!*1000) as int))),
                  Text(
                    f.format(DateTime.parse(args.publishedAt.toString())),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      // Assuming titleSmall is not available
                      color: MyTheme.greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    args.description ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'View Full Article',
                        textAlign: TextAlign.end,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return WebView(news: args.url ?? '');
                                }));
                          },
                          icon: const Icon(
                            Icons.play_arrow_sharp,
                            color: Colors.black,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
