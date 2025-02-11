import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/screens/new_posts_screen.dart';
import 'package:travel_system/features/post_info/presentation/screens/post_details.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/screens/new_posts_screen.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/post_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // PostsCubit.get(context).getPosts(context);
    // PostsCubit.get(context).getFavoritePosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit,PostsStates>(
        listener: (context, state) {

        },
      builder: (context,state){
          var cubit=PostsCubit.get(context);
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
                                Text('Welcome ${UserDataFromStorage.userName}',style: TextStyles.textStyle24Bold.copyWith(color: ColorManager.primaryBlue),),
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
                                              color: Colors.grey[200],
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Filter By',style: TextStyles.textStyle24Bold.copyWith(color: ColorManager.black),),
                                                      const Spacer(),
                                                      cubit.isFilter==true?
                                                      Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: ()async{
                                                            await cubit.getPosts(context);
                                                            cubit.setIsFilter(value: false);
                                                            Navigator.pop(context);
                                                          },
                                                          icon: const Icon(Icons.filter_alt_off_outlined,color: ColorManager.primaryBlue,),
                                                        ),
                                                      ):Container(),
                                                    ],
                                                  ),

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
                                                    children: List.generate(cubit.iHaveList.length, (index) => GestureDetector(
                                                      onTap: (){
                                                        PostsCubit.get(context).changeCountryColor( index,cubit.iHaveList[index]);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                            color: cubit.locationFilterSelected[index] ? ColorManager.primaryBlue : Colors.white
                                                        ),
                                                        width: SizeConfig.height *.1,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(cubit.iHaveList[index],style:
                                                            TextStyles.textStyle18Regular.copyWith(
                                                                color: cubit.locationFilterSelected[index] ? ColorManager.white : ColorManager.primaryBlue
                                                            ),
                                                              overflow: TextOverflow.ellipsis,
                                                            )
                                                          ],
                                                        ) ,
                                                      ),
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

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child:  Row(
                                                          children: [
                                                            Radio<int>(
                                                              value: 1,
                                                              activeColor: ColorManager.primaryBlue,
                                                              groupValue: cubit.filterLayover,
                                                              onChanged: (value) {
                                                                cubit.setFilterLayover(value: value!);
                                                              },
                                                            ),
                                                            Text('Layover',style: TextStyles.textStyle18Medium.copyWith(
                                                                color: Colors.black
                                                            ))  ,

                                                          ],
                                                        ),

                                                      ),

                                                      Expanded(
                                                        child:  Row(
                                                          children: [
                                                            Radio<int>(
                                                              value: 2,
                                                              activeColor: ColorManager.primaryBlue,
                                                              groupValue: cubit.filterLayover,
                                                              onChanged: (value) {
                                                                cubit.setFilterLayover(value: value!);
                                                              },
                                                            ),
                                                            Text('Round Trip',style: TextStyles.textStyle18Medium.copyWith(
                                                                color: Colors.black
                                                            ))  ,

                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),


                                                  SizedBox(height: SizeConfig.height*.02,),

                                                  Row(
                                                    children: [
                                                      const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                      Text('Start Time',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                    ],
                                                  ),

                                                  SizedBox(height: SizeConfig.height*.02,),

                                                  EasyDateTimeLine(
                                                    activeColor: cubit.dateTimeFilter==''?  Colors.grey[200] : ColorManager.primaryBlue,
                                                    initialDate: DateTime.now(),
                                                    onDateChange: (selectedDate) {
                                                      print(selectedDate);
                                                      PostsCubit.get(context).selectFilterDateOfTravel(value: selectedDate);
                                                    },
                                                  ),

                                                  SizedBox(height:  SizeConfig.height * 0.02,),

                                                  // Row(
                                                  //   children: [
                                                  //     const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                  //     Text('Start Time',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                  //   ],
                                                  // ),
                                                  //
                                                  // SizedBox(height: SizeConfig.height*.02,),
                                                  //
                                                  // EasyDateTimeLine(
                                                  //   initialDate: DateTime.now(),
                                                  //   onDateChange: (selectedDate) {
                                                  //     PostsCubit.get(context).selectFilterStartDateTravel(value: selectedDate);
                                                  //   },
                                                  // ),
                                                  //
                                                  // SizedBox(height:  SizeConfig.height * 0.02,),
                                                  //
                                                  // Row(
                                                  //   children: [
                                                  //     const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.black,size: 30,),
                                                  //     Text('End Time',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),
                                                  //   ],
                                                  // ),
                                                  //
                                                  // SizedBox(height: SizeConfig.height*.02,),
                                                  //
                                                  // EasyDateTimeLine(
                                                  //   initialDate: DateTime.now(),
                                                  //   onDateChange: (selectedDate) {
                                                  //     PostsCubit.get(context).selectFilterEndDateTravel(value: selectedDate);
                                                  //   },
                                                  // ),

                                                  SizedBox(height:  SizeConfig.height * 0.04,),

                                                  Container(
                                                    margin: EdgeInsets.symmetric(
                                                      horizontal: SizeConfig.height * 0.03
                                                    ),
                                                    child: DefaultButton(
                                                        buttonText: 'Filter',
                                                        onPressed: (){
                                                          cubit.filterPost(
                                                              city: cubit.countryFilterSelected,
                                                              context: context,
                                                              duration: cubit.filterLayover==1?'Layover':cubit.filterLayover==3?'':'Round Trip',
                                                              dateTime: cubit.dateTimeFilter,
                                                          ).then((v){
                                                            cubit.setIsFilter(value: true);
                                                            cubit.countryFilterSelected='';
                                                            cubit.dateTimeFilter='';
                                                            cubit.filterLayover=3;
                                                            cubit.hoursFilterController.clear();
                                                            cubit.mintusFilterController.clear();
                                                            cubit.locationFilterSelected=List.generate(100, (i) => false);
                                                            Navigator.pop(context);
                                                          });
                                                        },
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

              state is GetPostsLoadingState?
              const CupertinoActivityIndicator(
                color: ColorManager.primaryBlue,
              ):
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>  PostWidget(postModel: cubit.flights[index], isFavorite: false,),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: cubit.flights.length
                ),
              )
            ],
          );
      },
    );
  }
}
