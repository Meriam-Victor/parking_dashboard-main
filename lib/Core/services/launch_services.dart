
import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

launchLink({required Uri uri})async{
  try{
    await launchUrl(uri);
  }catch(e){
    log(e.toString());
  }
}

