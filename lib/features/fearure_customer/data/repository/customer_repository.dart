import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/features/fearure_customer/data/data_source/customer_service.dart';
import 'package:team_project/features/fearure_customer/data/model/customer_repository.dart';

import '../../../../core/utils/architecture/data/data_state.dart';

class CustomerRepository {
  CustomerService customerService = getIt.get<CustomerService>();

  Future<DataState<CustomerResponse>>getCustomer()async{
    try{
      final result = await customerService.getCustomers();
      return DataSuccess(result.data!);
    }on DioException catch(e){
      return DataError(e);
    }
  }
}