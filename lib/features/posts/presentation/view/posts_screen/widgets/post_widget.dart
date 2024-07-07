import 'package:flutter/material.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/ticket_data_widget.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/ticket_right_child_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

              TicketMaterial(
                height: SizeConfig.height * 0.25,
                radiusBorder: 15,
                colorBackground: ColorManager.primaryBlue.withOpacity(.6),
                leftChild: const TicketDataWidget(),
                rightChild: const TicketRightChildWidget(),
              ),

          ],
        ),
      ),
    );
  }
}

