import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  String insertext;
  TextStyle? style;
  IconData? leader;
  IconData? follow;
  String? leadtext;

  SpecialText(
      {required this.insertext,
      this.style,
      this.leader,
      this.follow,
      this.leadtext});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        //style: style,
        children: [
          TextSpan(text: leadtext, style: style),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon(
                leader,
                color: style?.color,
              ),
            ),
          ),
          TextSpan(text: insertext, style: style),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon(follow),
            ),
          ),
        ],
      ),
    );
  }
}
