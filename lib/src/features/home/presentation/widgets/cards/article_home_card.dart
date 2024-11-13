import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyrtel/src/core/extensions/build_context.dart';
import 'package:fyrtel/src/features/article/domain/model/article_model.dart';
import 'package:fyrtel/src/features/favourite/presentation/bloc/favourite_article_cubit.dart';
import 'package:fyrtel/src/features/favourite/presentation/widgets/favourite_button.dart';
import 'package:fyrtel/src/features/home/presentation/widgets/cards/home_card_wrapper.dart';
import 'package:fyrtel/src/shared/extensions/size_extensions.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ArticleHomeCard extends StatefulWidget {
  const ArticleHomeCard({
    super.key,
    required this.article,
    required this.padding,
    this.onTap,
  });
  final Article article;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  State<ArticleHomeCard> createState() => _ArticleHomeCardState();
}

class _ArticleHomeCardState extends State<ArticleHomeCard> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colors = context.theme.colorScheme;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;
        return BlocProvider(
          create: (context) => FavouriteArticleCubit(
            name: widget.article.name,
            favoritesBox: Hive.box<bool>('favoritesBox'),
          ),
          child: BlocBuilder<FavouriteArticleCubit, FavouriteArticleState>(
            builder: (context, state) {
              return HomeCardWrapper(
                onTap: widget.onTap, //TODO open article page
                backgroundColor: colors.surface,
                splashColor: colors.onSurface,
                highlightColor: colors.onSurface,
                image: DecorationImage(
                  image: AssetImage(widget.article.imagePath),
                  alignment: const Alignment(0.5, 0.5),
                  fit: BoxFit.cover,
                ),
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: availableHeight / 2.7,
                      color:
                          context.theme.colorScheme.onSurface.withOpacity(0.45),
                      padding: widget.padding.scale(0.7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.article.title,
                            textScaler: TextScaler.linear(
                              min(availableWidth / 175, 1.1),
                            ),
                            style: context.theme.textTheme.bodyMedium
                                ?.copyWith(color: colors.surface),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: widget.padding.scale(0.65),
                      child: FavouriteButton(
                        isFavorite: state.isFavorite,
                        radius: max(30, availableWidth * 0.17),
                        onTap: () {
                          context
                              .read<FavouriteArticleCubit>()
                              .toggleFavorite();
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
