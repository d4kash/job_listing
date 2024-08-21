
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:job_portal_app/data/models/company_model.dart';
import 'package:hive/hive.dart';

class CompanyController extends GetxController {
  var companies = <CompanyModel>[].obs;
  Box? box;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/albums/1/photos');
      var list = (response.data as List).map((item) => CompanyModel.fromJson(item)).toList();
      companies.assignAll(list);
      await Hive.openBox('appliedJobs');
      box = Hive.box('appliedJobs');
      for (var i = 0; i < companies.length; i++) {
        companies[i].isApplied = box?.get(companies[i].id.toString()) ?? false;
      }
    } catch (e) {
      print(e);
    }
  }

  void markAsApplied(int index) {
    companies[index].isApplied = true;
    box?.put(companies[index].id.toString(), true);
    companies.refresh();
  }
}
