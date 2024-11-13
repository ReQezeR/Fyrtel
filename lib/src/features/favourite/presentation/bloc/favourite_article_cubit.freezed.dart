// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourite_article_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouriteArticleState {
  String get name => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteArticleStateCopyWith<FavouriteArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteArticleStateCopyWith<$Res> {
  factory $FavouriteArticleStateCopyWith(FavouriteArticleState value,
          $Res Function(FavouriteArticleState) then) =
      _$FavouriteArticleStateCopyWithImpl<$Res, FavouriteArticleState>;
  @useResult
  $Res call({String name, bool isFavorite});
}

/// @nodoc
class _$FavouriteArticleStateCopyWithImpl<$Res,
        $Val extends FavouriteArticleState>
    implements $FavouriteArticleStateCopyWith<$Res> {
  _$FavouriteArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouriteArticleStateCopyWith<$Res>
    implements $FavouriteArticleStateCopyWith<$Res> {
  factory _$$_FavouriteArticleStateCopyWith(_$_FavouriteArticleState value,
          $Res Function(_$_FavouriteArticleState) then) =
      __$$_FavouriteArticleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isFavorite});
}

/// @nodoc
class __$$_FavouriteArticleStateCopyWithImpl<$Res>
    extends _$FavouriteArticleStateCopyWithImpl<$Res, _$_FavouriteArticleState>
    implements _$$_FavouriteArticleStateCopyWith<$Res> {
  __$$_FavouriteArticleStateCopyWithImpl(_$_FavouriteArticleState _value,
      $Res Function(_$_FavouriteArticleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isFavorite = null,
  }) {
    return _then(_$_FavouriteArticleState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FavouriteArticleState implements _FavouriteArticleState {
  const _$_FavouriteArticleState({required this.name, this.isFavorite = false});

  @override
  final String name;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'FavouriteArticleState(name: $name, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteArticleState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouriteArticleStateCopyWith<_$_FavouriteArticleState> get copyWith =>
      __$$_FavouriteArticleStateCopyWithImpl<_$_FavouriteArticleState>(
          this, _$identity);
}

abstract class _FavouriteArticleState implements FavouriteArticleState {
  const factory _FavouriteArticleState(
      {required final String name,
      final bool isFavorite}) = _$_FavouriteArticleState;

  @override
  String get name;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteArticleStateCopyWith<_$_FavouriteArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}
