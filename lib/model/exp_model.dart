class ExpenseDataModel {
  String? expenseId;
  String? voucherImg;
  String? purpose;
  num? amount;
  String? remark;
  String? status;
  String? createdAt;
  String? createdBy;

  ExpenseDataModel({this.expenseId, this.voucherImg, this.purpose, this.amount, this.remark, this.status, this.createdAt, this.createdBy});

  ExpenseDataModel.fromJson(Map<String, dynamic> json) {
    expenseId = json['expense_id'];
    voucherImg = json['voucher_img'];
    purpose = json['purpose'];
    amount = json['amount'];
    remark = json['remark'];
    status = json['status'];
    createdAt = json['Created_at'];
    createdBy = json['Created_by'];
  }
}
