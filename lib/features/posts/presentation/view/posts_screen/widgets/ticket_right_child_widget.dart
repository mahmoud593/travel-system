import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';

class TicketRightChildWidget extends StatelessWidget {
  const TicketRightChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.white,)),

          SizedBox(height: SizeConfig.height*0.027 ,),
          const Image(
            color: Colors.white,
            image: AssetImage(AssetsManager.planeTicketImage),
          ),
        ],
      ),
    );
  }
}
