import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  final String insertext;
  final TextStyle? style;
  final IconData? leader;
  final IconData? follow;
  final String? leadtext;
  final bool divider;

  const SpecialText(
      {super.key,
      required this.insertext,
      this.style,
      this.leader,
      this.follow,
      this.leadtext,
      this.divider = false});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        //style: style,
        children: [
          if (leadtext != null) TextSpan(text: leadtext, style: style),
          if (leader != null)
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
          divider
              ? const WidgetSpan(child: Divider(thickness: 1))
              : WidgetSpan(
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
