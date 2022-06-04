import 'dart:convert';

import 'package:jobqo/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobService {
  String baseUrl = 'http://192.168.1.15:8000/api';

  Future<JobModel> job({
    String? name_job,
    String? desk_job,
    String? job_requirement,
  }) async {
    var url = '$baseUrl/job';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name_job ': name_job,
      'desk_job': desk_job,
      'job_requirement': job_requirement,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      JobModel user = JobModel.fromJson(data['user']);
      // user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }
}
