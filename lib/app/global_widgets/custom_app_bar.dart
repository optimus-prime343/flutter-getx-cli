import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarImage(
            child: Image.asset(
              'assets/images/cipher_logo.png',
            ),
          ),
          AppBarImage(
            child: Image.network('https://thispersondoesnotexist.com/image'),
            borderRadius: 60,
          ),
        ],
      ),
    );
  }
}

class AppBarImage extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;

  const AppBarImage({
    Key? key,
    required this.child,
    this.height = 50,
    this.width = 50,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}
