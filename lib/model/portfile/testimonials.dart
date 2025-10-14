class TestimonialsModel {
  String? id;
  String? name;
  String? profession;
  String? image;
  String? quote;
  int? status;
  

  TestimonialsModel(
      {this.id,
      this.name,
      this.profession,
      this.quote,
      this.image,
      this.status});

  TestimonialsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profession = json['profession'];
    quote = json['quote'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profession'] = this.profession;
    data['quote'] = this.quote;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
