import 'package:fyrtel/src/core/const/environments.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  asExtension: true,
  generateForDir: ['test'],
  preferRelativeImports: true,
)
void configureDependencies({String environment = Env.test}) => locator.init();
