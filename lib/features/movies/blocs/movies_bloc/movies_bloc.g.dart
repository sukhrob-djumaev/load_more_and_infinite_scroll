// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesStateImpl _$$MoviesStateImplFromJson(Map<String, dynamic> json) =>
    _$MoviesStateImpl(
      status: json['status'] == null
          ? const StateStatus()
          : StateStatus.fromJson(json['status'] as Map<String, dynamic>),
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: (json['page'] as num?)?.toInt() ?? 1,
      totalPages: (json['total_pages'] as num?)?.toInt() ?? 2,
    );

Map<String, dynamic> _$$MoviesStateImplToJson(_$MoviesStateImpl instance) =>
    <String, dynamic>{
      'status': instance.status.toJson(),
      'movies': instance.movies.map((e) => e.toJson()).toList(),
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'total_pages': instance.totalPages,
    };
