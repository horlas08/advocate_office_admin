import 'package:advocateoffice/controller/ui/auth_controller.dart';
import 'package:advocateoffice/routes/screen_name.dart';
import 'package:advocateoffice/view/screen/case/case_add/case_add.dart';
import 'package:advocateoffice/view/screen/case/case_list/case_list.dart';
import 'package:advocateoffice/view/screen/case/case_view/case_view.dart';
import 'package:advocateoffice/view/screen/my_task/case_task/case_task.dart';
import 'package:advocateoffice/view/screen/clients/clients_list/clients.dart';
import 'package:advocateoffice/view/screen/clients/clients_view/clients_view.dart';
import 'package:advocateoffice/view/screen/expense/expense.dart';
import 'package:advocateoffice/view/screen/extra_income/extra_income.dart';
import 'package:advocateoffice/view/screen/fee_received/fee_received.dart';
import 'package:advocateoffice/view/screen/hearing_management/hearing_management.dart';
import 'package:advocateoffice/view/screen/login/login.dart';
import 'package:advocateoffice/view/screen/notifications/notification.dart';
import 'package:advocateoffice/view/screen/portfolio/contact_us/contact_us.dart';
import 'package:advocateoffice/view/screen/portfolio/home_about/home.dart';
import 'package:advocateoffice/view/screen/portfolio/service/service.dart';
import 'package:advocateoffice/view/screen/portfolio/team/team.dart';
import 'package:advocateoffice/view/screen/portfolio/testimonials/testimonials.dart';
import 'package:advocateoffice/view/screen/profile/profile.dart';
import 'package:advocateoffice/view/screen/settings/case_info/case_info.dart';
import 'package:advocateoffice/view/screen/settings/case_sections/case_section.dart';
import 'package:advocateoffice/view/screen/todo/todo.dart';
import 'package:advocateoffice/view/screen/user/employee/employee.dart';
import 'package:advocateoffice/view/screen/user/role/role.dart';
import 'package:advocateoffice/view/screen/visitor/visitor.dart';
import 'package:advocateoffice/view/screen/dashboard/dashboard.dart';
import 'package:advocateoffice/view/screen/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetPages {
  static List<GetPage<dynamic>> getPage = [
    GetPage(name: RoutesName.splash, page: () => SplashScreen()),
    GetPage(name: RoutesName.login, page: () => LoginScreen()),
    GetPage(name: RoutesName.dashboard, page: () => DashboardScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.visitor, page: () => VisitorScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.clients, page: () => ClientsScreen(), middlewares: [AuthGuard()]),
    GetPage(name: "/:parent${RoutesName.clientDetails}", page: () => ClientsViewScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.caseCreate, page: () => CaseAddScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.cases, page: () => CaseScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.employee, page: () => EmployeeScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.userRole, page: () => RoleScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.caseInfo, page: () => CaseInfoScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.caseSection, page: () => CaseSectionScreen(), middlewares: [AuthGuard()]),
    GetPage(name: "/:parent/:child${RoutesName.caseDetails}/:caseID", page: () => CaseViewScreen(), middlewares: [AuthGuard()]),
    GetPage(name: "/:parent${RoutesName.caseDetails}/:caseID", page: () => CaseViewScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.feeReceived, page: () => FeeReceivedScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.expense, page: () => ExpenseScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.notification, page: () => NotificationScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.toDo, page: () => ToDoScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.caseTask, page: () => CaseTaskScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.hearingManagement, page: () => HearingManagementScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.extraIncome, page: () => ExtraIncomeScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.profile, page: () => ProfileScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.portfolioHome, page: () => HomePortfolioSection(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.portfolioService, page: () => ServiceScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.portfolioTeam, page: () => TeamScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.portfolioTestimonials, page: () => TestimonialsScreen(), middlewares: [AuthGuard()]),
    GetPage(name: RoutesName.portfolioContactUs, page: () => ContactUsPortfolioSection(), middlewares: [AuthGuard()]),
  ];
}

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.find<AuthController>();

    if (!authController.isLoggedIn.value) {
      return RouteSettings(name: RoutesName.login);
    }
    return null;
  }
}
