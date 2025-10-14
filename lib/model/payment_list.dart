class PaymentListModel {
  String? incomeType;
  String? caseID;
  String? clientName;
  String? clientPhone;
  num? receivedAmount;
  String? paymentMethod;
  String? remark;
  String? createdAt;
  String? createdBy;

  PaymentListModel({
    this.incomeType,
    this.caseID,
    this.clientName,
    this.clientPhone,
    this.receivedAmount,
    this.paymentMethod,
    this.remark,
    this.createdAt,
    this.createdBy,
  });

  PaymentListModel.fromJson(Map<String, dynamic> json) {
    incomeType = json['income_type'];
    caseID = json['Case_ID'];
    clientName = json['Client_name'];
    clientPhone = json['Client_phone'];
    receivedAmount = json['received_amount'];
    paymentMethod = json['payment_method'];
    remark = json['remark'];
    createdAt = json['Created_at'];
    createdBy = json['Created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['income_type'] = this.incomeType;
    data['Case_ID'] = this.caseID;
    data['Client_name'] = this.clientName;
    data['Client_phone'] = this.clientPhone;
    data['received_amount'] = this.receivedAmount;
    data['payment_method'] = this.paymentMethod;
    data['remark'] = this.remark;
    data['Created_at'] = this.createdAt;
    data['Created_by'] = this.createdBy;
    return data;
  }
}
