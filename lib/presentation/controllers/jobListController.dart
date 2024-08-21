import 'package:get/get.dart';
import 'package:job_portal_app/data/models/company_model.dart';
import 'package:job_portal_app/data/repositories/company_repository.dart';
import 'package:job_portal_app/domain/usecases/get_companies_usecase.dart';

class JobListController extends GetxController {
  var isLoading = true.obs;
  var jobs = <CompanyModel>[].obs;
  var allJobs = <CompanyModel>[];

  final CompanyRepository repository = CompanyRepository();

  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  void fetchJobs() async {
    try {
      isLoading(true);
      var fetchedJobs = await GetCompaniesUseCase(repository).call();
      jobs.assignAll(fetchedJobs);
      allJobs = fetchedJobs; // Save the original list
    } finally {
      isLoading(false);
    }
  }

  void filterJobs(String query) {
    if (query.isEmpty) {
      // Restore the original list if the query is empty
      jobs.assignAll(allJobs);
    } else {
      final filtered = allJobs.where((job) {
        final jobTitle = job.title.toLowerCase();
        final jobCompany = job.title.toLowerCase();
        return jobTitle.contains(query) || jobCompany.contains(query);
      }).toList();
      jobs.assignAll(filtered);
    }
  }
}
