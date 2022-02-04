import 'package:flutter/material.dart';
import 'package:site_molokovo/pages/contacts/contacts_info_widget.dart';
import 'package:site_molokovo/pages/contacts/map_widget.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        body: Column(
          children: [
            ContactsInfoWidget(),
            const SizedBox(height: 20,),
            Center(child: MapWidget())
          ],
        ),
        footer: Footer()
    );
  }
}