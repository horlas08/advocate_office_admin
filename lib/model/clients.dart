class ClientDataModel {
  String? id;
  String? clientName;
  String? clientPhone;
  String? clientFatherName;
  String? dateTime;
  String? totalCase;
  String? profession;

  ClientDataModel(
      {this.id,
      this.clientName,
      this.clientPhone,
      this.clientFatherName,
      this.dateTime,
      this.totalCase,
      this.profession});

  ClientDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientName = json['clientName'];
    clientPhone = json['clientPhone'];
    clientFatherName = json['clientFatherName'];
    dateTime = json['dateTime'];
    totalCase = json['totalCase'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientName'] = this.clientName;
    data['clientPhone'] = this.clientPhone;
    data['clientFatherName'] = this.clientFatherName;
    data['dateTime'] = this.dateTime;
    data['totalCase'] = this.totalCase;
    data['profession'] = this.profession;
    return data;
  }
}
