class PaymentCreateModel {
  String? incomeType;
  String? caseID;
  num? recevedAmount;
  String? paymentMethode;
  String? remark;

  PaymentCreateModel(
      {this.incomeType,
      this.caseID,
      this.recevedAmount,
      this.paymentMethode,
      this.remark});

  PaymentCreateModel.fromJson(Map<String, dynamic> json) {
    incomeType = json['income_type'];
    caseID = json['Case_ID'];
    recevedAmount = json['receved_amount'];
    paymentMethode = json['payment_methode'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['income_type'] = this.incomeType;
    data['Case_ID'] = this.caseID;
    data['receved_amount'] = this.recevedAmount;
    data['payment_methode'] = this.paymentMethode;
    data['remark'] = this.remark;
    return data;
  }
}
