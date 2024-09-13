// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      title: json['title'] as String?,
      status: (json['status'] as num?)?.toInt(),
      traceId: json['traceId'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
      'traceId': instance.traceId,
    };
