class EmployeeModel {
  String? id;
  String? name;
  String? birth;
  String? position;
  int? ktp;
  String? email;
  String? gender;
  String? address;
  bool? isActive;

  EmployeeModel({
    this.id,
    this.name,
    this.birth,
    this.position,
    this.ktp,
    this.email,
    this.gender,
    this.address,
    this.isActive,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json){
    return EmployeeModel(
      id: json["id"] ?? '',
      name: json["name"] ?? '',
      birth: json["birth"] ?? '',
      position: json["position"] ?? '',
      ktp: json["ktp"] ?? 0,
      email: json["email"] ?? '',
      gender: json["gender"] ?? '',
      address: json["address"] ?? '',
      isActive: json["isActive"] ?? false,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name" : name ?? '',
      "birth" : birth ?? '',
      "position" : position ?? '',
      "ktp" : ktp ?? 0,
      "email" : email ?? '',
      "gender" : gender ?? '',
      "address" : address ?? '',
      "isActive" : isActive ?? false,
    };
  }
}