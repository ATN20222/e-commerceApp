import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:ecommerce/providers/custom_api_service.dart';

class UserData {
  CustomApiService customApiService = CustomApiService();
  static String id = FireBaseHelper().getCurrentUserId();
  static String username = FireBaseHelper().getCurrentUsername();
  static String email = FireBaseHelper().getCurrentUserEmail();
  static List Favourites = [];
  // static List<Product> FavDisplay = [];
}
