class CaseSectionModel {
  int? id;
  String? caseCategory;
  String? caseSection;
  String? details;

  CaseSectionModel(
      {this.id, this.caseCategory, this.caseSection, this.details});

  CaseSectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseCategory = json['case_category'];
    caseSection = json['case_section'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['case_category'] = this.caseCategory;
    data['case_section'] = this.caseSection;
    data['details'] = this.details;
    return data;
  }
}
