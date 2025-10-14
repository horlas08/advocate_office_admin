class TeamModel {
  String? id;
  String? name;
  String? expertise;
  String? image;

  int? status;

  TeamModel(
      {this.id,
      this.name,
      this.expertise,
      this.image,
      this.status});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    expertise = json['expertise'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['expertise'] = this.expertise;
    data['image'] = this.image;
  
    data['status'] = this.status;
    return data;
  }
}
