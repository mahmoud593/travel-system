// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travel_system/core/constants/constants.dart';
// import 'package:travel_system/core/helper/app_size_config.dart';
// import 'package:travel_system/features/new_posts/presentation/cubit/new_post_cubit.dart';
// import 'package:travel_system/features/new_posts/presentation/cubit/new_post_states.dart';
// import 'package:travel_system/styles/text_styles/text_styles.dart';
//
// Widget newPostsDropDownWidget(String location, Function() function){
//
//   return  BlocBuilder<NewPostCubit,NewPostStates>(
//     builder: (context,state){
//       var cubit=NewPostCubit.get(context);
//       return Container(
//         padding: EdgeInsets.only(
//             left: SizeConfig.height * 0.02,
//             right: SizeConfig.height * 0.02
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.grey[300],
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<String>(
//             hint: Text('Enter Your Location',style: TextStyles.textStyle18Regular.copyWith(
//                 color: Colors.black54
//             )),
//             icon: const Icon(Icons.arrow_drop_down),
//             elevation: 5,
//             value:cubit.iHaveValue,
//             style: const TextStyle(color: Colors.black, fontSize: 16),
//             onChanged: (String? newValue) {
//               cubit.setDropDownValue(value: newValue);
//             },
//             items: Constants.iHaveLocations
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//     },
//   );
//
// }