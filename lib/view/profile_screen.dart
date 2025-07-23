import 'package:flutter/material.dart';
import 'package:ui_instagram/widget/custom_button_widget.dart';
import 'package:ui_instagram/widget/profile_header.dart';

import '../widget/highlight_circle.dart';
import '../widget/profile_grid_tab.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onMenuTap;

  const ProfileScreen({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.lock, size: 14),
          SizedBox(width: 3),
          Text(
            "jacob_w",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Icon(Icons.keyboard_arrow_down, size: 19),
          SizedBox(width: 80),
          IconButton(icon: Icon(Icons.menu), onPressed: onMenuTap),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              imagePath: 'assets/img/profile.png',
              posts: 55,
              followers: 834,
              following: 162,
              name: 'Jacob West',
              bio:
                  'Digital goodies designer @pixsellz\nEverything is designed.',
            ),
            SizedBox(height: 10),
            CustomButton(
              onPress: () {},
              backgroundColor: Colors.white,
              height: 30,
              width: 327,
              title: "Edit Profile",
              textColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 95,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    HighlightCircle(isAdd: true, label: 'New'),
                    SizedBox(width: 15),
                    HighlightCircle(
                      imagePath: 'assets/img/hl1.png',
                      label: 'Friends',
                    ),
                    SizedBox(width: 15),
                    HighlightCircle(
                      imagePath: 'assets/img/hl2.png',
                      label: 'Sport',
                    ),
                    SizedBox(width: 15),
                    HighlightCircle(
                      imagePath: 'assets/img/hl3.png',
                      label: 'Design',
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on, color: Colors.black)),
                      Tab(
                        icon: Icon(
                          Icons.person_pin_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 400,
                    child: TabBarView(
                      children: [
                        ProfileGridWidget(
                          images: [
                            'assets/img/post0.png',
                            'assets/img/post2.png',
                            'assets/img/post3.png',
                            'assets/img/post5.png',
                            'assets/img/post6.png',
                            'assets/img/post7.png',
                            'assets/img/post8.png',
                            'assets/img/post9.png',
                            'assets/img/post10.png',
                          ],
                        ),
                        Center(child: Text('Tagged')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
