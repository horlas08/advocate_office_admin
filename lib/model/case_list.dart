class CaseListModel {
  String? caseID;
  String? clientType;
  String? caseType;
  List<int>? section;
  String? court;
  String? clientName;
  String? clientPhone;
  String? caseStage;
  num? fees;
  String? priority;
  String? status;
  String? remark;

  CaseListModel(
      {this.caseID,
      this.clientType,
      this.caseType,
      this.section,
      this.court,
      this.clientName,
      this.clientPhone,
      this.caseStage,
      this.fees,
      this.priority,
      this.status,
      this.remark});

  CaseListModel.fromJson(Map<String, dynamic> json) {
    caseID = json['Case_ID'];
    clientType = json['Client_type'];
    caseType = json['Case_type'];
    section = json['section'].cast<int>();
    court = json['Court'];
    clientName = json['Client_Name'];
    clientPhone = json['Client_Phone'];
    caseStage = json['Case_Stage'];
    fees = json['fees'];
    priority = json['priority'];
    status = json['status'];
    remark = json['Remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Case_ID'] = this.caseID;
    data['Client_type'] = this.clientType;
    data['Case_type'] = this.caseType;
    data['section'] = this.section;
    data['Court'] = this.court;
    data['Client_Name'] = this.clientName;
    data['Client_Phone'] = this.clientPhone;
    data['Case_Stage'] = this.caseStage;
    data['fees'] = this.fees;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['Remark'] = this.remark;
    return data;
  }
}
