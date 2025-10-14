class ClientListModel {
  String? id;
  String? name;
  String? fathersName;
  String? phone;
  String? alterPhone;
  String? mail;
  String? profession;
  int? divId;
  int? disId;
  int? thaId;
  int? address;
  String? reference;
  int? totalCase;
  String? createdAt;
  String? createdBy;

  ClientListModel(
      {this.id,
      this.name,
      this.fathersName,
      this.phone,
      this.alterPhone,
      this.mail,
      this.profession,
      this.divId,
      this.disId,
      this.thaId,
      this.address,
      this.reference,
      this.totalCase,
      this.createdAt,
      this.createdBy});

  ClientListModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    fathersName = json['Fathers_name'];
    phone = json['Phone'];
    alterPhone = json['Alter_phone'];
    mail = json['mail'];
    profession = json['profession'];
    divId = json['Div_id'];
    disId = json['Dis_id'];
    thaId = json['Tha_id'];
    address = json['Address'];
    reference = json['Reference'];
    totalCase = json['Total_case'];
    createdAt = json['Created at'];
    createdBy = json['Created By'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Fathers_name'] = this.fathersName;
    data['Phone'] = this.phone;
    data['Alter_phone'] = this.alterPhone;
    data['mail'] = this.mail;
    data['profession'] = this.profession;
    data['Div_id'] = this.divId;
    data['Dis_id'] = this.disId;
    data['Tha_id'] = this.thaId;
    data['Address'] = this.address;
    data['Reference'] = this.reference;
    data['Total_case'] = this.totalCase;
    data['Created at'] = this.createdAt;
    data['Created By'] = this.createdBy;
    return data;
  }
}
