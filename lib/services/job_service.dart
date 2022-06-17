import 'dart:convert';

import 'package:jobqo/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobService {
  String baseUrl = 'https://ws-tif.com/jobqo/public/api';
  // String baseUrl = 'http://192.168.0.104:8000/api';

  Future<List<JobModel>> getJobs() async {
    var url = '$baseUrl/job';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<JobModel> jobs = [];

      for (var item in data) {
        jobs.add(JobModel.fromJson(item));
      }

      return jobs;
    } else {
      throw Exception('Gagal get data');
    }
  }
}
