class HearingModel {
  String? caseID;
  String? hearingDate;
  String? clientName;
  String? clientPhone;
  String? courtType;
  String? caseType;
  String? remark;
  bool? informClient;

  HearingModel(
      {this.caseID,
        this.hearingDate,
        this.clientName,
        this.clientPhone,
        this.courtType,
        this.caseType,
        this.remark,
        this.informClient});

  HearingModel.fromJson(Map<String, dynamic> json) {
    caseID = json['Case_ID'];
    hearingDate = json['Hearing_date'];
    clientName = json['Client Name'];
    clientPhone = json['Client Phone'];
    courtType = json['Court_Type'];
    caseType = json['Case_Type'];
    remark = json['Remark'];
    informClient = json['Inform Client'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Case_ID'] = this.caseID;
    data['Hearing_date'] = this.hearingDate;
    data['Client Name'] = this.clientName;
    data['Client Phone'] = this.clientPhone;
    data['Court_Type'] = this.courtType;
    data['Case_Type'] = this.caseType;
    data['Remark'] = this.remark;
    data['Inform Client'] = this.informClient;
    return data;
  }
}
