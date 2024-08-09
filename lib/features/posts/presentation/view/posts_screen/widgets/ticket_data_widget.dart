import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/ticket_row_date_widget.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

import '../../../../../../core/helper/app_size_config.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  children: [

                    /// I Have
                    Row(
                      children: [
                        TicketRowDateWidget(category: 'I Have ',value: postModel.iHaveFlight,),

                        SizedBox(width:SizeConfig.width*0.1,),

                        Text(postModel.iHaveLav,style: TextStyles.textStyle18Bold.
                        copyWith(color: Colors.white),),
                      ],
                    ),

                    /// Report Start Time
                    TicketRowDateWidget(category: 'S-Time',value: postModel.startTime,),


                    postModel.iHaveLav=='Layover'?
                    TicketRowDateWidget(category: 'Layover ',value: '${postModel.iHaveHours} hr',):
                    Container(),

                    /// I Want
                    Row(
                      children: [
                        TicketRowDateWidget(category: 'I Want ',value: postModel.iWantFlight,),

                        SizedBox(width:SizeConfig.width*0.1,),

                        Text(postModel.iWantLav,style: TextStyles.textStyle18Bold.
                        copyWith(color: Colors.white),),
                      ],
                    ),

                    postModel.iWantLav=='Layover'?
                    TicketRowDateWidget(category: 'Layover ',value: '${postModel.iWantHours} hr',):
                    Container(),

                    /// Willing to fly

                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('WTF',style: TextStyles.textStyle18Bold,)
                    ),

                    Container(
                      height: 20,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ( context, index) {
                            return Text(postModel.willToFly[index],style: TextStyles.textStyle18Regular,);

                          },
                          separatorBuilder: ( context, index){
                            return Text(' - ',style: TextStyles.textStyle18Regular,);
                          },
                          itemCount: postModel.willToFly.length
                      ),
                    ),

                    SizedBox(height:  SizeConfig.height*0.01,),


                  ],
                ),

              ],
            ),
          );
      },
    );
  }
}
