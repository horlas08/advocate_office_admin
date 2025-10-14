import 'package:advocateoffice/routes/screen_name.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  RxString currentPage = ''.obs;
  RxBool isExpanded = true.obs;
  RxBool isUserManagementExpanded = false.obs;
  RxBool isSettingsExpanded = false.obs;
  RxBool isPortfolioExpanded = false.obs;
  bool isSelected = false;

  @override
  void onInit() {
    super.onInit();
    currentPage.value = Get.currentRoute.isNotEmpty ? Get.currentRoute : '/';
    getSelectedData();
  }

  getSelectedData() {
    List<String> portfolioPageList = [
      RoutesName.portfolioHome,
      RoutesName.portfolioService,
      RoutesName.portfolioTeam,
      RoutesName.portfolioTestimonials,
      RoutesName.portfolioContactUs,
    ];

    if (currentPage.value == RoutesName.employee || currentPage.value == RoutesName.userRole) {
      isUserManagementExpanded.value = true;
      isSettingsExpanded.value = false;
      isPortfolioExpanded.value = false;
    } else if (currentPage.value == RoutesName.caseInfo || currentPage.value == RoutesName.caseSection) {
      isSettingsExpanded.value = true;
      isPortfolioExpanded.value = false;
      isUserManagementExpanded.value = false;
    } else {
      bool status = portfolioPageList.contains(currentPage.value);
      if (status) {
        isPortfolioExpanded.value = true;
        isSettingsExpanded.value = false;
        isUserManagementExpanded.value = false;
      }
    }
  }

  void updateSelectedPage(String page) {
    currentPage.value = page;
  }

  void toggleSidebar() {
    isExpanded.value = !isExpanded.value;
  }
}
