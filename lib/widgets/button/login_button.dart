import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color logoColor;
  final String title;
  final Color backgroundColor;
  final Icon icon;
  final Function()? onClickEvent;

  const LoginButton({
    super.key,
    required this.logoColor,
    required this.title,
    required this.backgroundColor,
    required this.icon,
    this.onClickEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: logoColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: icon,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: onClickEvent,
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
