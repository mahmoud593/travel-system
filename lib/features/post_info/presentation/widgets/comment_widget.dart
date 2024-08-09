import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class CommentWidget extends StatelessWidget {
  final String userName;
  final String userImage;
  final String comment;
  const CommentWidget({ required this.userName, required this.userImage, required this.comment, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// user Image
              CircleAvatar(
                radius: SizeConfig.height * 0.025,
                backgroundImage:
                  NetworkImage(userImage),
              ),
              SizedBox(
                width: SizeConfig.width * 0.03,
              ),
              /// comment body
              Expanded(
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    /// user name
                      Text(userName,
                      style: TextStyles.textStyle18Regular.copyWith(
                        color: ColorManager.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    /// comment Container
                    Container(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        bottom: 10.0,
                        left: 15.0,
                        right: 15.0,
                      ),
                      decoration: BoxDecoration(
                        color:const Color(0xFFF3F5F7),
                        borderRadius:
                        BorderRadius.circular(12.0),
                      ),
                      child:   Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(comment,
                            style:   TextStyles.textStyle18Regular.copyWith(
                              color: ColorManager.black,
                            ),
                            overflow:  TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
