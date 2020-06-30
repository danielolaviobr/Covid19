import 'package:covid19/constants.dart';
import 'package:covid19/widgets/basic_container.dart';
import 'package:flutter/material.dart';

class DropList extends StatefulWidget {
  final Function onChange;

  const DropList({Key key, this.onChange}) : super(key: key);
  @override
  _DropListState createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  List<String> items = kStateList;
  String selected = 'Brasil';

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      child: DropdownButton(
          isExpanded: true,
          underline: Container(),
          icon: Icon(Icons.keyboard_arrow_down),
          value: selected,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'Dosis',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            widget.onChange(value);
            setState(() => selected = value);
          }),
      height: 80,
    );
  }
}
