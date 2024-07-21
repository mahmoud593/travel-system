import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/post_widget.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite Posts',
            style: TextStyles.textStyle18Medium.copyWith(color: ColorManager.black),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SettingsCubit.get(context).favoritePosts.isNotEmpty? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>PostWidget(
                  postModel: SettingsCubit.get(context).favoritePosts[index],
                  isFavorite: true,
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: SettingsCubit.get(context).favoritePosts.length
            ) : Center(
              child: Text('Favorite posts is empty',style: TextStyles.textStyle18Medium.copyWith(color: ColorManager.black),
              ),
            );
          },
        ),
    );
  }
}
