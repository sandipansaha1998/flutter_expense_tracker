import 'package:flutter/material.dart';

class DisplayCard extends StatefulWidget {
  late int displayData = 0;
  late String title;
  DisplayCard(this.displayData, this.title, {super.key});

  @override
  State<DisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<DisplayCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.10,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${widget.displayData}',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
