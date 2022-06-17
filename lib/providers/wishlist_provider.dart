import 'package:flutter/cupertino.dart';
import 'package:jobqo/models/job_model.dart';

class WishlistProvider with ChangeNotifier {
  List<JobModel> _wishlist = [];

  List<JobModel> get wishlist => _wishlist;

  set wishlist(List<JobModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setJob(JobModel job) {
    if (!isWishlist(job)) {
      _wishlist.add(job);
    } else {
      _wishlist.removeWhere((element) => element.id == job.id);
    }

    notifyListeners();
  }

  isWishlist(JobModel job) {
    if (_wishlist.indexWhere((element) => element.id == job.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
