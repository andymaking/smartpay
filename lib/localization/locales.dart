import 'package:flutter_localization/flutter_localization.dart';

// LIST OF LANGUAGES
const List<MapLocale> LOCALES =[
  MapLocale("en", LocaleData.EN),
];

// SETTING UP TEXT FOR MULTI LANGUAGES

mixin LocaleData {

  static const String emptyPhoneNumber = 'emptyPhoneNumber';
  static const String invalidPhoneNumber = 'invalidPhoneNumber';
  static const String password8 = 'password8';
  static const String passwordNumber = 'passwordNumber';
  static const String passwordCapital = 'passwordCapital';
  static const String continues = 'continues';
  static const String passwordSmall = 'passwordSmall';
  static const String passwordSign = 'passwordSign';
  static const String enterPassword = 'enterPassword';
  static const String emptyField = 'emptyField';
  static const String confirmPassword = 'confirmPassword';
  static const String confirmPasswordSamePassword = 'confirmPasswordSamePassword';
  static const String onBoardingTitle1 = 'onBoardingTitle1';
  static const String onBoardingTitle2 = 'onBoardingTitle2';
  static const String onBoardingDescription1 = 'onBoardingDescription1';
  static const String onBoardingDescription2 = 'onBoardingDescription2';
  static const String smart = 'smart';
  static const String pay = 'pay';
  static const String hiThere = 'hiThere';
  static const String skip = 'skip';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String or = 'or';
  static const String email = 'email';
  static const String password = 'password';
  static const String forgotPassword = 'forgotPassword';
  static const String getStarted = 'getStarted';
  static const String welcomeBack = 'welcomeBack';
  static const String enterEmail = 'enterEmail';
  static const String createA = 'createA';
  static const String smartPay = 'smartPay';
  static const String account = 'account';
  static const String weSentACode = 'weSentACode';
  static const String resendCode = 'resendCode';
  static const String enterItToVerify = 'enterItToVerify';
  static const String verifyItsYou = 'verifyItsYou';
  static const String confirm = 'confirm';
  static const String hiThereTellUs = 'hiThereTellUs';
  static const String dontHaveAnAccount = 'dontHaveAnAccount';
  static const String yourself = 'yourself';
  static const String fullName = 'fullName';
  static const String userName = 'userName';
  static const String selectCountry = 'selectCountry';
  static const String search = 'search';
  static const String setYourPin = 'setYourPin';
  static const String weUseStateOfTheArt = 'weUseStateOfTheArt';
  static const String createPin = 'createPin';
  static const String congratulations = 'congratulations';
  static const String youHaveCompletedTheONboarding = 'youHaveCompletedTheONboarding';
  static const String unitedState = 'unitedState';
  static const String unitedKingdom = 'unitedKingdom';
  static const String singapore = 'singapore';
  static const String china = 'china';
  static const String ghana = 'ghana';
  static const String netherlands = 'netherlands';
  static const String indonesia = 'indonesia';
  static const String cancel = 'cancel';
  static const String nigeria = 'nigeria';
  static const String welcomeBackUser = 'welcomeBackUser';
  static const String alreadyHaveAnAccount = 'alreadyHaveAnAccount';
  static const String enterPinToProceed = 'enterPinToProceed';
  static const String forgotPin = 'forgotPin';
  static const String logOut = 'logOut';
  static const String sendMeEmail = 'sendMeEmail';
  static const String confirmLogOut = 'confirmLogOut';
  static const String recoverPassword = 'recoverPassword';
  static const String enterYourRegisterdEmail = 'enterYourRegisterdEmail';
  static const String verifyYourIdentity = 'verifyYourIdentity';
  static const String whereWouldYouLike = 'whereWouldYouLike';
  static const String toSendYourSecuirtyCode = 'toSendYourSecuirtyCode';
  static const String creatNewPassword = 'creatNewPassword';
  static const String pleaseEnterANewPassword = 'pleaseEnterANewPassword';
  static const String secretMessage = 'secretMessage';


  // CONVERTED ENGLISH LANGUAGE
  static const Map<String, dynamic> EN = {
    confirm: "Confirm",
    secretMessage: "Secret Message",
    pleaseEnterANewPassword: "Please, enter a new password below different from the previous password",
    verifyYourIdentity: "Verify your identity",
    creatNewPassword: "Create New Password",
    sendMeEmail: "Send me email",
    whereWouldYouLike: "Where would you like ",
    toSendYourSecuirtyCode: " to send your security code?",
    recoverPassword: "Password Recovery",
    enterYourRegisterdEmail: "Enter your registered email below to receive password instructions",
    forgotPin: "Forgot Pin?",
    enterPinToProceed: "Please enter your pin to proceed",
    welcomeBackUser: "Welcome back, ",
    logOut: "Log out",
    confirmLogOut: "Confirm Log out",
    unitedState: "United States",
    unitedKingdom: "United Kingdom",
    singapore: "Singapore",
    alreadyHaveAnAccount: "Already have an account? ",
    china: "China",
    ghana: "Ghana",
    netherlands: "Netherlands",
    indonesia: "Indonesia",
    nigeria: "Nigeria",
    congratulations: "Congratulations, ",
    youHaveCompletedTheONboarding: "You’ve completed the onboarding, you can start using",
    createPin: "Create PIN",
    setYourPin: "Set your PIN code",
    weUseStateOfTheArt: "We use state-of-the-art security measures to protect your information at all times",
    search: "Search",
    cancel: "cancel",
    fullName: "Full Name",
    userName: "Username",
    selectCountry: "Select Country",
    yourself: "yourself",
    hiThereTellUs: "Hey there! tell us a bit \nabout ",
    dontHaveAnAccount: "Don’t have an account? ",
    welcomeBack: "Welcome back, Sign in to your account",
    emptyPhoneNumber: "Phone Number cannot be empty",
    enterEmail: "Enter Your email",
    createA: "Create a ",
    smartPay: "Smartpay",
    // confirm: "Confirm",
    resendCode: "Resend Code ",
    enterItToVerify: ". Enter it here to verify your identity",
    weSentACode: "We send a code to ",
    verifyItsYou: "Verify it’s you",
    account: "account",
    continues: "Continue",
    email: "Email",
    password: "Password",
    hiThere: "Hi There! 👋",
    getStarted: "Get Started",
    smart: "Smart",
    or: "OR",
    pay: "pay",
    signIn: "Sign In",
    signUp: "Sign Up",
    forgotPassword: "Forgot Password?",
    skip: "Skip",
    onBoardingTitle1: "Finance app the safest \nand most trusted",
    onBoardingDescription1: "Your finance work starts here. Our here to help \nyou track and deal with speeding up your \ntransactions.",
    onBoardingDescription2: "Get easy to pay all your bills with just a few \nsteps. Paying your bills become fast and \nefficient.",
    onBoardingTitle2: "The fastest transaction \nprocess only here",
    password8: "8 characters minimum",
    enterPassword: "Enter Password",
    confirmPassword: "Confirm Password",
    passwordNumber: "A number",
    passwordCapital: "CAPITAL letter",
    passwordSmall: "small letter",
    emptyField: "Field Cannot be empty",
    confirmPasswordSamePassword: "Confirm password Must be equal to password",
    passwordSign: "Password must contain signs (\$-@!*)",
    invalidPhoneNumber: "Invalid Phone Number",



  };

}