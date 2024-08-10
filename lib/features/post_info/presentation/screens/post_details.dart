import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/post_info/presentation/screens/comments_screen.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/widgets/user_info_card.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../posts/presentation/view/posts_screen/widgets/new_post_row_date_widget.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key, required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: const Text('Details'),
        ),
        body: BlocBuilder<PostsCubit, PostsStates>(
          builder: (context, state) {
            var cubit = PostsCubit.get(context);
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.05,
                ),
                child: Column(
                  children: [
                    // /// user info card
                    // UserInfoCard(
                    //   name: UserDataFromStorage.userName,
                    //   email: UserDataFromStorage.userEmail,
                    //   image: UserDataFromStorage.userPersonalImage,
                    // ),

                    SizedBox(
                      height: SizeConfig.height * 0.01,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.isFavorite==false?
                            PostsCubit.get(context).addPostToFavorites(postModel:postModel):
                            PostsCubit.get(context).deletePostFromFavorites(postModel:postModel);
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              clipBehavior:  Clip.antiAlias,
                              height:  SizeConfig.height * 0.045,
                              decoration: const BoxDecoration(
                                shape:  BoxShape.circle,
                              ),
                              child:  CircleAvatar(
                                  backgroundColor: ColorManager.primaryBlue,
                                  child:  cubit.isFavorite==true?
                                  const Icon(Icons.favorite,color: Colors.white,):
                                  const Icon(Icons.favorite_outline,color: Colors.white,)
                              )
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            launch('https://wa.me/${postModel.phoneNumber}');
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              clipBehavior:  Clip.antiAlias,
                              height:  SizeConfig.height * 0.045,
                              decoration: const BoxDecoration(
                                shape:  BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/images/whatsapp.png",
                                fit:  BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch('tel:${postModel.phoneNumber}');
                          },
                          child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child:   CircleAvatar(
                                  radius: SizeConfig.height * 0.026,
                                  backgroundColor: ColorManager.primaryBlue,
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: SizeConfig.height * 0.026,
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: SizeConfig.width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            customPushNavigator(context,  CommentsScreen( postModel: postModel,));
                          },
                          child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child:   CircleAvatar(
                                  radius: SizeConfig.height * 0.026,
                                  backgroundColor: ColorManager.primaryBlue,
                                  child: Icon(
                                    Icons.chat,
                                    color: Colors.white,
                                    size: SizeConfig.height * 0.026,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.airportImage,
                      text: 'PRN',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.prnDetailsController,
                        hintText: 'PRN',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.iHaveImage,
                      text: 'I Have',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.iHaveDetailsController,
                        hintText: 'I Have',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.routeImage,
                      text: 'I Have Flight duration',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.iHaveLavDetailsController,
                        hintText: 'I Have Flight duration',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),


                    cubit.iHaveLavDetailsController.text !='Round Trip'?
                    const NewPostRowDateWidget(
                      icon: AssetsManager.routeImage,
                      text: 'Layover Hours',
                      description: '',
                    ):Container(),

                    cubit.iHaveLavDetailsController.text !='Round Trip'?
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ):Container(),

                    cubit.iHaveLavDetailsController.text !='Round Trip'?
                    DefaultTextField(
                        enable: false,
                        controller: cubit.iHaveLavHoursDetailsController,
                        hintText: 'I Have Flight duration',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]):Container(),

                    cubit.iHaveLavDetailsController.text !='Round Trip'?
                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ):Container(),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.startDateImage,
                      text: 'Report Start Time',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.sDateDetailsController,
                        hintText: 'Report Start Time',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.planeTicketImage,
                      text: 'Release End Time',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.eDateDetailsController,
                        hintText: 'Release End Time',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),


                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.planeTicketImage,
                      text: 'Plane type',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.planeTypeDetailsController,
                        hintText: 'Plane type',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.iWantImage,
                      text: 'I Want',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.height * 0.06,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).height*0.022,
                          vertical: MediaQuery.sizeOf(context).height*0.015
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(SizeConfig.height * 0.05),
                      ),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ( context, index) {
                            return Text(postModel.iWantFlight[index],style: TextStyles.textStyle18Regular.copyWith(
                                color: Colors.black
                            ),textAlign: TextAlign.center,);

                          },
                          separatorBuilder: ( context, index){
                            return Text(' , ',style: TextStyles.textStyle18Regular.copyWith(
                                color: Colors.black
                            ),);
                          },
                          itemCount: postModel.iWantFlight.length
                      ),
                    ),


                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    /// I Want Lav
                    const NewPostRowDateWidget(
                      icon: AssetsManager.routeImage,
                      text: 'I Want flight duration',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.height * 0.06,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).height*0.022,
                          vertical: MediaQuery.sizeOf(context).height*0.015
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(SizeConfig.height * 0.05),
                      ),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ( context, index) {
                            return Text(postModel.iWantLav[index],style: TextStyles.textStyle18Regular.copyWith(
                                color: Colors.black
                            ),textAlign: TextAlign.center,);

                          },
                          separatorBuilder: ( context, index){
                            return Text(' , ',style: TextStyles.textStyle18Regular.copyWith(
                                color: Colors.black
                            ),);
                          },
                          itemCount: postModel.iWantLav.length
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),


                    /// I Want Lav Hours
                    postModel.iWantLav.contains('Layover')?
                    const NewPostRowDateWidget(
                      icon: AssetsManager.hoursImage,
                      text: 'Layover Hours',
                      description: '',
                    ):Container(),

                    postModel.iWantLav.contains('Layover')?
                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ):Container(),

                    postModel.iWantLav.contains('Layover')?
                    DefaultTextField(
                        enable: false,
                        controller: cubit.iWantLavHoursDetailsController,
                        hintText: 'Layover Hours',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]):Container(),

                    postModel.iWantLav.contains('Layover')?
                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ):Container(),

                    /// Willing to fly
                    const NewPostRowDateWidget(
                      icon: AssetsManager.willToFlyImage,
                      text: 'Will To Fly',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.height * 0.06,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).height*0.022,
                          vertical: MediaQuery.sizeOf(context).height*0.015
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(SizeConfig.height * 0.05),
                      ),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ( context, index) {
                            return Text(postModel.willToFly[index],style: TextStyles.textStyle18Regular.copyWith(
                              color: Colors.black
                            ),textAlign: TextAlign.center,);

                          },
                          separatorBuilder: ( context, index){
                            return Text(' , ',style: TextStyles.textStyle18Regular.copyWith(
                                color: Colors.black
                            ),);
                          },
                          itemCount: postModel.willToFly.length
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    /// Visa
                    const NewPostRowDateWidget(
                      icon: AssetsManager.travelImage,
                      text: 'Visa',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.height * 0.06,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).height*0.022,
                          vertical: MediaQuery.sizeOf(context).height*0.015
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(SizeConfig.height * 0.05),
                      ),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ( context, index) {
                            return Text(postModel.visa[index],style: TextStyles.textStyle18Regular.copyWith(
                                color: Colors.black
                            ),textAlign: TextAlign.center,);

                          },
                          separatorBuilder: ( context, index){
                            return Text(' , ',style: TextStyles.textStyle18Regular.copyWith(
                                color: Colors.black
                            ),);
                          },
                          itemCount: postModel.visa.length
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
