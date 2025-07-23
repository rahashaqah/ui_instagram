import 'package:flutter/material.dart';
import 'package:ui_instagram/view/login_screen.dart';

class ProfileMenuPage extends StatelessWidget {
  const ProfileMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(title: Text("s.khasanov_", style: TextStyle(fontWeight: FontWeight.bold))),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Archive'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Your Activity'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.qr_code),
              title: Text('Nametag'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border),
              title: Text('Saved'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text('Close Friends'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person_add_alt),
              title: Text('Discover People'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Open Facebook'),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              },

            ),
            SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
