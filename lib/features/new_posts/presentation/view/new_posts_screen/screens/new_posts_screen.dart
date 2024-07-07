import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/new_posts/presentation/cubit/new_post_cubit.dart';
import 'package:travel_system/features/new_posts/presentation/cubit/new_post_states.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';

class NewPostsScreen extends StatelessWidget {
   NewPostsScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: BlocProvider(
        create: (context) => NewPostCubit(),
        child: BlocConsumer<NewPostCubit,NewPostStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit=NewPostCubit.get(context);
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.06,
                  vertical: SizeConfig.height * 0.02
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Text('I Have',style: TextStyles.textStyle18Bold.copyWith(
                      color: ColorManager.black
                  ),),

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
                        hint: Text('Enter Your Location',style: TextStyles.textStyle18Medium.copyWith(
                          color: Colors.black54
                        )),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                        onChanged: (String? newValue) {

                        },
                        items: <String>['One', 'Two', 'Three', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(height:  SizeConfig.height * 0.02,),

                  Text('Hours',style: TextStyles.textStyle18Bold.copyWith(
                      color: ColorManager.black
                  ),),

                  SizedBox(height:  SizeConfig.height * 0.01,),

                  Row(
                    children: [
                      Expanded(
                        child: DefaultTextField(
                            controller: cubit.hourController,
                            hintText: 'Hours',
                            validator: (v){},
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            fillColor: Colors.white
                        ),
                      ),

                      SizedBox(width:  SizeConfig.height * 0.04,),

                      Expanded(
                        child: DefaultTextField(
                            controller: cubit.minutesController,
                            hintText: 'Minutes',
                            validator: (v){},
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            fillColor: Colors.white
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height:  SizeConfig.height * 0.02,),

                  Text('Date Time',style: TextStyles.textStyle18Bold.copyWith(
                      color: ColorManager.black
                  ),),

                  SizedBox(height:  SizeConfig.height * 0.01,),

                  GestureDetector(
                    onTap: (){
                      showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030)
                      ).whenComplete(() => print('Done'));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.height * 0.01,
                            horizontal: SizeConfig.width * 0.02
                        ),
                        width: SizeConfig.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Choose Date',style: TextStyles.textStyle18Medium.copyWith(
                          color: Colors.grey
                        ),
                        )),
                  ),




                  SizedBox(height:  SizeConfig.height * 0.02,),

                  Text('Report Start Time',style: TextStyles.textStyle18Bold.copyWith(
                      color: ColorManager.black
                  ),),

                  SizedBox(height:  SizeConfig.height * 0.01,),


                  GestureDetector(
                    onTap: (){
                      showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030)
                      ).whenComplete(() => print('Done'));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.height * 0.01,
                            horizontal: SizeConfig.width * 0.02
                        ),
                        width: SizeConfig.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Choose Date',style: TextStyles.textStyle18Medium.copyWith(
                            color: Colors.grey
                        ),
                        )),
                  ),


                  SizedBox(height:  SizeConfig.height * 0.02,),

                  Text('Release End Time',style: TextStyles.textStyle18Bold.copyWith(
                      color: ColorManager.black
                  ),),

                  SizedBox(height:  SizeConfig.height * 0.01,),

                  GestureDetector(
                    onTap: (){
                      showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030)
                      ).whenComplete(() => print('Done'));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.height * 0.01,
                            horizontal: SizeConfig.width * 0.02
                        ),
                        width: SizeConfig.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Choose Date',style: TextStyles.textStyle18Medium.copyWith(
                          color: Colors.grey
                        ),
                        )),
                  ),


                  SizedBox(height:  SizeConfig.height * 0.02,),


                  Text('I Want',style: TextStyles.textStyle18Bold.copyWith(
                      color: ColorManager.black
                  ),),

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
                        hint: Text('Enter Your Location',style: TextStyles.textStyle18Medium.copyWith(
                            color: Colors.black54
                        )),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                        onChanged: (String? newValue) {

                        },
                        items: <String>['One', 'Two', 'Three', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(height:  SizeConfig.height * 0.02,),

                  Text('Willing to fly',style: TextStyles.textStyle18Bold.copyWith(
                      color: ColorManager.black
                  ),),


                  GestureDetector(
                    onTap: (){
                      showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030)
                      ).whenComplete(() => print('Done'));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.height * 0.01,
                            horizontal: SizeConfig.width * 0.02
                        ),
                        width: SizeConfig.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Choose Date',style: TextStyles.textStyle18Medium.copyWith(
                          color: Colors.grey
                        ),
                        )),
                  ),


                  SizedBox(height:  SizeConfig.height * 0.02,),

                ],
              ),
            );
          },
        ),
      )
    );
  }
}
