import 'package:flutter/cupertino.dart';

class RowExpandableWidget extends StatefulWidget {
  final String image;
  final String text;
  final Widget content;

  const RowExpandableWidget(
      {super.key, required this.text, required this.image, required this.content});

  @override
  State<RowExpandableWidget> createState() {
    // TODO: implement createState
    return _RowExpandableWidget();
  }
}

class _RowExpandableWidget extends State<RowExpandableWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0)),
                Image.asset(widget.image, width: 40.0, height: 40.0),
                Expanded(
                  child: Text(widget.text),
                ),
              ],
            ),
          ),
          if (isExpanded)
            widget.content


        ],
      ),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });

      },
    );
  }
}
