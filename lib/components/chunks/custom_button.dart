import 'package:flutter/material.dart';

Widget customButton(
  onPressed, {
  required String title,
  required String desc,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36.0),
    child: SizedBox(
      height: 131.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: const Color(0xFFFFEFEF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Image.asset(
              'images/arrow.png',
              fit: BoxFit.contain,
              width: 30.0,
            )
          ],
        ),
      ),
    ),
  );
}
