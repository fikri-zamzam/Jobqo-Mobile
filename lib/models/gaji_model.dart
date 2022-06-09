class GajiModel {
  int? id;
  String? gaji;

  GajiModel({
    required this.id,
    required this.gaji,
  });

  GajiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gaji = json['rupiah'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rupiah': gaji,
    };
  }
}
