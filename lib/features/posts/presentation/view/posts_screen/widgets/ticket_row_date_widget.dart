import 'package:flutter/material.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class TicketRowDateWidget extends StatelessWidget {
  const TicketRowDateWidget({super.key,required this.category,required this.value});

  final String category;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
              '$category : ',
              textAlign: TextAlign.start,
              style: TextStyles.textStyle18Regular.copyWith(color: Colors.white)
          ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: Text(
              value,
              textAlign: TextAlign.start,
              style:TextStyles.textStyle18Regular.copyWith(
                  color: Colors.white
              )
          ),
        ),

      ],
    );
  }
}
