import 'package:advocateoffice/view/screen/clients/clients_view/mobile/widgets/datatabel.dart';
import 'package:advocateoffice/view/screen/clients/clients_view/mobile/widgets/header.dart';

import 'package:flutter/material.dart';

class ClientsViewMobile extends StatelessWidget {
  const ClientsViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Details'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ClientsViewHeaderMobile(),
                    const SizedBox(height: 20),
                    CaseTableMobile(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
