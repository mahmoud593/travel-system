import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/screens/home_layout_screen.dart';
import 'package:travel_system/features/new_posts/presentation/cubit/new_post_cubit.dart';
import 'package:travel_system/features/new_posts/presentation/cubit/new_post_states.dart';
import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/widgets/new_post_row_date_widget.dart';
import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/widgets/new_posts_drop_down_widget.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/screens/posts_screen.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/new_post_row_date_widget.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';

class NewPostsScreen extends StatefulWidget {
   const NewPostsScreen({super.key});

  @override
  State<NewPostsScreen> createState() => _NewPostsScreenState();
}

class _NewPostsScreenState extends State<NewPostsScreen> {

  var hoursController=TextEditingController();
  var minutesController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<PostsCubit,PostsStates>(
              listener: (context,state){
                if(state is CreateNewPostsSuccessState){
                  Navigator.pop(context);
                }
              },
              builder: (context,state){
                var cubit=PostsCubit.get(context);
                return ModalProgressHUD(
                  inAsyncCall: state is CreateNewPostsLoadingState,
                  progressIndicator: const CupertinoActivityIndicator(
                    color: ColorManager.primaryBlue,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: .4,
                          image: NetworkImage('https://img.freepik.com/premium-photo/travel-world-monument-concept_1097408-13.jpg?w=740'),
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.only(
                            left: SizeConfig.height * 0.02,
                            top: SizeConfig.height * 0.02,
                          ),
                          height: SizeConfig.height * 0.15,
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: ColorManager.primaryBlue,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.height * 0.06,
                              vertical: SizeConfig.height * 0.04
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: SizeConfig.height * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(SizeConfig.height * 0.1),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                /// I Have
                                const NewPostRowDateWidget(icon: AssetsManager.iHaveImage,text: 'I Have',description: 'Choose location of your flight that you have',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Container(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.height * 0.02,
                                      right: SizeConfig.height * 0.02
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text('Enter Your Location',style: TextStyles.textStyle18Regular.copyWith(
                                          color: Colors.black54
                                      )),
                                      icon: const Icon(Icons.arrow_drop_down),
                                      elevation: 5,
                                      value:cubit.iHaveValue,
                                      style: const TextStyle(color: Colors.black, fontSize: 16),
                                      onChanged: (String? newValue) {
                                        cubit.setDropDownHaveValue(value: newValue);
                                      },
                                      items: Constants.iHaveLocations
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// Hours
                                const NewPostRowDateWidget(icon: AssetsManager.hoursImage,text: 'Hours',description: 'Enter hours of flight that you have',),

                                SizedBox(height:  SizeConfig.height * 0.01,),


                                Row(
                                  children: [

                                    Expanded(
                                      child: DefaultTextField(
                                          controller: hoursController,
                                          hintText: 'Hours',
                                          validator: (value){},
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          fillColor: Colors.white
                                      )
                                    ),

                                    SizedBox(width:  SizeConfig.height * 0.02,),

                                    Expanded(
                                        child: DefaultTextField(
                                            controller: minutesController,
                                            hintText: 'Minutes',
                                            validator: (value){},
                                            keyboardType: TextInputType.number,
                                            textInputAction: TextInputAction.done,
                                            fillColor: Colors.white
                                        )
                                    ),

                                  ],
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// Date Time
                                const NewPostRowDateWidget(icon: AssetsManager.travelDateImage,text: 'Date Time',description: 'Choose date time of flight that you have',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                EasyDateTimeLine(
                                  initialDate: DateTime.now(),
                                  onDateChange: (selectedDate) {
                                    cubit.selectDateOfTravel(value: selectedDate);
                                  },
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// Report Start Time
                                const NewPostRowDateWidget(icon: AssetsManager.startDateImage,text: 'Report Start Time',description: 'Choose date time of report start time',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                EasyDateTimeLine(
                                  initialDate: DateTime.now(),
                                  onDateChange: (selectedDate) {
                                    cubit.selectStartDateTravel(value: selectedDate);
                                  },
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// Release End Time
                                const NewPostRowDateWidget(icon: AssetsManager.endDateImage,text: 'Release End Time',description: 'Choose date time of release end time',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                EasyDateTimeLine(
                                  initialDate: DateTime.now(),
                                  onDateChange: (selectedDate) {
                                    cubit.selectEndDateTravel(value: selectedDate);
                                  },
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// I Want
                                const NewPostRowDateWidget(icon: AssetsManager.iWantImage,text: 'I Want',description: 'Choose location of your flight that you want',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Container(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.height * 0.02,
                                      right: SizeConfig.height * 0.02
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[300],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text('Enter Your Location',style: TextStyles.textStyle18Regular.copyWith(
                                          color: Colors.black54
                                      )),
                                      icon: const Icon(Icons.arrow_drop_down),
                                      elevation: 5,
                                      value:cubit.iWantValue,
                                      style: const TextStyle(color: Colors.black, fontSize: 16),
                                      onChanged: (String? newValue) {
                                        cubit.setDropDownWantValue(value: newValue);
                                      },
                                      items: Constants.iHaveLocations
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// willToFly
                                const NewPostRowDateWidget(icon: AssetsManager.willToFlyImage,text: 'Willing to fly',description: 'Choose date time of willing to fly ',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                EasyDateTimeLine(
                                  initialDate: DateTime.now(),
                                  onDateChange: (selectedDate) {
                                    cubit.selectWillToFlyTravel(value: selectedDate);
                                  },
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),


                                /// I Want
                                const NewPostRowDateWidget(icon: AssetsManager.planeTicketImage,text: 'Plane type',description: 'Choose plane type of your flight that you have',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Container(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.height * 0.02,
                                      right: SizeConfig.height * 0.02
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[300],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text('Enter Plane type',style: TextStyles.textStyle18Regular.copyWith(
                                          color: Colors.black54
                                      )),
                                      icon: const Icon(Icons.arrow_drop_down),
                                      elevation: 5,
                                      value:cubit.planeType,
                                      style: const TextStyle(color: Colors.black, fontSize: 16),
                                      onChanged: (String? newValue) {
                                        cubit.setDropDownPlaneTypeValue(value: newValue);
                                      },
                                      items: Constants.airCraftsList
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),

                                SizedBox(height:  SizeConfig.height * 0.05,),

                                state is CreateNewPostsLoadingState?
                                const CupertinoActivityIndicator():
                                DefaultButton(
                                    buttonText: 'Add Post',
                                    onPressed: (){
                                      cubit.createPosts(
                                          context: context,
                                          iHaveFlight: cubit.iHaveValue!,
                                          uid: UserDataFromStorage.userId,
                                          dateTime: cubit.dateTime!,
                                          startTime: cubit.startDate!,
                                          endTime: cubit.endDate!,
                                          hours: '${hoursController.text}${minutesController.text}',
                                          willToFly: cubit.willToFly!,
                                          rank: UserDataFromStorage.userRank,
                                          planeType: cubit.planeType!,
                                          iWantFlight: cubit.iWantValue!,
                                          userName: UserDataFromStorage.userName
                                      );
                                    },
                                    buttonColor: ColorManager.primaryBlue,
                                    large: true
                                ),

                                SizedBox(height:  SizeConfig.height * 0.1,),

                              ],
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                );
              },
            )
        ),
      ),
    );
  }
}
