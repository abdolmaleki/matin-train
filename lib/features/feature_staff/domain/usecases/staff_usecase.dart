import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/utils/architecture/data/data_state.dart';
import 'package:team_project/core/utils/architecture/domain/use_case.dart';
import 'package:team_project/features/feature_staff/data/model/staff_response.dart';
import 'package:team_project/features/feature_staff/data/repository/staff_repository.dart';

class StaffUseCase implements UseCase<DataState<StaffResponse>,NoParams>{
  final StaffRepository staffRepository = getIt.get<StaffRepository>();

  @override
  Future<DataState<StaffResponse>> call(NoParams param) async {
    return await staffRepository.getStaff();
  }

}