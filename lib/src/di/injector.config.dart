// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/config/size_config.dart' as _i7;
import '../core/sizes/landscape_app_sizes.dart' as _i5;
import '../core/sizes/portrait_app_sizes.dart' as _i6;
import '../features/article/domain/article_repository.dart' as _i3;
import '../features/article/presentation/filtered_articles/filtered_articles_bloc.dart'
    as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ArticleRepository>(() => _i3.ArticleRepository());
  gh.factory<_i4.FilteredArticlesBloc>(
      () => _i4.FilteredArticlesBloc(gh<_i3.ArticleRepository>()));
  gh.lazySingleton<_i5.LandscapeAppSizes>(() => _i5.LandscapeAppSizes());
  gh.lazySingleton<_i6.PortraitAppSizes>(() => _i6.PortraitAppSizes());
  gh.singleton<_i7.SizeConfig>(() => _i7.SizeConfig());
  return getIt;
}
