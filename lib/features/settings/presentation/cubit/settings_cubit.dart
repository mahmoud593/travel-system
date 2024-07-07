import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  TextEditingController editProfileNameController = TextEditingController();
  TextEditingController editProfileEmailController = TextEditingController();
  TextEditingController editProfileBaseController = TextEditingController();
  TextEditingController editProfileRankController = TextEditingController();
  TextEditingController editProfilePayrollNumberController = TextEditingController();
  TextEditingController editProfilePhoneNumberController = TextEditingController();



  File? uploadedProfileImage;
  var imagePicker = ImagePicker();

  Future <void> getProfileImage() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedProfileImage = File(pickedFile.path);
      emit(UploadImageSuccessState());
    } else {
      debugPrint('No Image selected.');
      emit(UploadImageErrorState());
    }
  }

}
