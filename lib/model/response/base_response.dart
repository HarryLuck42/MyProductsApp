
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "title")
  String? title = "";

  @JsonKey(name: "status")
  int? status = 0;

  @JsonKey(name: "traceId")
  String? traceId = "";

  BaseResponse({this.title, this.status, this.traceId});

  factory BaseResponse.fromJson(Map<String, dynamic> map) => _$BaseResponseFromJson(map);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}