
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/fearure_customer/data/model/customer_repository.dart';
import 'package:team_project/features/fearure_customer/data/repository/customer_repository.dart';

class CustomerUseCase implements UseCase<DataState<CustomerResponse>,NoParams>{
  CustomerRepository customerRepository = getIt.get<CustomerRepository>();

  @override
  Future<DataState<CustomerResponse>> call(NoParams param)async {
    return await customerRepository.getCustomer();
  }
}