import 'package:advocateoffice/view/common_widgets.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

class SearchAndAddSectionWidgetMobile extends StatelessWidget {
  const SearchAndAddSectionWidgetMobile({
    super.key,
    this.searchController,
    required this.searchTap,
    required this.buttonTap,
    this.totalData,
    required this.buttonName,
    this.isButtonEnable,
  });

  final TextEditingController? searchController;
  final Function(String) searchTap;
  final VoidCallback buttonTap;
  final String? totalData;
  final String buttonName;
  final bool? isButtonEnable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
                text: totalData ?? "",
                fontColor: Theme.of(context).textTheme.headlineMedium!.color,
                fontWeight: FontWeight.w500),
            isButtonEnable == null || isButtonEnable == true
                ? CustomButtonWidget(
                    vertical: 13,
                    buttonColor: Colors.white,
                    textColor: Theme.of(context).primaryColor,
                    buttonName: buttonName,
                    onTap: buttonTap,
                  )
                : SizedBox()
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor.withOpacity(0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: TextField(
            controller: searchController,
            onChanged: searchTap,
            cursorColor: Theme.of(context).textTheme.headlineMedium!.color,
            style: TextStyle(
                color: Theme.of(context).textTheme.headlineMedium!.color,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,
                  color: Theme.of(context).iconTheme.color),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: 'إبحث هنا..',
              hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.headlineMedium!.color,
                  fontWeight: FontWeight.w400),
              labelStyle: TextStyle(
                  color: Theme.of(context).textTheme.headlineMedium!.color,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
