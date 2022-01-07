import 'package:flutter/material.dart';

import 'home_menu_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        backgroundColor: Colors.red.shade100,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                'MENU',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            HomeMuenuButton(
              textVAlue: 'Home',
              menuIcon: Icon(Icons.home),
              route: '/home',
            ),
            HomeMuenuButton(
              textVAlue: 'Rooms',
              menuIcon: Icon(Icons.bed_outlined),
              route: '/rooms',
            ),
            HomeMuenuButton(
              textVAlue: 'Profile',
              menuIcon: Icon(Icons.manage_accounts),
              route: '/profile',
            ),
            HomeMuenuButton(
              textVAlue: 'Complains',
              menuIcon: Icon(Icons.miscellaneous_services),
              route: '/complains',
            ),
            HomeMuenuButton(
              textVAlue: 'Checkout',
              menuIcon: Icon(Icons.check_box_outlined),
            ),
            // HomeMuenuButton(
            //   textVAlue: 'Comments',
            //   menuIcon: Icon(Icons.comment_outlined),
            // ),
            HomeMuenuButton(
              textVAlue: 'Suggestions',
              menuIcon: Icon(Icons.comment_outlined),
              route: '/suggestions',
            ),
            // HomeMuenuButton(
            //   textVAlue: 'Exit App',
            //   menuIcon: Icon(Icons.exit_to_app),
            // ),
          ],
        ),
      ),
    );
  }
}
