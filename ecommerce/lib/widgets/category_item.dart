import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String type;

  const CategoryItem({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 100,
    //   width: 100,
    //   decoration: BoxDecoration(
    //       color: Colors.grey[300],
    //       borderRadius: BorderRadius.all(Radius.circular(15))),
    //   child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Icon(
    //           Icons.phone_android,
    //           size: 40,
    //         ),
    //         Text(type),
    //       ]),
    // );
    return ElevatedButton(
      onPressed: () {
        // Add your button press logic here
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        primary: Colors.grey[200],
        elevation: 0,
        onPrimary: Colors.black,
      ),
      child: Container(
        height: 100,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_android,
              size: 40,
              color: Colors.black,
            ),
            Text(
              type,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
