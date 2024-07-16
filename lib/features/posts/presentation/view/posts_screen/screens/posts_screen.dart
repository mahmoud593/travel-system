import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/screens/new_posts_screen.dart';
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
                                      builder: (context) => Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.sizeOf(context).height*.03,
                                            horizontal: MediaQuery.sizeOf(context).width*.1
                                        ),
                                        height: SizeConfig.height*.35,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          color: ColorManager.primaryBlue,
                                        ),
                                        child: Column(
                                          children: [
                                            Text('Filter Flights',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),

                                            SizedBox(height: SizeConfig.height*.02,),

                                            GestureDetector(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: MediaQuery.sizeOf(context).height*.01,
                                                    horizontal: MediaQuery.sizeOf(context).width*.02
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(25),
                                                    border: Border.all(
                                                      color: ColorManager.white,
                                                    )
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image(
                                                      height: MediaQuery.sizeOf(context).height*.04,
                                                      image: const AssetImage('assets/images/logo.png'),
                                                    ),

                                                    SizedBox(width: MediaQuery.sizeOf(context).height*.025,),

                                                    Text('Norwegian',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),

                                                  ],
                                                ),
                                              ),
                                            ),

                                            SizedBox(height: SizeConfig.height*.02,),

                                            GestureDetector(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: MediaQuery.sizeOf(context).height*.01,
                                                    horizontal: MediaQuery.sizeOf(context).width*.02
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(25),
                                                    border: Border.all(
                                                      color: ColorManager.white,
                                                    )
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image(
                                                      height: MediaQuery.sizeOf(context).height*.04,
                                                      image: const AssetImage('assets/images/arabic.png'),
                                                    ),

                                                    SizedBox(width: MediaQuery.sizeOf(context).height*.025,),

                                                    Text('Arabic',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),

                                                  ],
                                                ),
                                              ),
                                            ),

                                            SizedBox(height: SizeConfig.height*.02,),

                                            GestureDetector(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: MediaQuery.sizeOf(context).height*.01,
                                                    horizontal: MediaQuery.sizeOf(context).width*.02
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(25),
                                                    border: Border.all(
                                                      color: ColorManager.white,
                                                    )
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image(
                                                      height: MediaQuery.sizeOf(context).height*.04,
                                                      image: const AssetImage('assets/images/english.png'),
                                                    ),

                                                    SizedBox(width: MediaQuery.sizeOf(context).height*.025,),

                                                    Text('English',style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.black),),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                    itemBuilder: (context, index) =>  PostWidget(postModel: cubit.flights[index],),
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
