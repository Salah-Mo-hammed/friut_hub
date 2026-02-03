import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/notificatiosn_widgets/notificatios_row_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/notificatiosn_widgets/tow_texts_row_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  static const routeName = "NotificationsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "الاشعارات"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    if (index == 0) ...[
                      TowTextsRow(title: "جديد"),
                      // ! this with the current date today (now) 
                      NotificationRow(index: index),
                    ],

                    if (index == 3) ...[

                      TowTextsRow(title: "في وقت سابق"),
                    ],
                    // ! all previous days 
                    NotificationRow(index: index),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
