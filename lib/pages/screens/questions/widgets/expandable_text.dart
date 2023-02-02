import 'package:flutter/material.dart';

class ExpandText extends StatefulWidget {
  String text;
  ExpandText({required this.text});
  @override
  _ExpandTextState createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  bool _isExpanded = false;
  bool _basicInformationIsExpanded = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final TextSpan span = TextSpan(
        text: widget.text,
        style: TextStyle(
          fontSize: 13,
        ),
      );
      final TextPainter textPainter = TextPainter(
        text: span,
        maxLines: 1,
        ellipsis: '...',
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: constraints.maxWidth);

      if (textPainter.didExceedMaxLines) {
        print("exceed");
        return Row(
          crossAxisAlignment: _basicInformationIsExpanded
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 13,
                ),
                maxLines: _isExpanded ? null : 1,
                overflow: _isExpanded ? null : TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              child: _isExpanded
                  ? Icon(
                      Icons.expand_less,
                    )
                  : Icon(
                      Icons.expand_more,
                    ),
              onTap: () {
                setState(() => _isExpanded = !_isExpanded);
              },
            ),
          ],
        );
      } else {
        print("not exceed");
        return Text(
          widget.text,
          style: TextStyle(
            fontSize: 13,
          ),
        );
      }
    });
  }
}
