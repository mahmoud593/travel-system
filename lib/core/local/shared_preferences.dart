import 'package:shared_preferences/shared_preferences.dart';


class UserDataFromStorage {

  static late String driverUserName;
  static late String driverEmail;
  static String ?driverPhone;
  static late String driverAbout;
  static late String driverAddress;
  static late String driverKind;
  static String notLogin='';
  static late String driverCarImage;
  static late String driverPersonalImage;
  static late String driverCity;
  static late String userId;
  static late bool userIsLogin;
  static late bool userIsCompany;
  static late bool themeIsDarkMode;
  static late bool onBoardingIsOpen;
  static String languageCodeFromStorage='en';
  static String languageNameFromStorage="langEnglish";






  static late int signInClickCountFromStorage;
  static late int verifySignUpSeekerClickCount;
  static late int verifySignUpRecruiterClickCount;
  static late int verifyForgetPasswordClickCount;
  static late int forgetPasswordEmailClickCount;
  static late int changePasswordEmailClickCount;

  static late int userGender;

  static late String signInLimitDateFromStorage;
  static late String verifySignUpSeekerLimitDate;
  static late String verifySignUpRecruiterLimitDate;
  static late String verifyForgetPasswordLimitDate;
  static late String forgetPasswordEmailLimitDate;
  static late String changePasswordEmailLimitDate;


  static setDriverUserName(String value) {
    driverUserName=value;
    _setData();
  }

  static setDriverEmail(String value) {
    driverEmail=value;
    _setData();
  }

  static setDriverPhone(String value) {
    driverPhone=value;
    _setData();
  }

  static setDriverAbout(String value) {
    driverAbout=value;
    _setData();
  }

  static setNotLogin(String value) {
    notLogin=value;
    _setData();
  }

  static setDriverKind(String value) {
    driverKind=value;
    _setData();
  }

  static setDriverCity(String value) {
    driverCity=value;
    _setData();
  }
  static setUserId(String value) {
    userId=value;
    _setData();
  }

  static setDriverCarImage(String value) {
    driverCarImage=value;
    _setData();
  }

  static setDriverPersonalImage(String value) {
    driverPersonalImage=value;
    _setData();
  }


  static setOnBoardingOpened(bool value) {
    onBoardingIsOpen=value;
    _setData();
  }



  static setIsCompany(bool value) {
    userIsCompany=value;
    _setData();
  }


  static setSignInClickCount(int count) {
    signInClickCountFromStorage=count;
    _setData();
  }

  static setUserGender(int count) {
    userGender=count;
    _setData();
  }

  static setForgetPasswordClickCount(int count) {
    forgetPasswordEmailClickCount=count;
    _setData();
  }
  static setChangePasswordClickCount(int count) {
    changePasswordEmailClickCount=count;
    _setData();
  }


  static setVerifySignUpSeekerClickCount(int count) {
    verifySignUpSeekerClickCount=count;
    _setData();
  }

  static setVerifySignUpRecruiterClickCount(int count) {
    verifySignUpRecruiterClickCount=count;
    _setData();
  }

  static setVerifyForgetPasswordClickCount(int count) {
    verifyForgetPasswordClickCount=count;
    _setData();
  }

  static  setSignInLimitDateFromStorage(String value)  {
    signInLimitDateFromStorage=value;
    _setData();
  }

  static setChangePasswordLimitDateFromStorage(String value)  {
    changePasswordEmailLimitDate=value;
    _setData();
  }

  static setForgetPasswordEmailLimitDate(String value)  {
    forgetPasswordEmailLimitDate=value;
    _setData();

  }

  static  setVerifySignUpSeekerLimitDate(String value)  {
    verifySignUpSeekerLimitDate=value;
    _setData();
  }

  static  setVerifySignUpRecruiterLimitDate(String value)  {
    verifySignUpRecruiterLimitDate=value;
    _setData();
  }

  static  setVerifyForgetPasswordLimitDate(String value)  {
    verifyForgetPasswordLimitDate=value;
    _setData();
  }

  static setUserIsLogin(bool block) {
    userIsLogin = block;
    _setData();
  }
  static setThemeIsDarkMode(bool darkMode) {
    themeIsDarkMode = darkMode;
    _setData();
  }


  static  setAppLanguageCode(String value)  {
    languageCodeFromStorage=value;
    _setData();
  }



  static  setAppLanguageName(String value)  {
    languageNameFromStorage=value;
    _setData();
  }




  /// this function to remove all storage
  static removeAllDataFromStorage() async{
    final prefs= await SharedPreferences.getInstance();
    await prefs.clear();
  }
  /// this function to remove any data from local storage by key
  static removeDataFromStorage(String key) async{
    final prefs= await SharedPreferences.getInstance();
    await prefs.remove(key);
  }


