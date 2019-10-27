
class NewsRes {
  final int _totalResults;
  final List<Article> _articles;


  NewsRes(this._totalResults, this._articles);

  NewsRes.fromJson(Map<String, dynamic> parsedJson)
      : _totalResults = parsedJson['totalResults'],
        _articles = (parsedJson['articles'] as List).map((article) => Article.fromJson(article)).toList();

  List<Article> get articles => _articles;

  int get totalResults => _totalResults;

}


class Article {
  final String _author;
  final String _title;
  final String _description;
  final String _url;
  final String _urlToImage;
  final String _publishedAt;
  final String _content;


  Article(this._author, this._title, this._description, this._url,
      this._urlToImage, this._publishedAt, this._content);

  Article.fromJson(Map<String, dynamic> parsedJson)
    : _author = parsedJson['author'],
      _title = parsedJson['title'],
      _description = parsedJson['description'],
      _url = parsedJson['url'],
      _urlToImage = parsedJson['urlToImage'],
      _publishedAt = parsedJson['publishedAt'],
      _content = parsedJson['content'];

  String get content => _content;

  String get publishedAt => _publishedAt;

  String get urlToImage => _urlToImage;

  String get url => _url;

  String get description => _description;

  String get title => _title;

  String get author => _author;


}