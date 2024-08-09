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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                      icon: AssetsManager.hoursImage,
                      text: 'Hours',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.hoursDetailsController,
                        hintText: 'Hours',
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

                    DefaultTextField(
                        enable: false,
                        controller: cubit.iWantDetailsController,
                        hintText: 'I Want',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),

                    SizedBox(
                      height: SizeConfig.height * 0.03,
                    ),

                    const NewPostRowDateWidget(
                      icon: AssetsManager.willToFlyImage,
                      text: 'Will To Fly',
                      description: '',
                    ),

                    SizedBox(
                      height: SizeConfig.height * 0.02,
                    ),

                    DefaultTextField(
                        enable: false,
                        controller: cubit.willToFlyDetailsController,
                        hintText: 'Will To Fly',
                        validator: (v) {},
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.grey[300]),

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
