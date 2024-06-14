// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesListImpl _$$MoviesListImplFromJson(Map<String, dynamic> json) =>
    _$MoviesListImpl(
      page: (json['page'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MoviesListImplToJson(_$MoviesListImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
