import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/repository/headlines_service.dart';
import 'dart:convert';
export 'headlines_service.dart';
import 'package:http/http.dart' show Client;

const String _baseUrl = 'https://newsapi.org/v2';
const String _topHeadlinesParam = '/top-headlines';
const String _apiKeyParam = 'apiKey=a08fb4100ddf4622ba34a2f2faf6367b';
const String _countryParam = 'country=us';


class HeadlinesServiceImpl implements HeadlinesService {

  Client client = Client();

  @override
  Future<HeadlinesRes> fetchHeadlines() async {
    final String _url = '$_baseUrl$_topHeadlinesParam?$_countryParam&$_apiKeyParam';
    final res = await client.get(_url);
    final json = jsonDecode(res.body);

    print('response for fetchHeadlines - $json');

    return HeadlinesRes.fromJson(json);
  }

}