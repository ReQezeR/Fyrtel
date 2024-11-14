import 'package:fyrtel/src/core/const/_index.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies({String environment = Env.prod}) {
  $initGetIt(locator, environment: environment);
}
