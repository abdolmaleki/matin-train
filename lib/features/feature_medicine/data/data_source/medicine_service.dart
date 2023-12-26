
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:team_project/core/utils/architecture/data/response/api_response.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/feature_medicine/data/models/medicine_response.dart';

part 'medicine_source.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class MedicineService{
  factory MedicineService(Dio dio,{String baseUrl})=_MedicineSource;
  @GET('medicines')
  Future<ApiResponse<MedicineResponse>>getMedicine();
}