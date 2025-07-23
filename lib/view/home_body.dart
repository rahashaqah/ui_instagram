import 'package:flutter/material.dart';
import 'package:ui_instagram/widget/post_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> storyCircle = [
      {'image': 'assets/img/profile.png', 'name': 'Your Story'},
      {'image': 'assets/img/user1.png', 'name': 'karennne'},
      {'image': 'assets/img/user2.png', 'name': 'zackjohn'},
      {'image': 'assets/img/user3.png', 'name': 'kieron_d'},
      {'image': 'assets/img/user1.png', 'name': 'karennne'},
      {'image': 'assets/img/user2.png', 'name': 'zackjohn'},
      {'image': 'assets/img/user3.png', 'name': 'kieron_d'},
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyCircle.length,
                itemBuilder: (context, index) {
                  final story = storyCircle[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange,
                                Colors.pink,
                                Colors.purple,
                              ],
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(story['image']!),
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(story['name']!, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(thickness: 0.5, color: Colors.grey[400]),
          PostWidget(
            userName: 'joshua_l',
            location: 'Tokyo, Japan',
            userImage: 'assets/img/p1.png',
            postImages: [
              'assets/img/post1.png',
              'assets/img/post1.png',
              'assets/img/post1.png',
            ],
            likeImage: 'assets/img/user2.png',
            isVerified: true,
            likes: "Liked by craig_love and others",
            comment: "The game in Japan was amazing!",
          ),
          PostWidget(
            userName: 'joshua_l',
            location: 'Tokyo, Japan',
            userImage: 'assets/img/user1.png',
            postImages: ['assets/img/post1.png', 'assets/img/post1.png'],
            likeImage: 'assets/img/user3.png',
            isVerified: false,
            likes: "Liked by craig_love and others",
            comment: "The game in Japan was amazing!",
          ),
          PostWidget(
            userName: 'joshua_l',
            location: 'Tokyo, Japan',
            userImage: 'assets/img/p1.png',
            postImages: [
              'assets/img/post1.png',
              'assets/img/post1.png',
              'assets/img/post1.png',
            ],
            likeImage: 'assets/img/user2.png',
            isVerified: true,
            likes: "Liked by craig_love and others",
            comment: "The game in Japan was amazing!",
          ),
        ],
      ),
    );
  }
}
