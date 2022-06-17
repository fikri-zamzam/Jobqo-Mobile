class CompanyModel {
  int? id;
  String? name;
  String? imgUrl;

  CompanyModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_company'];
    imgUrl = json['img_logo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_company': name,
      'img_logo': imgUrl,
    };
  }
}
