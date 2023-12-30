import 'package:dio/dio.dart';
import 'package:team_project/features/fearure_customer/data/model/customer_repository.dart';

abstract class CustomerState{}

class CustomerInitial extends CustomerState{}

class CustomerLoading extends CustomerState{}

class CustomerLoaded extends CustomerState{
  CustomerResponse customerResponse;

  CustomerLoaded(this.customerResponse);
}

class CustomerError extends CustomerState{
  DioException error ;

  CustomerError(this.error);
}