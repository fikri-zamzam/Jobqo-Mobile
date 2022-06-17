import 'package:jobqo/models/company_model.dart';

import 'gaji_model.dart';

class JobModel {
  int? id;
  String? name_job;
  late CompanyModel company;
  late GajiModel gajii;
  String? desk_job;
  String? companies_id;
  String? job_requirement;
  DateTime? createdAt;
  // String? password;
  // String? token;

  JobModel({
    required this.id,
    required this.name_job,
    required this.company,
    required this.gajii,
    required this.desk_job,
    required this.companies_id,
    required this.job_requirement,
    required this.createdAt,
    // required this.password,
    // required this.token,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_job = json['name_job'];
    company = CompanyModel.fromJson(json['asal_job']);
    gajii = GajiModel.fromJson(json['range_gaji']);
    desk_job = json['desk_job'];
    companies_id = json['company_id'];
    job_requirement = json['job_requirement'];
    createdAt = DateTime.parse(json['created_at']);
    // password = json['password'];
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_job ': name_job,
      'name_company': company.toJson(),
      'img_url': company.toJson(),
      'range_salary': gajii.toJson(),
      'desk_job': desk_job,
      'company_id': companies_id,
      'job_requirement': job_requirement,
      'created_at': createdAt,
      // 'password': password,
      // 'token': token,
    };
  }
}
