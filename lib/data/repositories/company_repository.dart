
import 'package:dio/dio.dart';
import 'package:job_portal_app/data/models/company_model.dart';

class CompanyRepository {
  final Dio _dio = Dio();

  Future<List<CompanyModel>> fetchCompanies() async {
    try {
      var response = await _dio.get('https://jsonplaceholder.typicode.com/albums/1/photos');
      return (response.data as List).map((item) => CompanyModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception("Failed to load companies");
    }
  }
}
