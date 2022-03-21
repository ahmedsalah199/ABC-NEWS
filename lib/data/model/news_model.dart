class NewsModel {
  String? title ;
  String? url ;
  String? urlToImage ;
  String? publishedAt ;
  NewsModel ({this.title,this.url,this.urlToImage,this.publishedAt});
  NewsModel.fromJson (Map<String,dynamic> json) {
    title = json["title"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
  }
}