  //#region private
  static void _setData()async {

    final prefs= await SharedPreferences.getInstance();
    prefs.setBool("userIsLogin",userIsLogin);
    prefs.setBool("userIsCompany",userIsCompany);

    prefs.setString('driverUserName',driverUserName);
    prefs.setString('driverEmail',driverEmail);
    prefs.setString('driverPhone',driverPhone!);
    prefs.setString('driverAbout',driverAbout);
    prefs.setString('driverAddress',driverAddress);
    prefs.setString('driverKind',driverKind);
    prefs.setString('driverCarImage',driverCarImage);
    prefs.setString('driverPersonalImage',driverPersonalImage);
    prefs.setString('driverCity',driverCity);
    prefs.setString('userId',userId);
    prefs.setString('notLogin',notLogin);



    prefs.setBool("themeIsDarkMode",themeIsDarkMode);
    prefs.setBool("onBoardingIsOpen",onBoardingIsOpen);
    prefs.setString("languageCodeFromStorage",languageCodeFromStorage);
    prefs.setString("languageNameFromStorage",languageNameFromStorage);
    prefs.setInt("signInClickCountFromStorage",signInClickCountFromStorage);
    prefs.setInt("verifySignUpSeekerClickCount",verifySignUpSeekerClickCount);
    prefs.setInt("verifySignUpRecruiterClickCount",verifySignUpRecruiterClickCount);
    prefs.setInt("verifyForgetPasswordClickCount",verifyForgetPasswordClickCount);
    prefs.setInt("forgetPasswordEmailClickCount",forgetPasswordEmailClickCount);
    prefs.setInt("changePasswordEmailClickCount",changePasswordEmailClickCount);
    prefs.setInt("userGender",userGender);
    prefs.setString("signInLimitDateFromStorage",signInLimitDateFromStorage);
    prefs.setString("verifySignUpSeekerLimitDate",verifySignUpSeekerLimitDate);
    prefs.setString("verifySignUpRecruiterLimitDate",verifySignUpRecruiterLimitDate);
    prefs.setString("verifyForgetPasswordLimitDate",verifyForgetPasswordLimitDate);
    prefs.setString("forgetPasswordEmailLimitDate",forgetPasswordEmailLimitDate);
    prefs.setString("changePasswordEmailLimitDate",changePasswordEmailLimitDate);





  }


  static   getData() async {


    final prefs = await SharedPreferences.getInstance();
    userIsLogin = prefs.getBool("userIsLogin")?? false;
    userIsCompany = prefs.getBool("userIsCompany")?? true;
    themeIsDarkMode = prefs.getBool("themeIsDarkMode")?? false;
    onBoardingIsOpen = prefs.getBool("onBoardingIsOpen")?? false;
    languageCodeFromStorage = prefs.getString("languageCodeFromStorage")??'en';
    languageNameFromStorage = prefs.getString("languageNameFromStorage")??'langEnglish';

    driverUserName = prefs.getString("driverUserName")??'';
    driverEmail = prefs.getString("driverEmail")??'';
    driverPhone = prefs.getString("driverPhone")??'';
    driverKind = prefs.getString("driverKind")??'';
    driverAddress = prefs.getString("driverAddress")??'';
    driverPersonalImage = prefs.getString("driverPersonalImage")??'';
    driverCarImage = prefs.getString("driverCarImage")??'';
    driverAbout = prefs.getString("driverAbout")??'';
    driverCity = prefs.getString("driverCity")??'';
    userId = prefs.getString("userId")??'';
    notLogin = prefs.getString("notLogin")??'';



    signInClickCountFromStorage = prefs.getInt("signInClickCountFromStorage")?? 0;
    verifySignUpSeekerClickCount = prefs.getInt("verifySignUpSeekerClickCount")?? 0;
    verifySignUpRecruiterClickCount = prefs.getInt("verifySignUpRecruiterClickCount")?? 0;
    verifyForgetPasswordClickCount = prefs.getInt("verifyForgetPasswordClickCount")?? 0;
    forgetPasswordEmailClickCount = prefs.getInt("forgetPasswordEmailClickCount")?? 0;
    changePasswordEmailClickCount = prefs.getInt("changePasswordEmailClickCount")?? 0;
    userGender = prefs.getInt("userGender")?? 0;
    signInLimitDateFromStorage = prefs.getString("signInLimitDateFromStorage")??DateTime.now().toString();
    verifySignUpSeekerLimitDate = prefs.getString("verifySignUpSeekerLimitDate")??DateTime.now().toString();
    verifySignUpRecruiterLimitDate = prefs.getString("verifySignUpRecruiterLimitDate")??DateTime.now().toString();
    verifyForgetPasswordLimitDate = prefs.getString("verifyForgetPasswordLimitDate")??DateTime.now().toString();
    forgetPasswordEmailLimitDate = prefs.getString("forgetPasswordEmailLimitDate")??DateTime.now().toString();
    changePasswordEmailLimitDate = prefs.getString("changePasswordEmailLimitDate")??DateTime.now().toString();


  }

//#endregion

}
