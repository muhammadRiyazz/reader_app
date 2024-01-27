import 'package:flutter/material.dart';


class MainButton extends StatelessWidget {
  const MainButton({
    required this.ontap,
    required this.title,
    super.key,
  });
  final ontap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: ontap,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(child: Text(title, )),
        ),
      ),
    );
  }
}


