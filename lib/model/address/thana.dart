class ThanaModel {
  String? disId;
  String? thanaId;
  String? thanaName;

  ThanaModel({this.disId, this.thanaId, this.thanaName});

  ThanaModel.fromJson(Map<String, dynamic> json) {
    disId = json['disId'];
    thanaId = json['thanaId'];
    thanaName = json['thanaName'];
  }
}
