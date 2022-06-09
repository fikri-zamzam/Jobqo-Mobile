import 'package:flutter/material.dart';
import 'package:jobqo/models/lamaran_model.dart';
import 'package:jobqo/services/lamaran_service.dart';

class LamaranProvider with ChangeNotifier {
  late LamaranModel _lamaran;
  LamaranModel get lamaran => _lamaran;

  set lamaran(LamaranModel lamaran) {
    _lamaran = lamaran;
    notifyListeners();
  }

  Future<bool> create({
    var token,
    String? usersid,
    String? jobsid,
    String? resume,
  }) async {
    try {
      LamaranModel lamaran = await LamaranService().create(
        token: token,
        usersid: usersid,
        jobsid: jobsid,
        resume: resume,
      );

      _lamaran = lamaran;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
