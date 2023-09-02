import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';

class UserData {
  static String id = FireBaseHelper().getCurrentUserId();
  static String username = FireBaseHelper().getCurrentUsername();
  static String email = FireBaseHelper().getCurrentUserEmail();
  static List? Favourites;
  static List? CartItems;
}
