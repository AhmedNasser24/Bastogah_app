import 'package:bastogah_app/core/widgets/custom_toast/show_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

Future<bool> isThereNetworkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet) ||
      connectivityResult.contains(ConnectivityResult.vpn) ||
      connectivityResult.contains(ConnectivityResult.bluetooth) ||
      connectivityResult.contains(ConnectivityResult.other)) {
    return true;
  } else {
    CustomFlutterToast.showErrorToast(
      "check_your_internet_connection_and_try_again".tr(),
    );
    return false;
  }
}
