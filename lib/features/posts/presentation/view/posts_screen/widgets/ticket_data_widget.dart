import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/ticket_row_date_widget.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class TicketDataWidget extends StatelessWidget {
  const TicketDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15
      ),
      child: const Column(
        children: [

          Column(
            children: [

              /// Name
              TicketRowDateWidget(category: 'Name',value: 'Mahmoud Reda',),

              /// I Have
              TicketRowDateWidget(category: 'Flight',value: 'Paris',),

              /// Date
              TicketRowDateWidget(category: 'Date',value: '21 Jane',),

              /// Report Start Time
              TicketRowDateWidget(category: 'S-Time',value: '12 Pm,19 Jane',),

              /// Release End Time
              TicketRowDateWidget(category: 'E-Time',value: '12 Am,25 Jane',),

              /// Hours
              TicketRowDateWidget(category: 'Hours',value: '3 Hours',),

              /// Willing to fly
              TicketRowDateWidget(category: 'W-Fly',value: '8 Pm,25 Jan',),

            ],
          ),


        ],
      ),
    );
  }
}
