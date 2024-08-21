
import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class CompanyModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String thumbnailUrl;

  @HiveField(3)
  bool isApplied;

  CompanyModel({required this.id, required this.title, required this.thumbnailUrl, this.isApplied = false});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
