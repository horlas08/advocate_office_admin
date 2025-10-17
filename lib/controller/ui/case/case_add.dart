import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CaseCreateController extends GetxController {
  final TextEditingController oppositionNameController = TextEditingController();
  final TextEditingController oppositionPhoneController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController witnessNameController = TextEditingController();
  final TextEditingController witnessPhoneController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  final TextEditingController caseSectionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();
  var selectedClientType = "".obs;

  var clientTypeList = [
    "الملتمس",
    "المدعى عليه",
    "مدعى",
  ].obs;

  RxList<String> selectedCaseSectionList = <String>[].obs;
  var selectedCaseType = "".obs;

  var caseTypeList = ["مجرم", "مدني", "أسرة", "عمل", "ملكية", "ضريبة", "إفلاس"].obs;
  final StringTagController tagsController = StringTagController();

  RxList<String> selectedTags = <String>[].obs;

  // Add a tag to the list
  void addTag(String tag) {
    if (!selectedTags.contains(tag)) {
      selectedTags.add(tag);
      tagsController.addTag(tag); // Add the tag to the controller = tag;
    }
  }

  var selectedCaseSection = "".obs;

  var caseSectionList = ["114", "302", "420", "498A", "377", "406", "138"].obs;

  var selectedCourt = "".obs;

  var courtList = ["المحكمة العليا", "المحكمة الجزئية", "محكمة الأسرة", "محكمة العمل"].obs;

  var selectCaseStage = "".obs;

  var caseStageList = ["Evidence Collection", "Preliminary Hearing", "Final Judgement", "Supreme Court Review"].obs;

  var selectedDivision = "".obs; // Selected value for division
  var selectedDistrict = "".obs; // Selected value for district
  var selectedThana = "".obs; // Selected value for thana

  var divisionList = ["Dhaka", "Chittagong", "Khulna", "Rajshahi"].obs;
  var districtList = <String>[].obs; // Dynamic list of districts based on division
  var thanaList = <String>[].obs; // Dynamic list of thanas based on district

  final Map<String, Map<String, List<String>>> locationData = {
    "Dhaka": {
      "Dhaka City": ["tulsan", "Banani", "Mirpur", "Dhanmondi"],
      "Gazipur": ["Tongi", "Kaliakoir", "Sreepur"],
    },
    "Chittagong": {
      "Chittagong City": ["Kotwali", "Panchlaish", "Halishahar"],
      "Cox's Bazar": ["Teknaf", "Ramu", "Ukhia"],
    },
    "Khulna": {
      "Khulna City": ["Sonadanga", "Khalishpur", "Rupsa"],
      "Bagerhat": ["Fakirhat", "Chitalmari", "Rampal"],
    },
    "Rajshahi": {
      "Rajshahi City": ["Boalia", "Motihar", "Rajpara"],
      "Natore": ["Baraigram", "Lalpur", "Singra"],
    },
  };

  void updateDistrictList(String division) {
    districtList.clear();
    thanaList.clear(); // Clear thanas if division changes
    if (locationData.containsKey(division)) {
      districtList.addAll(locationData[division]!.keys);
      selectedDistrict.value = districtList.first;
      updateThanaList(districtList.first);
    } else {
      log('Invalid division selected: $division');
    }
  }

  void updateThanaList(String district) {
    thanaList.clear();
    if (locationData[selectedDivision.value]?.containsKey(selectedDistrict.value) ?? false) {
      thanaList.addAll(locationData[selectedDivision.value]![selectedDistrict.value]!);
      selectedThana.value = thanaList.first;
    } else {
      log('Invalid district selected: $selectedDistrict');
    }
  }

  var image = Rx<Uint8List?>(null); // Use Uint8List for web images
  var imagePath = Rx<String?>(null);

  XFile? imgFile;

  var selectImage = Rx<String?>(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      image.value = await pickedFile.readAsBytes();
      imgFile = pickedFile;
    }
  }

  var imageList = <ImageItem>[].obs;
  void addImage(String title, Uint8List? image) {
    imageList.add(ImageItem(title: title, image: image));
  }

  var witnessList = <WitnessItem>[].obs;
  void addWitness(String name, String phone) {
    witnessList.add(WitnessItem(name: name, phone: phone));
  }

  var listWitnessController = <TextEditingController>[TextEditingController()].obs;

  void addController() {
    listWitnessController.add(TextEditingController());
  }

  void removeController(int index) {
    listWitnessController[index].dispose();
    listWitnessController.removeAt(index);
  }

  var tags = <String>[].obs;

  void onTagSubmitted(String tag) {
    if (!tags.contains(tag)) {
      tags.add(tag);
    }
  }

  void removeTag(String tag) {
    tags.remove(tag);
  }

  void clearTags() {
    tags.clear();
  }

  List<String> getSuggestions(String query) {
    if (query.isEmpty) return [];
    return caseSectionList.where((option) => option.contains(query.toLowerCase())).toList();
  }
}

class ImageItem {
  final String title;
  final Uint8List? image;

  ImageItem({required this.title, this.image});
}

class WitnessItem {
  final String name;
  final String phone;

  WitnessItem({required this.name, required this.phone});
}
