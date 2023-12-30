import 'package:dio/dio.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/features/feature_section/data/data_source/section_service.dart';
import 'package:team_project/features/feature_section/data/model/create_section_request.dart';
import 'package:team_project/features/feature_section/data/model/create_section_response.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_request.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_response.dart';
import 'package:team_project/features/feature_section/data/model/get_section_response.dart';

import '../../../../core/utils/architecture/data/data_state.dart';

class SectionRepository {
  final SectionService sectionService = getIt.get<SectionService>();

  Future<DataState<GetSectionResponse>> getSection() async {
    try {
      final result = await sectionService.getSection();

      return DataSuccess(result.data!);
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  Future<DataState<CreateSectionResponse>> createSection(
      CreateSectionRequest request) async {
    try {
      final result = await sectionService.createSection(request);
      return DataSuccess(result.data!);
    } on DioException catch (e) {
      print(e);
      return DataError(e);
    }
  }

  Future<DataState<DeleteSectionRespnse>> deleteSection(
      DeleteSectionRequest request) async {
    try {
      final result = await sectionService.deleteSection(request);
      return DataSuccess(result.data!);
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
