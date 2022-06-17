import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobqo/models/lamaran_model.dart';

class LamaranService {
  String baseUrl = 'https://ws-tif.com/jobqo/public/api';

  Future<LamaranModel> create({
    String? usersid,
    String? jobsid,
    String? companiesid,
    String? resume,
    var token,
  }) async {
    var url = '$baseUrl/submit';
    var body = jsonEncode({
      'users_id': usersid,
      'jobs_id': jobsid,
      'companies_id': companiesid,
      'resume': resume,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      LamaranModel lamaran = LamaranModel.fromJson(data['user']);

      return lamaran;
    } else {
      throw Exception('Gagal Create');
    }
  }
}
