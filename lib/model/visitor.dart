class VisitorModel {
  String? id;
  String? name;
  String? phone;
  String? caseType;
  String? priority;
  num? fee;
  String? reference;
  String? remark;
  String? createdAt;
  String? createdBy;

  VisitorModel({this.id, this.name, this.phone, this.caseType, this.priority, this.fee, this.reference, this.remark, this.createdAt, this.createdBy});

  VisitorModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    phone = json['Phone'];
    caseType = json['Case type'];
    priority = json['Priority'];
    fee = json['Fee'];
    reference = json['Reference'];
    remark = json['Remark'];
    createdAt = json['Created at'];
    createdBy = json['Created By'];
  }
}
