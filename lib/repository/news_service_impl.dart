import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/repository/news_service.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
export 'news_service.dart';
import 'package:http/http.dart' show Client;

const String _baseUrl = 'https://newsapi.org/v2';
const String _topHeadlinesParam = '/top-headlines';
const String _everythingParam = '/everything';
const String _apiKeyParam = 'apiKey=a08fb4100ddf4622ba34a2f2faf6367b';
const String _countryParam = 'country=us';
const int timeoutDuration = 7000;


class NewsServiceImpl implements NewsService {

  Client client = Client();

  @override
  Future<NewsRes> fetchHeadlines() async {
    final String _url = '$_baseUrl$_topHeadlinesParam?$_countryParam&$_apiKeyParam';
    final res = await client.get(_url).timeout(Duration(milliseconds: timeoutDuration));
    final json = jsonDecode(res.body);

    print('response for fetchHeadlines - $json');

    return NewsRes.fromJson(json);
  }

  @override
  Future<NewsRes> searchNews({@required String query}) async {
    final String _url = '$_baseUrl$_everythingParam?$_apiKeyParam&q=$query';
    final res = await client.get(_url).timeout(Duration(milliseconds: timeoutDuration));
    final json = jsonDecode(res.body);

    print('response for fetchEverything - $json');

    return NewsRes.fromJson(json);
  }

}