import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        margin: const EdgeInsets.all(.5),
        width: MediaQuery.of(context).size.width / 4 - 2, 
        height: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.3),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
