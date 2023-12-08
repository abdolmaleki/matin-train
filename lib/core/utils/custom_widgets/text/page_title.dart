import 'package:flutter/material.dart';

class CustomPageTitleWidget extends StatelessWidget {
  const CustomPageTitleWidget({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Expanded(child: SizedBox()),
          if(trailing!=null)
            trailing!,
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
