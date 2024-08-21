
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_app/firebase_options.dart';
import 'package:job_portal_app/routes/app_pages.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
} on Exception catch (e) {
  if (kDebugMode) {
    print("error in initializing: $e");
  }
}
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
    );
  }
}
