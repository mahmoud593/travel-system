import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/screens/settings_screen.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class TicketRightChildWidget extends StatelessWidget {
  final PostModel postModel;
  final bool isFavorite;
  const TicketRightChildWidget({super.key, required this.postModel, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PostsCubit, PostsStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IconButton(
          //     onPressed: (){
          //       if(isFavorite == true){
          //         PostsCubit.get(context).deletePostFromFavorites(postModel: postModel);
          //       }else{
          //         PostsCubit.get(context).addPostToFavorites(postModel: postModel);
          //       }
          //     },
          //     icon: isFavorite ? const Icon(Icons.favorite,color: Colors.white,):const Icon(Icons.favorite_border,color: Colors.white,),
          // ),

        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: Text(
                'Visa ',
                textAlign: TextAlign.start,
                style: TextStyles.textStyle18Bold.copyWith(color: Colors.white)
            ),
          ),

          SizedBox(height:  SizeConfig.height*0.01,),

          Align(
            child: Text(
                postModel.visa,
                textAlign: TextAlign.start,
                style:TextStyles.textStyle18Medium.copyWith(
                    color: Colors.white
                )
            ),
          ),
        ],
        ),

          const Spacer(),

          const Image(
            color: Colors.white,
            image: AssetImage(AssetsManager.planeTicketImage),
          ),
        ],
      ),
    );
  },
);
  }
}
