import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String imagePath;
  final int posts;
  final int followers;
  final int following;
  final String name;
  final String bio;

  const ProfileHeader({
    super.key,
    required this.imagePath,
    required this.posts,
    required this.followers,
    required this.following,
    required this.name,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text("$posts", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
                Text("Posts", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(width: 22),
            Column(
              children: [
                Text("$followers", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
                Text("Followers", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(width: 22),
            Column(
              children: [
                Text("$following", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
                Text("Following", style: TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
              Text(bio),
            ],
          ),
        ),
      ],
    );
  }
}
