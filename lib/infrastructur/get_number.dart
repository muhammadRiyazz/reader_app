
import 'dart:developer';

String getnumber({required String text}){


  RegExp indianPhoneNumberRegExp = RegExp(r'\b(\+91|0)?[6789]\d{9}\b');

  RegExpMatch? match = indianPhoneNumberRegExp.firstMatch(text);

  if (match != null) {
    String? phoneNumber = match.group(0);
    log(phoneNumber.toString());
    return phoneNumber!;
  } else {
    log('message');
    return 'No Data';

  }

}