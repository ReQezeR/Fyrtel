import 'package:fyrtel/src/features/article/domain/model/article_model.dart';

class MockArticlesData {
  static Article mockArticle({int id = 0, bool isForFree = false}) {
    return Article(
      name: 'name$id',
      title: 'title$id',
      description: 'description$id',
      imagePath: 'imagePath',
      isForFree: isForFree,
    );
  }

  static List<Article> mockArticles({int length = 1, bool? isPaid}) {
    List<Article> list = List.generate(
      length,
      (i) => mockArticle(isForFree: i % 2 == 1),
    );

    if (isPaid != null) {
      return list.where((article) => article.isForFree != isPaid).toList();
    } else {
      return list;
    }
  }
}
