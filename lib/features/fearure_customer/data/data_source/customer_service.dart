
 import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/fearure_customer/data/model/customer_repository.dart';
import '../../../../core/utils/architecture/data/response/api_response.dart';

part 'customer_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class CustomerService{

  factory CustomerService(Dio dio,{String baseUrl})=_CustomerService;

  @GET('customers')
  Future<ApiResponse<CustomerResponse>>getCustomers();
}