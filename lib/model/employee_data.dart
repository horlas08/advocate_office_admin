

class EmployeeDataModel {
  int? id;
  String? image;
  String? name;
  String? phone;
  String? mail;
  String? designation;
  String? expertise;
  String? joinDate;
  int? status;

  EmployeeDataModel(
      {this.id,
        this.image,
        this.name,
        this.phone,
        this.mail,
        this.designation,
        this.expertise,
        this.joinDate,
        this.status});

  EmployeeDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    mail = json['mail'];
    designation = json['designation'];
    expertise = json['expertise_in'];
    joinDate = json['join-date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['mail'] = this.mail;
    data['designation'] = this.designation;
    data['expertise_in'] = this.expertise;
    data['join-date'] = this.joinDate;
    data['status'] = this.status;
    return data;
  }
}
