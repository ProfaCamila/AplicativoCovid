import 'package:flutter/material.dart';
class CheckBoxModel{
  
  CheckBoxModel({this.texto, this.checked = false});
  
  String texto;
  bool checked;
}
class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({ Key key, this.item }) : super(key: key);

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.item.texto),
      value: widget.item.checked,
      onChanged: (bool value){
        setState((){
          widget.item.checked = value;
        });
      },
    );
  }
}