import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobqo/models/job_model.dart';
import 'package:jobqo/services/job_service.dart';

class JobProvider with ChangeNotifier {
  List<JobModel> _jobs = [];

  List<JobModel> get jobs => _jobs;

  set jobs(List<JobModel> jobs) {
    _jobs = jobs;
    notifyListeners();
  }

  Future<void> getJobs() async {
    try {
      List<JobModel> jobs = await JobService().getJobs();
      _jobs = jobs;
    } catch (e) {
      print(e);
    }
  }
}
