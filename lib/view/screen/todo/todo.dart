import 'package:advocateoffice/controller/ui/todo.dart';
import 'package:advocateoffice/utils/responsive.dart';
import 'package:advocateoffice/view/screen/todo/desktop/desktop.dart';
import 'package:advocateoffice/view/screen/todo/mobile/mobile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  final ToDoController controller = Get.put(ToDoController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveWidget(
          desktop: ToDoTabletDesktop(controller: controller),
          tablet: ToDoTabletDesktop(controller: controller,childAspectRatio: 1.5,crossAxisCount: 2,),
          phone: ToDoTabletMobile(controller: controller,childAspectRatio: 2.1,crossAxisCount: 1 ,),
        ),
      ),
    );
  }
}
