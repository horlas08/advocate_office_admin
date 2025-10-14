import 'package:advocateoffice/controller/ui/nav_bar.dart';
import 'package:advocateoffice/routes/screen_name.dart';
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
import 'custom_text.dart';

class NavigationBarViewMobile extends StatelessWidget {
  final NavigationBarController controller = Get.put(NavigationBarController());

  NavigationBarViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(() {
        return ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.3),
                    Theme.of(context).primaryColor.withOpacity(0.6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/advocate.png", height: 80, width: 80),
                    CustomTextWidget(
                      text: "Advocate Office",
                      fontSize: 20,
                      fontColor: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            _buildNavItem(
              context: context,
              icon: Icons.dashboard,
              label: 'Dashboard',
              page: DashboardScreen(),
              routeName: RoutesName.dashboard,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.person_pin,
              label: 'Visitor',
              page: VisitorScreen(),
              routeName: RoutesName.visitor,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.switch_account_rounded,
              label: 'Clients',
              page: ClientsScreen(),
              routeName: RoutesName.clients,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.file_copy,
              label: 'Cases',
              page: CaseScreen(),
              routeName: RoutesName.cases,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.record_voice_over,
              label: 'Hearing',
              page: HearingManagementScreen(),
              routeName: RoutesName.hearingManagement,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.monetization_on_outlined,
              label: 'Fee Received',
              page: FeeReceivedScreen(),
              routeName: RoutesName.feeReceived,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.monetization_on_outlined,
              label: 'Extra Income',
              page: ExtraIncomeScreen(),
              routeName: RoutesName.extraIncome,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.explicit_outlined,
              label: 'Expense',
              page: ExpenseScreen(),
              routeName: RoutesName.expense,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.task,
              label: 'Case Task',
              page: CaseTaskScreen(),
              routeName: RoutesName.caseTask,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.note_sharp,
              label: 'ToDo',
              page: ToDoScreen(),
              routeName: RoutesName.toDo,
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              context: context,
              icon: Icons.notifications,
              label: 'Notification',
              page: NotificationScreen(),
              routeName: RoutesName.notification,
            ),
            const SizedBox(height: 8),
            buildExpansionTile(
              context: context,
              status: controller.isUserManagementExpanded.value,
              icon: Icons.supervised_user_circle_rounded,
              title: "User",
              myWidget: [
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.badge,
                  label: 'Employee',
                  page: EmployeeScreen(),
                  routeName: RoutesName.employee,
                  width: 170,
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.security,
                  label: 'User Role',
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
              title: "Settings",
              myWidget: [
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.cases_outlined,
                  label: 'Case Info',
                  page: CaseInfoScreen(),
                  routeName: RoutesName.caseInfo,
                  width: 170,
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.gavel,
                  label: 'Case Section',
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
              title: "Portfolio",
              myWidget: [
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.home_max_outlined,
                  label: 'Home',
                  page: HomePortfolioSection(),
                  routeName: RoutesName.portfolioHome,
                  width: 170,
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.home_repair_service_rounded,
                  label: 'Service',
                  page: ServiceScreen(),
                  routeName: RoutesName.portfolioService,
                  width: 170,
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.groups_2,
                  label: 'Team',
                  page: TeamScreen(),
                  routeName: RoutesName.portfolioTeam,
                  width: 170,
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.speaker_notes,
                  label: 'Testimonials',
                  page: TestimonialsScreen(),
                  routeName: RoutesName.portfolioTestimonials,
                  width: 170,
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context: context,
                  icon: Icons.contact_emergency_sharp,
                  label: 'Contact Us',
                  page: ContactUsPortfolioSection(),
                  routeName: RoutesName.portfolioContactUs,
                  width: 170,
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        );
      }),
    );
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
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      collapsedShape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
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
          color: controller.isSelected
              ? Theme.of(context).primaryColor
              : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: controller.isSelected
                    ? Colors.white
                    : Theme.of(context).textTheme.bodySmall!.color),
            if (controller.isExpanded.value) const SizedBox(width: 16),
            if (controller.isExpanded.value)
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: controller.isSelected
                        ? Colors.white
                        : Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
