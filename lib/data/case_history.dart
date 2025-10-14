import 'package:advocateoffice/model/case_history.dart';

List<CaseHistoryModel> caseHistoryDataList = [
  CaseHistoryModel(
    id: "1",
    nextHearingDate: "2024-12-20",
    activity: "تم تحديد الجلسة",
    court: "المحكمة العليا",
    comment: "تم تحديد موعد الجلسة في التاريخ المذكور.",
    createAt: "2024-12-01",
  ),
  CaseHistoryModel(
    id: "2",
    nextHearingDate: "2024-12-25",
    activity: "تأجيل الجلسة",
    court: "المحكمة العليا",
    comment: "تم تأجيل الجلسة بسبب غياب المدعى عليه.",
    createAt: "2024-12-05",
  ),
  CaseHistoryModel(
    id: "3",
    nextHearingDate: "2025-01-10",
    activity: "تقديم الأدلة",
    court: "محكمة المقاطعة",
    comment: "يجب تقديم جميع الأدلة قبل موعد الجلسة القادمة.",
    createAt: "2024-12-10",
  ),
  CaseHistoryModel(
    id: "4",
    nextHearingDate: "2025-02-01",
    activity: "المرافعات النهائية",
    court: "محكمة الجلسات",
    comment: "سيتم تقديم المرافعات النهائية في هذا التاريخ.",
    createAt: "2024-12-15",
  ),
  CaseHistoryModel(
    id: "5",
    nextHearingDate: "2025-03-05",
    activity: "يوم النطق بالحكم",
    court: "المحكمة العليا",
    comment: "سيتم إصدار الحكم في هذا التاريخ.",
    createAt: "2025-01-01",
  ),
];
