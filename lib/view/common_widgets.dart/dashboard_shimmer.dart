import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildExpanded(color: Theme.of(context).cardColor),
              SizedBox(width: 20),
              buildExpanded(color: Theme.of(context).cardColor),
              SizedBox(width: 20),
              buildExpanded(color: Theme.of(context).cardColor),
              SizedBox(width: 20),
              buildExpanded(color: Theme.of(context).cardColor),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Theme.of(context).cardColor,
                  highlightColor:  Theme.of(context).cardColor.withOpacity(.8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildExpanded({required Color color}) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: color,
        highlightColor: color,
        child: Container(
          height: 120,
           decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
