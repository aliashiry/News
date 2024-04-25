import 'dart:convert';
import 'package:app_news/data/api/api_constant.dart';
import 'package:app_news/data/model/NewsResponse.dart';
import 'package:app_news/data/model/SourceResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
/*
* https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
* 2834e41a6cd94fb484f8df821c7606fd
*/
  Future<SourceResponse?> getSources(String categoryId) async {
    Uri url =
        Uri.https(ApiConstants.baseUrlServer, ApiConstants.sourcesApiServer, {
      'apiKey': '2834e41a6cd94fb484f8df821c7606fd',
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      // var responseBody = response.body;
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

/*
* https://newsapi.org/v2/everything?q=bitcoin&apiKey=2834e41a6cd94fb484f8df821c7606fd
* https://newsapi.org/v2/everything?apiKey=2834e41a6cd94fb484f8df821c7606fd
* */
  Future<NewsResponse> getNewsBySourceId(
      {String? sourceId, String searchWords = ''}) async {
    Uri url =
        Uri.https(ApiConstants.baseUrlServer, ApiConstants.NewsApiServer, {
      'apiKey': '2834e41a6cd94fb484f8df821c7606fd',
      'sources': sourceId,
      'q': searchWords
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
