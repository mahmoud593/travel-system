import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:intl/intl.dart' as intl;


class SendMessageContainer extends StatefulWidget {
  const SendMessageContainer({super.key});

  @override
  State<SendMessageContainer> createState() => _SendMessageContainerState();
}

class _SendMessageContainerState extends State<SendMessageContainer> {
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    bool isRTL = intl.Bidi.detectRtlDirectionality(messageController.text);

    return Container(
      height:  SizeConfig.height*0.09,
      decoration: const BoxDecoration(
        color: ColorManager.primaryBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SizedBox(
                height: SizeConfig.height*0.06,
                child: TextFormField(
                  controller: messageController,
                  cursorColor: ColorManager.primaryBlue,
                  textDirection:   isRTL ? TextDirection.rtl : TextDirection.ltr,
                  maxLines: 5 ,
                  decoration: const InputDecoration(
                      focusedBorder:  OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                            Radius.circular(30)),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                            Radius.circular(30)),
                      ),
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: "Type a Message",
                      border: OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                            Radius.circular(30)),
                      ),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.height*0.01,),
            InkWell(
              onTap: () {
                // viewModel.sendMessage(messageController.text);
              },
              child: Icon(
                Icons.send,
                size: SizeConfig.height*0.035,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
