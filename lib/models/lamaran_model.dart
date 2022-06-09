import 'package:jobqo/models/job_model.dart';

class LamaranModel {
  int? id;
  String? usersid;
  String? jobsid;
  String? resume;
  String? token;

  LamaranModel({
    required this.id,
    required this.usersid,
    required this.jobsid,
    required this.resume,
    required this.token,
  });

  LamaranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersid = json['users_id'];
    jobsid = json['jobs_id'];
    resume = json['resume'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users_id ': usersid,
      'jobs_id': jobsid,
      'resume': resume,
      'token': token,
    };
  }
}
