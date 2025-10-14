import 'package:advocateoffice/model/expense.dart';

List<ExpenseModel> expenseDataList = [
  ExpenseModel(
    id: "1",
    purposeOforCaseID: "تعويض السفر",
    clientPhone: "1234567890",
    amount: "150.00",
    status: "موافق عليه",
    comment: "شراء مستلزمات المكتب",
    createdAt: "2024-12-18",
    createdBy: "المدير",
    image:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDmblIz3o_FaZuFPXwl4VqUGHZCCrSdUEDAQ&s",
  ),
  ExpenseModel(
    id: "2",
    purposeOforCaseID: "تعويض السفر",
    clientPhone: "9876543210",
    amount: "250.00",
    status: "قيد الانتظار",
    comment: "السفر للاجتماع مع العميل",
    createdAt: "2024-12-17",
    createdBy: "جون دو",
  ),
  ExpenseModel(
    id: "3",
    purposeOforCaseID: "تسويق",
    clientPhone: "1122334455",
    amount: "500.00",
    status: "مرفوض",
    comment: "إعلانات على وسائل التواصل",
    createdAt: "2024-12-16",
    createdBy: "جين سميث",
  ),
  ExpenseModel(
    id: "4",
    purposeOforCaseID: "غداء الفريق",
    clientPhone: "9988776655",
    amount: "120.00",
    status: "موافق عليه",
    comment: "غداء مع فريق المشروع",
    createdAt: "2024-12-18",
    createdBy: "أليس",
    image:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDmblIz3o_FaZuFPXwl4VqUGHZCCrSdUEDAQ&s",
  ),
];
