import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/ticket_row_date_widget.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class TicketDataWidget extends StatelessWidget {
  const TicketDataWidget({super.key,required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit,PostsStates>(
      builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15
            ),
            child:  Column(
              children: [

                Column(
                  children: [

                    /// Name
                    TicketRowDateWidget(category: 'Name',value: postModel.userName,),

                    /// I Have
                    TicketRowDateWidget(category: 'Flight',value: postModel.iHaveFlight,),

                    /// Date
                    TicketRowDateWidget(category: 'Date',value: postModel.dateTime,),

                    /// Report Start Time
                    TicketRowDateWidget(category: 'S-Time',value: postModel.startTime,),

                    /// Release End Time
                    TicketRowDateWidget(category: 'E-Time',value: postModel.endTime,),

                    /// Hours
                    // TicketRowDateWidget(category: 'Hours',value: postModel.,),

                    /// Willing to fly
                    // TicketRowDateWidget(category: 'W-Fly',value:postModel.,),

                  ],
                ),

              ],
            ),
          );
      },
    );
  }
}
