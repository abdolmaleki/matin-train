import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(createToJson: false)
class BaseResponse extends Equatable {
  const BaseResponse({this.statusCode, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  final String? message;
  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
