import 'package:fyrtel/src/features/article/domain/article_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Injectable(as: ArticleRepository)
class MockArticleRepository with Mock implements ArticleRepository {}
