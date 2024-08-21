
import 'package:get/get.dart';
import 'package:job_portal_app/presentation/pages/company_listing_page.dart';
import 'package:job_portal_app/presentation/pages/job_application_page.dart';
import 'package:job_portal_app/presentation/pages/login_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.COMPANY_LISTING, page: () => JobListScreen()),
    // GetPage(name: Routes.COMPANY_JOB_APPLICATION, page: () => const JobApplicationScreen()),
  ];
}
