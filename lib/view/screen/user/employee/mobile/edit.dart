import 'package:advocateoffice/controller/ui/user/employee.dart';
import 'package:advocateoffice/model/employee_data.dart';
import 'package:advocateoffice/view/common_widgets.dart/common_field.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_button.dart';
import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:advocateoffice/view/common_widgets.dart/date_picker.dart';
import 'package:advocateoffice/view/common_widgets.dart/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class EmployeeEdit extends StatelessWidget {
  EmployeeEdit({
    super.key,
    required this.data,
    required this.controller,
  });
  final EmployeeDataModel data;
  final EmployeeController controller;

  @override
  Widget build(BuildContext context) {
    controller.employeeNameController.text = data.name.toString();
    controller.employeeNumberController.text = data.phone.toString();
    controller.employeeMailController.text = data.mail.toString();
    controller.employeeDesignationController.text = data.designation.toString();

    final parsedDate = DateFormat("d MMM yyyy").parse(data.joinDate.toString());

    controller.selectedDate.value = parsedDate;
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: "تعديل الموظف",fontColor: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).focusColor,
          width: 700,
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.fromKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomTextWidget(text: "صورة الموظف"),
                const SizedBox(height: 10),
                ImagePick(
                  controller: controller,
                ),
                const SizedBox(height: 25),
                CommonField(
                  controller: controller.employeeNameController,
                  text: 'اسم الموظف',
                  hintText: 'أدخل اسم الموظف',
                  validator: 'الرجاء إدخال اسم الموظف',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.employeeNumberController,
                  text: 'هاتف الموظف',
                  hintText: 'أدخل رقم هاتف الموظف',
                  validator: 'الرجاء إدخال رقم هاتف الموظف',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.employeeMailController,
                  text: 'البريد الإلكتروني',
                  hintText: 'أدخل البريد الإلكتروني للموظف',
                  validator: 'الرجاء إدخال البريد الإلكتروني',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CommonField(
                  controller: controller.employeeDesignationController,
                  text: 'المسمى الوظيفي',
                  hintText: 'أدخل المسمى الوظيفي',
                  validator: 'الرجاء إدخال المسمى الوظيفي',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                SfDatePickerWidget(
                  selectedDate: controller.selectedDate,
                  title: 'تاريخ الانضمام',
                  maxDate: DateTime(2030),
                  onSelectionChanged: (args) {
                    if (args.value is DateTime) {
                      controller.updateSelectedDate(args.value);
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
          child:
            CustomButtonWidget(buttonName: "تأكيد", onTap: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
