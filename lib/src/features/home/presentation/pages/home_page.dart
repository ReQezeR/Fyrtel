import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyrtel/src/di/injectable.dart';
import 'package:fyrtel/src/features/article/presentation/bloc/filtered_articles_bloc.dart';
import 'package:fyrtel/src/features/home/presentation/pages/landscape_home_layout.dart';
import 'package:fyrtel/src/features/home/presentation/pages/portrait_home_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilteredArticlesBloc>(
      create: (_) => locator<FilteredArticlesBloc>(),
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return const PortraitHomeLayout();
          } else {
            return const LandscapeHomePage();
          }
        },
      ),
    );
  }
}
