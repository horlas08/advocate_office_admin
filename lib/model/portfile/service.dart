class ServiceModel {
  String? id;
  String? title;
  String? description;
  String? image;
  String? icon;
  int? status;

  ServiceModel(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.icon,
      this.status});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    icon = json['icon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['status'] = this.status;
    return data;
  }
}
