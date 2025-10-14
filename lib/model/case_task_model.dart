class CaseTaskModel {
  String? caseId;
  String? clientName;
  String? clientPhone;
  String? task;
  String? priority;
  List<AssignTo>? assignTo;
  String? taskStart;
  String? createdAt;

  CaseTaskModel(
      {this.caseId,
      this.clientName,
      this.clientPhone,
      this.task,
      this.priority,
      this.assignTo,
      this.taskStart,
      this.createdAt});

  CaseTaskModel.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    task = json['task'];
    priority = json['priority'];
    if (json['assign_to'] != null) {
      assignTo = <AssignTo>[];
      json['assign_to'].forEach((v) {
        assignTo!.add(new AssignTo.fromJson(v));
      });
    }
    taskStart = json['task_start'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['client_name'] = this.clientName;
    data['client_phone'] = this.clientPhone;
    data['task'] = this.task;
    data['priority'] = this.priority;
    if (this.assignTo != null) {
      data['assign_to'] = this.assignTo!.map((v) => v.toJson()).toList();
    }
    data['task_start'] = this.taskStart;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class AssignTo {
  String? name;
  String? phone;

  AssignTo({this.name, this.phone});

  AssignTo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
