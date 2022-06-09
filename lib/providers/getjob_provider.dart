// import 'package:flutter/cupertino.dart';
// import 'package:jobqo/models/job_model.dart';

// class getProvider with ChangeNotifier {
//   List<JobModel> _getjob = [];

//   List<JobModel> get getjob => _getjob;

//   set getjob(List<JobModel> getjob) {
//     _getjob = getjob;
//     notifyListeners();
//   }

//   setJob(JobModel job) {
//     if (!isGetjob(job)) {
//       _getjob.add(job);
//     } else {}

//     notifyListeners();
//   }

//   isGetjob(JobModel job) {
//     if (_getjob.indexWhere((element) => element.id == job.id) == -1) {
//       return false;
//     } else {
//       return true;
//     }
//   }
// }
