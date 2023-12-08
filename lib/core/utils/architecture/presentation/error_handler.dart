import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hoivalani/core/utils/architecture/data/response/base_response.dart';
import 'package:hoivalani/core/utils/components/notification/enums/toast_type.dart';
import 'package:hoivalani/core/utils/components/notification/toast.dart';
import 'package:hoivalani/core/utils/routes/router.gr.dart';

class ErrorHandler {
  static void handle(BuildContext context, Exception exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          CustomToast.show(
              context: context,
              message: "Connection Problem",
              toastType: ToastType.error);
          break;
        case DioExceptionType.badCertificate:
          CustomToast.show(
              context: context,
              message: "Certificate Problem",
              toastType: ToastType.error);
          break;
        case DioExceptionType.cancel:
          CustomToast.show(
              context: context,
              message: "Request Canceled",
              toastType: ToastType.error);
          break;
        case DioExceptionType.unknown:
          CustomToast.show(
              context: context,
              message: "Unknown Error",
              toastType: ToastType.error);
          break;
        case DioExceptionType.badResponse:
          _handleBadResponses(context, exception);
          break;
      }
    }
  }

  static void _handleBadResponses(
      BuildContext context, DioException exception) {
    if (exception.response!.statusCode == 401) {
      context.router
          .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
    } else if(exception.response!.statusCode!>=500 && exception.response!.statusCode!<=599){
      CustomToast.show(
          context: context, message: "Server Internal Error", toastType: ToastType.error);
    }else {
      final errorResponse = BaseResponse.fromJson(exception.response!.data);
      String errorMessage = errorResponse.message!;
      CustomToast.show(
          context: context, message: errorMessage, toastType: ToastType.error);
    }
  }
}
