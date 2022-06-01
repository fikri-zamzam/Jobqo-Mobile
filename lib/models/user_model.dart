// class UserModel {
//   String? nama;
//   String? username;
//   String? email;
//   String? password;

//   UserModel({
//     required this.nama,
//     required this.username,
//     required this.email,
//     required this.password,
//   });

//   UserModel.fromJson(Map<String, dynamic> json) {
//     nama = json['nama'];
//     username = json['username'];
//     email = json['email'];
//     password = json['password'];
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'nama': nama,
//       'username': username,
//       'email': email,
//       'password': password,
//     };
//   }
// }

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name ': name,
      'username': username,
      'email': email,
      'password': password,
      'token': token,
    };
  }
}
