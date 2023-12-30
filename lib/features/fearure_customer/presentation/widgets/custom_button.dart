import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key,required this.onPressed,required this.icon,required this.label});
  final Function()onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      side: const BorderSide(width: 1,color:Color.fromRGBO(63, 71, 96, 0.48) ),
      backgroundColor: Colors.white
    ), child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8,),
          Text(label,style: theme.textTheme.bodySmall,)
        ],
      ),
    ),
    );
  }
}
