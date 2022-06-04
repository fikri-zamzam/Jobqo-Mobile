class JobModel {
  int? id;
  String? name_job;
  String? desk_job;
  String? job_requirement;
  // String? password;
  // String? token;

  JobModel({
    required this.id,
    required this.name_job,
    required this.desk_job,
    required this.job_requirement,
    // required this.password,
    // required this.token,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_job = json['name_job'];
    desk_job = json['desk_job'];
    job_requirement = json['job_requirement'];
    // password = json['password'];
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_job ': name_job,
      'desk_job': desk_job,
      'job_requirement': job_requirement,
      // 'password': password,
      // 'token': token,
    };
  }
}
