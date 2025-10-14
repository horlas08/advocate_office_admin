class DistrictModel {
  String? divId;
  String? disId;
  String? disName;

  DistrictModel({this.divId, this.disId, this.disName});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    divId = json['divId'];
    disId = json['disId'];
    disName = json['disName'];
  }
}
