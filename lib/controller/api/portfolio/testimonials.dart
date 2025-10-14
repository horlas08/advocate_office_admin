import 'dart:developer';

import 'package:advocateoffice/data/portfolio/testimonials.dart';
import 'package:advocateoffice/model/portfile/testimonials.dart';

class PortfolioTestimonialsService {
  static Future<List<TestimonialsModel>> service() async {
    try {
      Future.delayed(Duration(seconds: 1));
      List<TestimonialsModel> myList = [];
      for (var i in TestimonialsDataList().data) {
        TestimonialsModel  testimonialsModel = TestimonialsModel.fromJson(i);
        myList.add(testimonialsModel);
      }
      return myList;
    } catch (e) {
      log("Error : $e");
    }
    return [];
  }
}
