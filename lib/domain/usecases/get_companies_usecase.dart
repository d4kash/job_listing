
import 'package:job_portal_app/data/models/company_model.dart';
import 'package:job_portal_app/data/repositories/company_repository.dart';

class GetCompaniesUseCase {
  final CompanyRepository repository;

  GetCompaniesUseCase(this.repository);

  Future<List<CompanyModel>> call() async {
    return await repository.fetchCompanies();
  }
}
