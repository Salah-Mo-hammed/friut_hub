import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xFFF1F1F5),
        ),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFFF3F5F7),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
    );
  }
}
