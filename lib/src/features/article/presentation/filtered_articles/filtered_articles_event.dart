part of 'filtered_articles_bloc.dart';

@freezed
class FilteredArticlesEvent with _$FilteredArticlesEvent {
  factory FilteredArticlesEvent.load(bool? isPaid) = LoadFilteredArticlesEvent;
}
