class CompanyModel {
  int? id;
  String? name;

  CompanyModel({
    required this.id,
    required this.name,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_company'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_company': name,
    };
  }
}
