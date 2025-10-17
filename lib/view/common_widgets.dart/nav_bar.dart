import 'package:advocateoffice/controller/ui/nav_bar.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/screen/case/case_list/case_list.dart';
import 'package:advocateoffice/view/screen/my_task/case_task/case_task.dart';
import 'package:advocateoffice/view/screen/clients/clients_list/clients.dart';
import 'package:advocateoffice/view/screen/dashboard/dashboard.dart';
import 'package:advocateoffice/view/screen/expense/expense.dart';
import 'package:advocateoffice/view/screen/extra_income/extra_income.dart';
import 'package:advocateoffice/view/screen/fee_received/fee_received.dart';
import 'package:advocateoffice/view/screen/hearing_management/hearing_management.dart';
import 'package:advocateoffice/view/screen/notifications/notification.dart';
import 'package:advocateoffice/view/screen/portfolio/contact_us/contact_us.dart';
import 'package:advocateoffice/view/screen/portfolio/home_about/home.dart';
import 'package:advocateoffice/view/screen/portfolio/service/service.dart';
import 'package:advocateoffice/view/screen/portfolio/team/team.dart';
import 'package:advocateoffice/view/screen/portfolio/testimonials/testimonials.dart';
import 'package:advocateoffice/view/screen/settings/case_info/case_info.dart';
import 'package:advocateoffice/view/screen/settings/case_sections/case_section.dart';
import 'package:advocateoffice/view/screen/todo/todo.dart';
import 'package:advocateoffice/view/screen/user/employee/employee.dart';
import 'package:advocateoffice/view/screen/user/role/role.dart';
import 'package:advocateoffice/view/screen/visitor/visitor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarView extends StatelessWidget {
  NavigationBarView({super.key});
  final NavigationBarController controller = Get.put(NavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Container(
            width: controller.isExpanded.value ? 200 : 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.2),
                  Theme.of(context).primaryColor.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    _buildNavItem(
                      context: context,
                      icon: Icons.dashboard,
                      label: 'لوحة البيانات',
                      page: DashboardScreen(),
                      routeName: RoutesName.dashboard,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.person_pin,
                      label: ' الزوار',
                      page: VisitorScreen(),
                      routeName: RoutesName.visitor,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.switch_account_rounded,
                      label: 'الموكلين',
                      page: ClientsScreen(),
                      routeName: RoutesName.clients,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.file_copy,
                      label: 'الدعاوي',
                      page: CaseScreen(),
                      routeName: RoutesName.cases,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.record_voice_over,
                      label: 'الجلسات',
                      page: HearingManagementScreen(),
                      routeName: RoutesName.hearingManagement,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.monetization_on_outlined,
                      label: 'الاتعاب المستلمة',
                      page: FeeReceivedScreen(),
                      routeName: RoutesName.feeReceived,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.monetization_on_outlined,
                      label: 'الدخل الاضافى',
                      page: ExtraIncomeScreen(),
                      routeName: RoutesName.extraIncome,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.explicit_outlined,
                      label: 'المصاريف',
                      page: ExpenseScreen(),
                      routeName: RoutesName.expense,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.task,
                      label: 'مهامي بالدعاوي',
                      page: CaseTaskScreen(),
                      routeName: RoutesName.caseTask,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.note_sharp,
                      label: 'مهامي الاخرى',
                      page: ToDoScreen(),
                      routeName: RoutesName.toDo,
                    ),
                    const SizedBox(height: 8),
                    _buildNavItem(
                      context: context,
                      icon: Icons.notifications,
                      label: 'الاشعارات',
                      page: NotificationScreen(),
                      routeName: RoutesName.notification,
                    ),
                    const SizedBox(height: 8),
                    buildExpansionTile(
                      context: context,
                      status: controller.isUserManagementExpanded.value,
                      icon: Icons.supervised_user_circle_rounded,
                      title: "المستخدمين",
                      myWidget: [
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.badge,
                          label: 'عامل',
                          page: EmployeeScreen(),
                          routeName: RoutesName.employee,
                          width: 170,
                        ),
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.security,
                          label: 'دور المستخدم',
                          page: RoleScreen(),
                          routeName: RoutesName.userRole,
                          width: 170,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    buildExpansionTile(
                      status: controller.isSettingsExpanded.value,
                      icon: Icons.settings,
                      context: context,
                      title: "الاعدادات",
                      myWidget: [
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.cases_outlined,
                          label: 'معلومات القضية',
                          page: CaseInfoScreen(),
                          routeName: RoutesName.caseInfo,
                          width: 170,
                        ),
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.gavel,
                          label: 'قسم القضايا',
                          page: CaseSectionScreen(),
                          routeName: RoutesName.caseSection,
                          width: 170,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    buildExpansionTile(
                      status: controller.isPortfolioExpanded.value,
                      icon: Icons.web,
                      context: context,
                      title: "الملف التعريفي",
                      myWidget: [
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.home_max_outlined,
                          label: 'المنزل وحول',
                          page: HomePortfolioSection(),
                          routeName: RoutesName.portfolioHome,
                          width: 180,
                        ),
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.home_repair_service_rounded,
                          label: 'خدمة',
                          page: ServiceScreen(),
                          routeName: RoutesName.portfolioService,
                          width: 170,
                        ),
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.groups_2,
                          label: 'الفريق',
                          page: TeamScreen(),
                          routeName: RoutesName.portfolioTeam,
                          width: 170,
                        ),
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.speaker_notes,
                          label: 'شهادة',
                          page: TestimonialsScreen(),
                          routeName: RoutesName.portfolioTestimonials,
                          width: 170,
                        ),
                        const SizedBox(height: 8),
                        _buildNavItem(
                          context: context,
                          icon: Icons.contact_emergency_sharp,
                          label: 'اتصل بنا',
                          page: ContactUsPortfolioSection(),
                          routeName: RoutesName.portfolioContactUs,
                          width: 170,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                controller.isExpanded.value ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: controller.toggleSidebar,
            ),
          ),
        ],
      );
    });
  }

  ExpansionTile buildExpansionTile({
    required BuildContext context,
    required List<Widget> myWidget,
    required String title,
    required bool status,
    required IconData icon,
  }) {
    return ExpansionTile(
      initiallyExpanded: status,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      collapsedShape: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(.2),
      iconColor: Theme.of(context).textTheme.bodySmall!.color,
      childrenPadding: EdgeInsets.symmetric(vertical: 15),
      leading: Icon(icon, color: Theme.of(context).textTheme.bodySmall!.color),
      title: CustomTextWidget(
        text: title,
        fontColor: Theme.of(context).textTheme.bodySmall!.color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      children: myWidget,
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Widget page,
    required String routeName,
    double? width,
  }) {
    controller.isSelected = controller.currentPage.value == routeName;
    return InkWell(
      onTap: () {
        controller.updateSelectedPage(routeName);
        Get.offAll(
          () => page,
          transition: Transition.fade,
          routeName: routeName,
          duration: const Duration(milliseconds: 0),
        );
      },
      child: Container(
        width: width ?? 300,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: controller.isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: controller.isSelected ? Colors.white : Theme.of(context).textTheme.bodySmall!.color),
            if (controller.isExpanded.value) const SizedBox(width: 16),
            if (controller.isExpanded.value)
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: controller.isSelected ? Colors.white : Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
