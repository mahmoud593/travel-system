import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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

  var haveHoursController=TextEditingController();
  var wantHoursController=TextEditingController();


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
                                const NewPostRowDateWidget(icon: AssetsManager.iHaveImage,text: 'I Have',description: 'Choose the destination of your flight that you have',),

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
                                      hint: Text('Enter your destination',style: TextStyles.textStyle18Regular.copyWith(
                                          color: Colors.black54
                                      )),
                                      icon: const Icon(Icons.arrow_drop_down),
                                      elevation: 5,
                                      value:cubit.iHaveValue,
                                      style: const TextStyle(color: Colors.black, fontSize: 16),
                                      onChanged: (String? newValue) {
                                        cubit.setDropDownHaveValue(value: newValue);
                                      },
                                      items: cubit.iHaveList.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                const NewPostRowDateWidget(icon: AssetsManager.routeImage,text: 'Kind of flight',description: 'Choose type of your flight that you have',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Row(
                                  children: [
                                    Expanded(
                                      child:  Row(
                                        children: [
                                           Radio<int>(
                                            value: 1,
                                            activeColor: ColorManager.primaryBlue,
                                            groupValue: cubit.iHaveLayover,
                                            onChanged: (value) {
                                              cubit.setIHaveLayover(value: value!);
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
                                            groupValue: cubit.iHaveLayover,
                                            onChanged: (value) {
                                              cubit.setIHaveLayover(value: value!);
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

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// Hours
                                const NewPostRowDateWidget(icon: AssetsManager.hoursImage,text: 'Layover hours',description: 'Enter hours of flight that you have',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Row(
                                  children: [

                                    Expanded(
                                      child: DefaultTextField(
                                          controller: haveHoursController,
                                          hintText: 'Hours',
                                          validator: (value){},
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          fillColor: Colors.white
                                      )
                                    ),

                                    SizedBox(width:  SizeConfig.height * 0.01,),

                                    Text('hr',style: TextStyles.textStyle18Regular.copyWith(
                                      color: Colors.black
                                    )),

                                  ],
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                // /// Date Time
                                // const NewPostRowDateWidget(icon: AssetsManager.travelDateImage,text: 'Date Time',description: 'Choose date time of flight that you have',),
                                //
                                // SizedBox(height:  SizeConfig.height * 0.01,),
                                //
                                // EasyDateTimeLine(
                                //   initialDate: DateTime.now(),
                                //   onDateChange: (selectedDate) {
                                //     cubit.selectDateOfTravel(value: selectedDate);
                                //   },
                                // ),
                                //
                                // SizedBox(height:  SizeConfig.height * 0.03,),

                                /// Report Start Time
                                const NewPostRowDateWidget(icon: AssetsManager.startDateImage,text: 'Report Start Time',description: 'Choose date time of report start time',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                // EasyDateTimeLine(
                                //   initialDate: DateTime.now(),
                                //   onDateChange: (selectedDate) {
                                //     cubit.selectStartDateTravel(value: selectedDate);
                                //   },
                                // ),

                                ElevatedButton(
                                  onPressed: () {

                                       DatePicker.showDatePicker(
                                        context,
                                        dateFormat: 'dd MMMM yyyy HH:mm',
                                        initialDateTime: DateTime.now(),
                                        minDateTime: DateTime(2000),
                                        maxDateTime: DateTime(3000),
                                        onMonthChangeStartWithFirstDate: true,
                                        onConfirm: (dateTime, List<int> index) {
                                          DateTime selectdate = dateTime;
                                          final selIOS = DateFormat('dd-MMM-yyyy - HH:mm').format(selectdate);
                                          print(selIOS);
                                          cubit.selectStartDateTravel(value: selIOS);
                                        },
                                      );

                                    },
                                  child: Text('Pick Date-Time'),
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// Release End Time
                                const NewPostRowDateWidget(icon: AssetsManager.endDateImage,text: 'Release End Time',description: 'Choose date time of release end time',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                ElevatedButton(
                                  onPressed: () {

                                    DatePicker.showDatePicker(
                                      context,
                                      dateFormat: 'dd MMMM yyyy HH:mm',
                                      initialDateTime: DateTime.now(),
                                      minDateTime: DateTime(2000),
                                      maxDateTime: DateTime(3000),
                                      onMonthChangeStartWithFirstDate: true,
                                      onConfirm: (dateTime, List<int> index) {
                                        DateTime selectdate = dateTime;
                                        final selIOS = DateFormat('dd-MMM-yyyy - HH:mm').format(selectdate);
                                        print(selIOS);
                                        cubit.selectEndDateTravel(value: selIOS);
                                      },
                                    );

                                  },
                                  child: Text('Pick Date-Time'),
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// I Want
                                const NewPostRowDateWidget(icon: AssetsManager.iWantImage,text: 'I Want',description: 'Choose the destination of the flight you want',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 4,
                                  childAspectRatio: 0.5/.2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  children: List.generate(cubit.iWantList.length, (index) => GestureDetector(
                                    onTap: (){
                                      PostsCubit.get(context).changeIWantSelectedColor( index,cubit.iWantList[index]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: cubit.locationIWantSelected[index] ? ColorManager.primaryBlue : Colors.white
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(cubit.iWantList[index],style:
                                          TextStyles.textStyle18Regular.copyWith(
                                              color: cubit.locationIWantSelected[index] ? ColorManager.white : ColorManager.primaryBlue
                                          ),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ),),
                                ),


                                SizedBox(height:  SizeConfig.height * 0.03,),

                                /// willToFly
                                const NewPostRowDateWidget(icon: AssetsManager.willToFlyImage,text: 'Willing to fly',description: 'Choose date time of willing to fly ',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                SfDateRangePicker(
                                  showNavigationArrow: true,
                                  showTodayButton: true,
                                  selectionRadius: 20,
                                  todayHighlightColor: ColorManager.primaryBlue,
                                  selectionColor: ColorManager.primaryBlue,
                                  onSelectionChanged: (v){
                                    setState(() {
                                      // print(v.value.length.toString());
                                      // // Parse the date part and handle the time manually
                                      // print(v.value.toString());
                                      // String date = v.value.toString();
                                      // DateTime parsedDate = DateTime.parse(date.split(' ')[0]);
                                      // int hour = int.parse(date.split(' ')[1]);
                                      //
                                      // // Create the DateTime object with the time
                                      // DateTime finalDateTime = DateTime(parsedDate.year, parsedDate.month, parsedDate.day, hour);
                                      //
                                      // // Format the time part
                                      // String formattedTime = finalDateTime.toString().split(' ')[1];

                                      // print(formattedTime); // Outputs: 00:00:00.000
                                      cubit.setWillToFlyDaysTravel(value: v.value.toString());
                                    });
                                  },
                                  selectionMode: DateRangePickerSelectionMode.multiple,

                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),


                                /// Plane Type
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


                                SizedBox(height:  SizeConfig.height * 0.03,),


                                const NewPostRowDateWidget(icon: AssetsManager.routeImage,text: 'I Want',description: 'Choose location of your flight that you need',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Row(
                                  children: [
                                    Expanded(
                                      child:  Row(
                                        children: [
                                          Checkbox(
                                              activeColor: ColorManager.primaryBlue,
                                              value: cubit.setIWantLav,
                                              onChanged: (value){
                                                cubit.setIWantLavTrip(value: value!);
                                              }
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
                                          Checkbox(
                                              activeColor: ColorManager.primaryBlue,
                                              value: cubit.setIWantRad,
                                              onChanged: (value){
                                                cubit.setIWantRodTrip(value: value!);
                                              }
                                          ),
                                          Text('Round Trip',style: TextStyles.textStyle18Medium.copyWith(
                                              color: Colors.black
                                          ))  ,

                                        ],
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),


                                /// Hours
                                const NewPostRowDateWidget(icon: AssetsManager.hoursImage,text: 'Layover hours',description: 'Enter hours of flight that you need',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Row(
                                  children: [

                                    Expanded(
                                        child: DefaultTextField(
                                            controller: wantHoursController,
                                            hintText: 'Hours',
                                            validator: (value){},
                                            keyboardType: TextInputType.number,
                                            textInputAction: TextInputAction.done,
                                            fillColor: Colors.white
                                        )
                                    ),

                                    SizedBox(width:  SizeConfig.height * 0.01,),

                                    Text('hr',style: TextStyles.textStyle18Regular.copyWith(
                                      color: Colors.black,
                                    )),

                                  ],
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),


                                const NewPostRowDateWidget(icon: AssetsManager.iHaveImage,text: 'Visa',description: 'Choose location of your flight that you have',),

                                SizedBox(height:  SizeConfig.height * 0.01,),

                                Row(
                                  children: [
                                    Expanded(
                                      child:  Row(
                                        children: [
                                          Checkbox(
                                              activeColor: ColorManager.primaryBlue,
                                              value: cubit.setVisaChine,
                                              onChanged: (value){
                                                cubit.setVisaChineTrip(value: value!);
                                              }
                                          ),
                                          Text('CHINA',style: TextStyles.textStyle18Medium.copyWith(
                                              color: Colors.black
                                          ))  ,

                                        ],
                                      ),

                                    ),

                                    Expanded(
                                      child:  Row(
                                        children: [
                                          Checkbox(
                                              activeColor: ColorManager.primaryBlue,
                                              value: cubit.setVisaUsa,
                                              onChanged: (value){
                                                cubit.setVisaUsaTrip(value: value!);
                                              }
                                          ),
                                          Text('USA',style: TextStyles.textStyle18Medium.copyWith(
                                              color: Colors.black
                                          ))  ,

                                        ],
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(height:  SizeConfig.height * 0.03,),

                                state is CreateNewPostsLoadingState?
                                const CupertinoActivityIndicator():
                                DefaultButton(
                                    buttonText: 'Add Post',
                                    onPressed: (){

                                      // Remove the square brackets and split the string by comma
                                      String cleanedString = cubit.willToFlyDays.toString().replaceAll(RegExp(r'[\[\]]'), '');
                                      List<String> dateTimeParts = cleanedString.split(',').map((part) => part.trim()).toList();

                                      print('//////////------------********');

                                      print(dateTimeParts);

                                      // Parse each date-time string into DateTime objects
                                      List<DateTime> dateTimes = dateTimeParts.map((part) => DateTime.parse(part)).toList();

                                      List<String> selectedDates=[];
                                      // Print the extracted DateTime objects
                                      for (DateTime dateTime in dateTimes) {
                                        String formattedDate = DateFormat.d().format(dateTime);
                                        selectedDates.add(formattedDate);
                                        print('//////////------------********');
                                        print(formattedDate); // Outputs: 14-Aug-2024 and 21-Aug-2024
                                      }

                                      print(cubit.selectVisaList);

                                      cubit.createPosts(
                                          context: context,
                                          PRN: UserDataFromStorage.userPayrollNumber,
                                          iHaveFlight: cubit.iHaveValue!,
                                          uid: UserDataFromStorage.userId,
                                          startTime: cubit.startDate!,
                                          endTime: cubit.endDate!,
                                          willToFly: selectedDates,
                                          rank: UserDataFromStorage.userRank,
                                          planeType: cubit.planeType!,
                                          iWantFlight: cubit.countryIWantSelected,
                                          phoneNumber: UserDataFromStorage.userPhone!,
                                          userName: UserDataFromStorage.userName,
                                          iHaveHours: haveHoursController.text==''?'0':haveHoursController.text,
                                          iHaveLav: cubit.iHaveLayover==1?'Layover':'Round Trip',
                                          iWantHours: wantHoursController.text==''?'0':wantHoursController.text,
                                          iWantLav: cubit.selectIWantLavList,
                                          visa: cubit.selectVisaList,
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
