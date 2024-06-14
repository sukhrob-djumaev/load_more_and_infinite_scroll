// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoviesList _$MoviesListFromJson(Map<String, dynamic> json) {
  return _MoviesList.fromJson(json);
}

/// @nodoc
mixin _$MoviesList {
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<Movie> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesListCopyWith<MoviesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesListCopyWith<$Res> {
  factory $MoviesListCopyWith(
          MoviesList value, $Res Function(MoviesList) then) =
      _$MoviesListCopyWithImpl<$Res, MoviesList>;
  @useResult
  $Res call({int page, int totalPages, List<Movie> results});
}

/// @nodoc
class _$MoviesListCopyWithImpl<$Res, $Val extends MoviesList>
    implements $MoviesListCopyWith<$Res> {
  _$MoviesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesListImplCopyWith<$Res>
    implements $MoviesListCopyWith<$Res> {
  factory _$$MoviesListImplCopyWith(
          _$MoviesListImpl value, $Res Function(_$MoviesListImpl) then) =
      __$$MoviesListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int totalPages, List<Movie> results});
}

/// @nodoc
class __$$MoviesListImplCopyWithImpl<$Res>
    extends _$MoviesListCopyWithImpl<$Res, _$MoviesListImpl>
    implements _$$MoviesListImplCopyWith<$Res> {
  __$$MoviesListImplCopyWithImpl(
      _$MoviesListImpl _value, $Res Function(_$MoviesListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? results = null,
  }) {
    return _then(_$MoviesListImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviesListImpl implements _MoviesList {
  const _$MoviesListImpl(
      {required this.page,
      required this.totalPages,
      required final List<Movie> results})
      : _results = results;

  factory _$MoviesListImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviesListImplFromJson(json);

  @override
  final int page;
  @override
  final int totalPages;
  final List<Movie> _results;
  @override
  List<Movie> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MoviesList(page: $page, totalPages: $totalPages, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesListImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalPages,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesListImplCopyWith<_$MoviesListImpl> get copyWith =>
      __$$MoviesListImplCopyWithImpl<_$MoviesListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviesListImplToJson(
      this,
    );
  }
}

abstract class _MoviesList implements MoviesList {
  const factory _MoviesList(
      {required final int page,
      required final int totalPages,
      required final List<Movie> results}) = _$MoviesListImpl;

  factory _MoviesList.fromJson(Map<String, dynamic> json) =
      _$MoviesListImpl.fromJson;

  @override
  int get page;
  @override
  int get totalPages;
  @override
  List<Movie> get results;
  @override
  @JsonKey(ignore: true)
  _$$MoviesListImplCopyWith<_$MoviesListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
