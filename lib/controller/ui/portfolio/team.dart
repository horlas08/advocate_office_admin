import 'package:advocateoffice/controller/api/portfolio/team.dart';
import 'package:advocateoffice/model/portfile/team.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {
  RxList<TeamModel> teamList = <TeamModel>[].obs;
  RxBool isLoading = true.obs;
  RxList<bool> teamStatus = <bool>[].obs;

  getTeam() async {
    isLoading.value = true;
    teamList.value = await PortfolioTeamService.service();
    for(var i in teamList){
      teamStatus.add(i.status == 1 ? true : false);
    }
    isLoading.value = false;
  }

  activeDeActiveFun({required bool status}) {}

  @override
  void onInit() {
    super.onInit();
    getTeam();
  }
}
