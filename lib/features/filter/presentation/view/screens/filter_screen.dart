// import 'package:flutter/material.dart';
// import 'package:travel_system/core/helper/app_size_config.dart';
// import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/widgets/new_post_row_date_widget.dart';
// import 'package:travel_system/styles/assets/asset_manager.dart';
// import 'package:travel_system/styles/colors/color_manager.dart';
// import 'package:travel_system/styles/text_styles/text_styles.dart';
// import 'package:travel_system/styles/widets/default_button.dart';
// import 'package:travel_system/styles/widets/default_text_field.dart';
//
// class FilterScreen extends StatefulWidget {
//    FilterScreen({super.key});
//
//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }
//
// class _FilterScreenState extends State<FilterScreen> {
//   var textController = TextEditingController();
//
//    String ?flights;
//
//    String ?dateTime;
//
//    String ?willToFly;
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('Filter'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: SizeConfig.width * 0.06,
//           ),
//           child:Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const NewPostRowDateWidget(icon: AssetsManager.airportImage, text:'Flights',description: 'Choose location of your flight that you have',),
//
//               SizedBox(height: SizeConfig.height * 0.01,),
//
//               Container(
//                 padding: EdgeInsets.only(
//                     left: SizeConfig.height * 0.02,
//                     right: SizeConfig.height * 0.02
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey[300],
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     hint: Text('Enter Your Location',style: TextStyles.textStyle18Regular.copyWith(
//                         color: Colors.black54
//                     )),
//                     icon: const Icon(Icons.arrow_drop_down),
//                     elevation: 5,
//                     value: flights,
//                     style: const TextStyle(color: Colors.black, fontSize: 16),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         flights=newValue;
//                       });
//                     },
//                     items: <String>['One', 'Two', 'Three', 'Four']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: SizeConfig.height * 0.04,),
//
//               const NewPostRowDateWidget(icon: AssetsManager.travelDateImage, text:'Date time',description: 'Choose location of your flight that you have',),
//
//               SizedBox(height: SizeConfig.height * 0.01,),
//
//               GestureDetector(
//                 onTap: (){
//                   showDatePicker(
//                       context: context,
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2030)
//                   ).then((v){
//                     setState(() {
//                       dateTime = v.toString();
//                     });
//                   });
//                 },
//                 child: Container(
//                     padding: EdgeInsets.symmetric(
//                         vertical: SizeConfig.height * 0.01,
//                         horizontal: SizeConfig.width * 0.02
//                     ),
//                     width: SizeConfig.width,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(dateTime??'Choose Date',style: TextStyles.textStyle18Medium.copyWith(
//                         color: Colors.black54
//                     ),
//                     )),
//               ),
//
//               SizedBox(height: SizeConfig.height * 0.04,),
//
//               const NewPostRowDateWidget(icon: AssetsManager.willToFlyImage, text:'Willing to fly',description: 'Choose location of your flight that you have',),
//
//               SizedBox(height: SizeConfig.height * 0.01,),
//
//               GestureDetector(
//                 onTap: (){
//                   showDatePicker(
//                       context: context,
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2030)
//                   ).then((v){
//                     setState(() {
//                       willToFly = v.toString();
//                     });
//                   });
//                 },
//                 child: Container(
//                     padding: EdgeInsets.symmetric(
//                         vertical: SizeConfig.height * 0.01,
//                         horizontal: SizeConfig.width * 0.02
//                     ),
//                     width: SizeConfig.width,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(willToFly??'Choose Date',style: TextStyles.textStyle18Medium.copyWith(
//                         color: Colors.black54
//                     ),
//                     )),
//               ),
//
//               SizedBox(height: SizeConfig.height * 0.04,),
//
//               const NewPostRowDateWidget(icon: AssetsManager.hoursImage, text:'Hours',description: 'Choose location of your flight that you have',),
//
//               SizedBox(height: SizeConfig.height * 0.01,),
//
//               DefaultTextField(
//                   controller: textController,
//                   hintText: 'Hours',
//                   validator: (v){},
//                   keyboardType: TextInputType.number,
//                   textInputAction: TextInputAction.done,
//                   fillColor: Colors.grey[300]
//               ),
//
//               SizedBox(height: SizeConfig.height * 0.04,),
//
//               Align(
//                 alignment: Alignment.center,
//                 child: DefaultButton(
//                     buttonText: 'Confirm',
//                     onPressed: (){},
//                     buttonColor: ColorManager.primaryBlue,
//                     large: true
//                 ),
//               ),
//
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }
