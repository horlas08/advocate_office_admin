
class DivisionModel {
  String? id;
  String? divisionName;

  DivisionModel({this.id, this.divisionName});

  DivisionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionName = json['divisionName'];
  }
}
