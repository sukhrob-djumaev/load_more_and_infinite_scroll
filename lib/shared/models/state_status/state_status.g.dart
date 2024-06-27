// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PureStatusImpl _$$PureStatusImplFromJson(Map<String, dynamic> json) =>
    _$PureStatusImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PureStatusImplToJson(_$PureStatusImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingStatusImpl _$$LoadingStatusImplFromJson(Map<String, dynamic> json) =>
    _$LoadingStatusImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingStatusImplToJson(_$LoadingStatusImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SuccessStatusImpl _$$SuccessStatusImplFromJson(Map<String, dynamic> json) =>
    _$SuccessStatusImpl(
      json['data'],
      json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessStatusImplToJson(_$SuccessStatusImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };

_$ErrorStatusImpl _$$ErrorStatusImplFromJson(Map<String, dynamic> json) =>
    _$ErrorStatusImpl(
      json['message'] as String?,
      json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorStatusImplToJson(_$ErrorStatusImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
