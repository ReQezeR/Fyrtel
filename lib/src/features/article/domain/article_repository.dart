import 'package:fyrtel/src/features/article/domain/model/article_model.dart';
import 'package:injectable/injectable.dart';

abstract class ArticleRepository {
  Future<List<Article>> loadArticles();
}

@Injectable(as: ArticleRepository)
class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl();

  Future<List<Article>> loadArticles() async {
    return const [
      Article(
        name: 'Muzeum Kopalnia',
        title: "Dłuższe godziny zwiedzania Muzeum",
        isForFree: false,
        imagePath: "assets/images/museum Medium.jpeg",
      ),
      Article(
        name: 'Carbonerum 1',
        title: "Carbonerum \ndla licealistów",
        imagePath: "assets/images/elephant Medium.jpeg",
      ),
      Article(
        name: 'The Lights',
        title: "The Lights nie tylko dla licealistów",
        isForFree: true,
        imagePath: "assets/images/lights Medium.jpeg",
      ),
      Article(
        name: 'Muzeum Planetarium',
        title: "Dłuższe godziny zwiedzania Muzeum",
        isForFree: false,
        imagePath: "assets/images/planetarium Medium.jpeg",
      ),
      Article(
        name: 'Carbonerum Stadion',
        title: "Carbonerum nie tylko dla licealistów",
        imagePath: "assets/images/stadium Medium.jpeg",
      ),
      Article(
        name: 'Muzeum Opera',
        title: "Dłuższe godziny zwiedzania Muzeum",
        isForFree: false,
        imagePath: "assets/images/opera Medium.jpeg",
      ),
      Article(
        name: 'Muzeum Carboneum',
        title: "Carbonerum nie tylko dla licealistów",
        imagePath: "assets/images/carboneum Medium.jpeg",
      ),
      Article(
        name: 'Muzeum Kopice',
        title: "Dłuższe godziny zwiedzania Muzeum",
        isForFree: false,
        imagePath: "assets/images/museum Medium.jpeg",
      )
    ];
  }
}
