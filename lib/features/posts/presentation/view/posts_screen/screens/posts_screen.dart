import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/screens/new_posts_screen.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/post_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit,PostsStates>(
        listener: (context, state) {

        },
      builder: (context,state){
          var cubit=PostsCubit.get(context);
          List<PostModel> myFlights=(cubit.flights).toList() ;
          return Column(
            children: [

              Container(
                height: MediaQuery.sizeOf(context).height*0.22,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white
                ) ,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children:  [

                    Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://img.freepik.com/premium-photo/illustration-famous-monument-world_117023-16.jpg?w=740'),
                              opacity: .3
                          ),
                        ),
                        height: MediaQuery.sizeOf(context).height*0.19,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.sizeOf(context).height*0.02,
                            horizontal: MediaQuery.sizeOf(context).width*0.05
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MediaQuery.sizeOf(context).height*0.012,),
                            Row(
                              children: [
                                Text('Welcome Mahmoud',style: TextStyles.textStyle24Bold.copyWith(color: ColorManager.primaryBlue),),
                                const Spacer(),
                                GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => BlocBuilder<PostsCubit,PostsStates>(
                                        builder: (context, state) {
                                          return Container(
                                            height: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                vertical: MediaQuery.sizeOf(context).height*.03,
                                                horizontal: MediaQuery.sizeOf(context).width*.07
                                            ),
                                            decoration:  BoxDecoration(
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              color: ColorManager.primaryBlue.withOpacity(.4),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Filter By',style: TextStyles.textStyle24Bold.copyWith(color: ColorManager.black),),
                                                                                        
                                                  const Divider(color: Colors.white,),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                      Text('Flights',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                    ],
                                                  ),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  GridView.count(
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    crossAxisCount: 4,
                                                    childAspectRatio: 0.5/.2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    children: List.generate(8, (index) => Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(50),
                                                          color: Colors.white
                                                      ),
                                                      width: SizeConfig.height *.1,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Text('Paris',style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.primaryBlue),)
                                                        ],
                                                      ) ,
                                                    ),),
                                                  ),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                      Text('Flight duration',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                    ],
                                                  ),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  GestureDetector(
                                                    onTap: (){
                                                      showTimePicker(
                                                          context: context,
                                                          initialTime: TimeOfDay.now()
                                                      ).then((value) {
                                                        PostsCubit.get(context).selectHours(value: value);
                                                      });
                                                    },
                                                    child: Container(
                                                      width:  SizeConfig.height * 0.26,
                                                      padding: EdgeInsets.only(
                                                        top: SizeConfig.height * 0.015,
                                                        bottom: SizeConfig.height * 0.015,
                                                        right: SizeConfig.height * 0.02,
                                                        left: SizeConfig.height * 0.01,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(SizeConfig.height * 0.01),
                                                        color: Colors.white,
                                                      ),
                                                      child: Text( PostsCubit.get(context).hoursSelected == '' ? 'Select your time':
                                                      PostsCubit.get(context).hoursSelected,style: TextStyles.textStyle18Medium.copyWith(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig.height * 0.02
                                                      ),),
                                                    ),
                                                  ),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                      Text('Date Time',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                    ],
                                                  ),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  EasyDateTimeLine(
                                                    initialDate: DateTime.now(),
                                                    onDateChange: (selectedDate) {
                                                      PostsCubit.get(context).selectDateFilterOfTravel(value: selectedDate);
                                                    },
                                                  ),
                                                                                        
                                                  SizedBox(height:  SizeConfig.height * 0.02,),
                                                                                        
                                                                                        
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                      Text('Start Time',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                    ],
                                                  ),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  EasyDateTimeLine(
                                                    initialDate: DateTime.now(),
                                                    onDateChange: (selectedDate) {
                                                      PostsCubit.get(context).selectStartDateFilterOfTravel(value: selectedDate);
                                                    },
                                                  ),
                                                                                        
                                                  SizedBox(height:  SizeConfig.height * 0.02,),
                                                                                        
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                      Text('End Time',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                    ],
                                                  ),
                                                                                        
                                                  SizedBox(height: SizeConfig.height*.02,),
                                                                                        
                                                  EasyDateTimeLine(
                                                    initialDate: DateTime.now(),
                                                    onDateChange: (selectedDate) {
                                                      PostsCubit.get(context).selectEndDateFilterOfTravel(value: selectedDate);
                                                    },
                                                  ),
                                                                                        
                                                  SizedBox(height:  SizeConfig.height * 0.04,),

                                                  Container(
                                                    margin: EdgeInsets.symmetric(
                                                      horizontal: SizeConfig.height * 0.03
                                                    ),
                                                    child: DefaultButton(
                                                        buttonText: 'Filter',
                                                        onPressed: (){},
                                                        buttonColor: ColorManager.primaryBlue,
                                                        large: true
                                                    ),
                                                  ),
                                                                                        
                                                                                        
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    );
                                  },
                                  child: const Icon(
                                    Icons.menu,
                                    color: ColorManager.primaryBlue,
                                  ),
                                )

                              ],
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*0.012,),

                            Text('Let\'s start',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.primaryBlue),),
                          ],
                        )
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width*0.07
                        ),
                        child: DefaultButton(
                            buttonText: 'Add Flight',
                            onPressed: (){
                              customPushNavigator(context, const NewPostsScreen());
                            },
                            buttonColor: ColorManager.primaryBlue,
                            large: true
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>  PostWidget(postModel: myFlights[index],),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: cubit.flights.length
                ),
              ),
            ],
          );
      },
    );
  }
}
