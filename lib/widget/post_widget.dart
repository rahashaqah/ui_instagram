import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostWidget extends StatefulWidget {
  final String userName;
  final String location;
  final String userImage;
  final List<String> postImages;
  final bool isVerified;
  final String likes;
  final String comment;
  final String likeImage;

  const PostWidget({
    super.key,
    required this.userName,
    required this.location,
    required this.userImage,
    required this.postImages,
    this.isVerified = false,
    required this.likes,
    required this.comment,
    required this.likeImage,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.all(9.0),
          child: Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(widget.userImage)),
               SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.userName,
                        style:  TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (widget.isVerified) ...[
                         SizedBox(width: 4),
                         Icon(Icons.verified, color: Colors.blue, size: 16),
                      ],
                    ],
                  ),
                  Text(widget.location, style:  TextStyle(fontSize: 12)),
                ],
              ),
               Spacer(),
               Icon(Icons.more_vert),
            ],
          ),
        ),

        // Post image with indicator
        SizedBox(
          height: 350,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: widget.postImages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    widget.postImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
              Positioned(
                top: 8,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${currentPage + 1}/${widget.postImages.length}",
                    style:  TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.postImages.length,
                (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Colors.black : Colors.grey[400],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
          child: Row(
            children: [
              SvgPicture.asset("assets/img/Like.svg"),
              SizedBox(width: 16),
              SvgPicture.asset("assets/img/Comment.svg"),
              SizedBox(width: 16),
              SvgPicture.asset("assets/img/send.svg"),
              Spacer(),
              Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image.asset(widget.likeImage,width: 18,height: 18,),
              SizedBox(width: 6,),
              Text( widget.likes,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: widget.userName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text:widget.comment),
              ],
            ),
          ),
        ),

        SizedBox(height: 16),

      ],
    );
  }
}
