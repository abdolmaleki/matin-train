
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/feature_section/data/model/create_section_request.dart';
import 'package:team_project/features/feature_section/data/model/create_section_response.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_request.dart';
import 'package:team_project/features/feature_section/data/model/delete_section_response.dart';
import 'package:team_project/features/feature_section/data/model/get_section_response.dart';

import '../../../../core/utils/architecture/data/response/api_response.dart';

part 'section_service.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class SectionService{

  factory SectionService(Dio dio , {String baseUrl})=_SectionService;
  
  @GET('sections')
  Future<ApiResponse<GetSectionResponse>>getSection();

  @POST('sections')
  Future<ApiResponse<CreateSectionResponse>>createSection(@Body() CreateSectionRequest request);
  
  @DELETE('sections')
  Future<ApiResponse<DeleteSectionRespnse>>deleteSection(@Body() DeleteSectionRequest request);
}