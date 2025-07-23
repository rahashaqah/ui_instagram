import 'package:flutter/material.dart';

class HighlightCircle extends StatelessWidget {
  final String? imagePath;
  final String label;
  final bool isAdd;

  const HighlightCircle({
    super.key,
    this.imagePath,
    required this.label,
    this.isAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width:70,
          height: 70,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: isAdd ? null : AssetImage(imagePath!),
            child: isAdd
                ? Icon(Icons.add, size: 30, color: Colors.black)
                : null,
          ),
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
