import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';
import 'package:travel_system/features/settings/presentation/view/notification_screen/widgets/notification_item.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/loading_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyles.textStyle18Medium.copyWith(
              color: ColorManager.black,
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),

      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is GetNotificationsLoadingState ? true : false,
            progressIndicator: const LoadingAnimationWidget(),
            child: SizedBox(
              height: SizeConfig.height,
              width: SizeConfig.width,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.height * 0.02),
                child: SettingsCubit.get(context).notifications. isNotEmpty ? ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: SizeConfig.height * 0.01);
                  },
                  itemBuilder: (context, index) {
                    return NotificationItem(
                      postModel: SettingsCubit.get(context).notifications[index],
                      percentage: SettingsCubit.get(context).notificationPercent[SettingsCubit.get(context).notifications[index].postId].toString(),
                    );
                  },
                  itemCount: SettingsCubit.get(context).notifications.length,
                ): Center(
                  child: Text(
                    'You don\'t have Notifications',
                    style: TextStyles.textStyle18Medium.copyWith(
                        color: ColorManager.black
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
