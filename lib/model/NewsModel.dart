class NewsModel{
  String _sourceName;
  String _title;
  String _description;
  String _website;
  String _urlToImage;
  String _publishedAt;

  String get sourceName => _sourceName;

  String get title => _title;

  String get publishedAt => _publishedAt;

  String get urlToImage => _urlToImage;

  String get website => _website;

  String get description => _description;

  NewsModel.fromJson(dynamic json){
     _sourceName=json['source']['name'];
     _title=json['title'];
     _description=json['description'];
     _website=json['url'];
     _urlToImage=json['urlToImage'];
     _publishedAt=json['publishedAt'];

  }
}