import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/fearure_customer/domain/usecases/customer_usecase.dart';
import 'package:team_project/features/fearure_customer/presentation/bloc/customer_state.dart';

class CustomerBloc extends Cubit<CustomerState>{
  CustomerBloc():super(CustomerInitial());
  CustomerUseCase customerUseCase = CustomerUseCase();

  void loadCustomer()async{
    final result = await customerUseCase(NoParams());
    if(result is DataSuccess){
      emit(CustomerLoaded(result.data!));
    }else{
      emit(CustomerError(result.error!));
    }

  }
}