import 'package:json_annotation/json_annotation.dart';
import 'package:team_project/core/utils/architecture/data/response/base_response.dart';

part 'api_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false
)
class ApiResponse<T> extends BaseResponse {
  const ApiResponse({this.data});

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  final T? data;

  @override
  List<Object?> get props => [data];
}
