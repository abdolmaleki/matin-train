
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:team_project/core/utils/architecture/data/response/api_response.dart';
import 'package:team_project/core/utils/constants/url/api.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_request.dart';
import 'package:team_project/features/feature_medicine/data/models/create_medicine_response.dart';
import 'package:team_project/features/feature_medicine/data/models/get_medicine_response.dart';

part 'medicine_service.g.dart';
@RestApi(baseUrl: baseUrl)
abstract class MedicineService{
  factory MedicineService(Dio dio,{String baseUrl})=_MedicineService;
  @GET('medicines')
  Future<ApiResponse<GetMedicineResponse>>getMedicine();
  @POST('medicines')
  Future<ApiResponse<CreateMedicineResponse>>createMedicine(@Body() CreateMedicineRequest request);
}