import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobqo/models/job_model.dart';
import 'package:jobqo/services/job_service.dart';

class JobProvider with ChangeNotifier {
  late JobModel _job;
  JobModel get job => _job;

  set job(JobModel job) {
    _job = job;
    notifyListeners();
  }

  Future<bool> Job({
    String? name_job,
    String? desk_job,
    String? job_requirement,
  }) async {
    try {
      JobModel job = await JobService().job(
        name_job: name_job,
        desk_job: desk_job,
        job_requirement: job_requirement,
      );

      _job = job;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
