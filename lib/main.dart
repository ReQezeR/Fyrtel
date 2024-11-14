import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:fyrtel/src/core/theme/app_theme.dart';
import 'package:fyrtel/src/di/injectable.dart';
import 'package:fyrtel/src/features/home/presentation/pages/home_page.dart';
import 'package:fyrtel/src/shared/widgets/navigation/navigation_wrapper.dart';
import 'package:fyrtel/src/shared/widgets/size_config_wrapper.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox<bool>('favoritesBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SizeConfigWraper(
        child: Scaffold(
          body: NavigationWrapper(
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
