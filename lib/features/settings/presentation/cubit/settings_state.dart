abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class UploadImageSuccessState extends SettingsState {}
class UploadImageErrorState extends SettingsState {}


class GetUserDataLoadingState extends SettingsState {}
class GetUserDataSuccessState extends SettingsState {}
class GetUserDataErrorState extends SettingsState {}

class UploadUserImageLoadingState extends SettingsState {}
class UploadUserImageSuccessState extends SettingsState {}
class UploadUserImageErrorState extends SettingsState {}


class UpdateUserProfileLoadingState extends SettingsState {}
class UpdateUserProfileSuccessState extends SettingsState {}
class UpdateUserProfileErrorState extends SettingsState {}


class UserSignOutSuccessState extends SettingsState {}
class UserSignOutErrorState extends SettingsState {}


class DeleteUserLoadingState extends SettingsState {}
class DeleteUserSuccessState extends SettingsState {}
class DeleteUserErrorState extends SettingsState {}

class GetFavoritePostsLoadingState extends SettingsState {}
class GetFavoritePostsSuccessState extends SettingsState {}
class GetFavoritePostsErrorState extends SettingsState {}

class GetHistoryPostsLoadingState extends SettingsState {}
class GetHistoryPostsSuccessState extends SettingsState {}
class GetHistoryPostsErrorState extends SettingsState {}

class CheckIfIsFavorite extends SettingsState {}


