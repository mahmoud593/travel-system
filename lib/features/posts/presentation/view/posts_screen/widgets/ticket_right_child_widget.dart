import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';

class TicketRightChildWidget extends StatelessWidget {
  const TicketRightChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      child: const Image(
        color: Colors.white,
        image: AssetImage(AssetsManager.planeTicketImage),
      ),
    );
  }
}
