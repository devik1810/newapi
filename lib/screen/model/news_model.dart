class NewsModel {
  String? status;
  int? totalResult;

  List<ArticleModel>? articleList = [];

  NewsModel({this.status, this.totalResult, this.articleList});

  NewsModel newsFromJson(Map m1) {
    status = m1['status'];
    totalResult = m1['totalResults'];

    List alist = m1['articles'];

    articleList = alist.map((e) => ArticleModel().articalFromJson(e)).toList();

    NewsModel n1 = NewsModel(
        articleList: articleList, status: status, totalResult: totalResult);
    return n1;
  }
}

class ArticleModel {
  String? author, title, desc, url, urltoimg, publishedAt, content;
  SourceModel? s1;

  ArticleModel(
      {this.author,
        this.title,
        this.desc,
        this.url,
        this.urltoimg,
        this.publishedAt,
        this.content,
        this.s1});

  ArticleModel articalFromJson(Map m1) {
    author = m1['author'];
    title = m1['title'];
    desc = m1['description'];
    url = m1['url'];
    urltoimg = m1['urlToImage'];
    publishedAt = m1['publishedAt'];
    content = m1['content'];
    s1 = SourceModel().sourceFromJson(m1['source']);

    ArticleModel a1 = ArticleModel(
        title: title,
        author: author,
        desc: desc,
        url: url,
        urltoimg: urltoimg,
        publishedAt: publishedAt,
        content: content,
        s1: s1);

    return a1;
  }
}

class SourceModel {
  String? id, name;

  SourceModel({this.id, this.name});

  SourceModel sourceFromJson(Map m1) {
    id = m1['id'];
    name = m1['name'];

    SourceModel s1 = SourceModel(id: id, name: name);
    return s1;
  }
}