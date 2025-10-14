import 'package:advocateoffice/controller/api/case_list.dart';
import 'package:advocateoffice/model/case_list.dart';
import 'package:get/get.dart';

class ClientViewController extends GetxController {
  RxBool isLoading = true.obs;
  var caseList = <CaseListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchClientData();
  }

  void fetchClientData() async {
    isLoading.value = true;
    caseList.value = await CaseService.service();
    if(caseList.length > 2){
      caseList.removeRange(2, caseList.length-1);
    }
    isLoading.value = false;
  }
}
