
import 'package:advocateoffice/controller/api/settings/case_section.dart';
import 'package:advocateoffice/model/case_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaseSectionsController extends GetxController {
  final TextEditingController caseSectionCode = TextEditingController();
   final TextEditingController searchController = TextEditingController();
  final TextEditingController caseSectionDetails = TextEditingController();
  final fromKey = Get.put(GlobalKey<FormState>());

  RxBool isLoading = true.obs;
  RxBool isDropdownError = false.obs;
  RxString selectCaseCategory = "".obs;
  RxList<String> caseCategoryList = <String>[
    'Penal Code',
    'Negotiable Instruments Act',
    'Criminal Procedure Code',
    'Family Courts Ordinance',
    'Code of Civil Procedure',
    'Arbitration Act',
    'Digital Security Act',
    'Information Technology Act'
  ].obs;
  RxList<CaseSectionModel> caseSectionList = <CaseSectionModel>[].obs;

  getLoading() async {
    isLoading.value = true;
    caseSectionList.value = await CaseSectionService.caseSection();
    isLoading.value = false;
  }

  addCaseSection() {
    CaseSectionModel model =
        CaseSectionModel(caseCategory: selectCaseCategory.value, caseSection: caseSectionCode.text, details: caseSectionDetails.text);
    caseSectionList.add(model);
    caseSectionDetails.clear();
    caseSectionCode.clear();
  }

  updateCaseSection({required int id}) {
    for (var caseModel in caseSectionList.where((caseItem) => caseItem.id == id)) {
      caseModel.caseSection = caseSectionCode.text;
      caseModel.caseCategory = selectCaseCategory.value;
      caseModel.details = caseSectionDetails.text;
    }
    caseSectionList.refresh();
  }

  deleteCaseSection({required String data, required int id}) async {
    caseSectionList.removeAt(id);
  }
}
