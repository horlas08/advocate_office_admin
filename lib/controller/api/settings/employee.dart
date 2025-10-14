import 'dart:developer';

import 'package:advocateoffice/data/employee.dart';
import 'package:advocateoffice/model/employee_data.dart';

class EmployeeService {
  static Future<List<EmployeeDataModel>> getService() async {
    try {
      List<EmployeeDataModel> employeeData = [];
      await Future.delayed(Duration(seconds: 1));
      for (var i in EmployeeData.employeeList) {
        EmployeeDataModel employeeDataModel = EmployeeDataModel.fromJson(i);
        employeeData.add(employeeDataModel);
      }
      return employeeData;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
