import 'package:bastogah_app/core/widgets/custom_toast/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUrlLauncher {
  void openGoogleMaps({required double lat, required double lng}) {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );

    _canLaunchMyUrl(url);
  }
  // void openPDF()  {
  //   // you can launch any url
  //   Uri url = Uri.parse('https://books-library.net/free-402765885-download');
  //   _canLaunchMyUrl(url);
  // }

  // void calling()  {
  //   Uri url = Uri.parse('tel:+201551190267');
  // _canLaunchMyUrl(url );
  // }

  // void whatsapp() {
  //   String phoneNumber = '+201066505898';
  //   // Uri url = Uri.parse('whatsapp://send?phone=$phoneNumber');  please note that starting from WhatsApp version 2.21.100 and later, WhatsApp has implemented a security feature that restricts launching the app using URL schemes directly. This means that this method may not work with recent versions of WhatsApp.
  //   Uri url = Uri.parse(
  //     'https://wa.me/$phoneNumber',
  //   ); // this method will open whatsapp on browser , and if whatsapp app is installed , it will automatically open the app
  //   _canLaunchMyUrl(url);
  // }

  // void telegram() {
  //   String phoneNumber = '+201066505898';
  //   Uri url = Uri.parse('https://t.me/$phoneNumber');
  //   _canLaunchMyUrl(url);
  // }

  // void github() {
  //   String url = 'https://github.com/AhmedNasser24';
  //   Uri url2 = Uri.parse(url);
  //   _canLaunchMyUrl(url2);
  // }

  // void facebook() {
  //   String url = 'https://www.facebook.com/profile.php?id=100005886461661';
  //   Uri url2 = Uri.parse(url);
  //   _canLaunchMyUrl(url2);
  // }

  // void linkedin() {
  //   String url = 'https://www.linkedin.com/in/ahmed-nasser-a83a4a257';
  //   Uri url2 = Uri.parse(url);
  //   _canLaunchMyUrl(url2);
  // }

  // void email() {
  //   String email = 'eng.ahmednasser2024@gmail.com';

  //   Uri url = Uri.parse('mailto:$email');
  //   _canLaunchMyUrl(url);
  // }

  // void downloadApk(String apkDownloadUrl) async {
  //   final Uri url = Uri.parse(apkDownloadUrl);
  //   _canLaunchMyUrl(url);
  // }

  void _canLaunchMyUrl(Uri url) {
    // if (await canLaunchUrl(url)) {
    try {
      launchUrl(url);
    } catch (e) {
      CustomFlutterToast.showErrorToast(e.toString());
    }

    // }
    // else {
    //   showSnackBar(, url.toString());
    // }
  }
}
