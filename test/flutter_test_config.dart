import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';

import 'injectable.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return AlchemistConfig.runWithConfig(
    run: () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      configureDependencies();
      return testMain();
    },
    config: const AlchemistConfig(),
  );
}
