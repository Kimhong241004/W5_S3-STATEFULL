import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: ButtonColumn(),
                    ),
              ),
    ));


class ButtonColumn extends StatelessWidget {
  const ButtonColumn({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SelectionWidget(),
        SizedBox(height: 20),
        SelectionWidget(),
        SizedBox(height: 20),
        SelectionWidget(),
        SizedBox(height: 20),
        SelectionWidget(),
      ],
    );
  }
}

class SelectionWidget extends StatefulWidget {
  const SelectionWidget({Key? key}) : super(key: key);

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  bool isSelected = false;

  String get label => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color? get backgroundColor => isSelected ? Colors.blue[500] : Colors.blue[50];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}


