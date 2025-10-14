
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CaseInfoController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());

  RxBool isLoading = true.obs;
  RxString selectDeleteCaseStage = "".obs;
  RxString selectDeleteCaseType = "".obs;

  RxList<String> caseStageList = <String>[
    "Filing of the Case",
    "Registration and Numbering",
    "Service of Summons",
    "Preliminary Hearing",
    "Filing of Written Statement",
    "Mediation/Settlement",
    "Framing of Issues/Charges",
    "Evidence Stage",
    "Arguments",
    "Judgment",
    "Decree or Sentencing",
    "Appeals",
    "Execution"
  ].obs;

  RxList<String> caseTypeList = <String>[
    "Civil Case",
    "Criminal Case",
    "Family Case",
    "Labour Case",
    "Writ Petition",
    "Public Interest Litigation (PIL)",
    "Land Dispute Case",
    "Arbitration Case",
    "Income Tax Case",
    "Bankruptcy Case",
    "Contract Dispute Case",
    "Company Law Case",
    "Intellectual Property Case",
    "Election Dispute Case",
    "Cyber Crime Case",
    "Customs and Excise Case",
    "Anti-Corruption Case",
    "Human Rights Case",
    "Environmental Law Case",
    "Consumer Protection Case"
  ].obs;

  RxList<String> courtList = <String>[
    "Supreme Court of Bangladesh - Appellate Division",
    "Supreme Court of Bangladesh - High Court Division",
    "Sessions Court",
    "Chief Metropolitan Magistrate (CMM) Court",
    "Chief Judicial Magistrate (CJM) Court",
    "District Judge’s Court",
    "Additional District Judge’s Court",
    "Senior Assistant Judge’s Court",
    "Assistant Judge’s Court",
    "Family Court",
    "Labour Court",
    "Administrative Tribunal",
    "Anti-Corruption Commission (ACC) Court",
    "Cyber Tribunal",
    "Nari o Shishu Nirjaton Daman Tribunal",
    "Special Judge’s Court",
    "Artha Rin Adalat (Money Loan Court)",
    "Environmental Court",
    "Speedy Trial Tribunal",
    "Village Court"
  ].obs;

  getLoading() async {
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 200));
    isLoading.value = false;
  }

  addCaseStage({required String newStage}) {
    caseStageList.add(newStage);
  }

  addCaseType({required String newType}) {
    caseTypeList.add(newType);
  }

  addCourt({required String newType}) {
    courtList.add(newType);
  }

  deleteCaseStage({required String id}) async {
    caseStageList.removeWhere((v) => v == id);
  }

  deleteCaseType({required String id}) async {
    caseTypeList.removeWhere((v) => v == id);
  }

  deleteCourt({required String id}) async {
    courtList.removeWhere((v) => v == id);
  }
}
