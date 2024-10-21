
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';

class ConstantData{

  static String kDefaultLung='en';
  static String kLung='kLung';
  static String kToken='kToken';
  static String kRefresh='kRefresh';
  static String kLogin='kLogin';
  static String kShowOnBoarding='kShowOnBoarding';

  static String phoneNumberKiro = "+33 6 44 91 35 10";
  static String callUsKiro = "+33 6 44 9 1 53 10";
  static String mailKiro = "contact@kirolimo.fr";

  static List<String> listSelectedQuestion =[
    // LocaleKeys.kWhatIsYourGrandfatherLastName,
    // LocaleKeys.kWhatYourHomeAddress,
    // LocaleKeys.kWhatIsYourMotherPhoneNumber,
    // LocaleKeys.kWhatIsYourBrightestChildhoodDream,
    // LocaleKeys.kWhatYourFavoriteArtist,
    // LocaleKeys.kWhatWasTheNameOfYourFirstSchool,
  ];

}

enum StateProfileUi{extraPhone,changePhone,cratePin,forgetPassword,changeMail}




