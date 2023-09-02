import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/providers/user_data.dart';

class CustomApiService {
  static const baseUrl =
      'https://64f3185eedfa0459f6c64a42.mockapi.io/api/v1/users';

  final Dio _dio = Dio();

  Future<void> addUser(String name, String id, String email) async {
    try {
      final response = await _dio.post(
        baseUrl,
        data: {'name': name, 'favourites': [], 'email': email, 'UserId': id},
      );

      if (response.statusCode == 201) {
        print('User added successfully');
      } else {
        print('Failed to add user. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to add user. Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchDataByName(String email) async {
    print("email " + email);
    try {
      final response = await _dio
          .get('https://64f3185eedfa0459f6c64a42.mockapi.io/api/v1/users/');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        // Find the item with the matching name
        final item = data.firstWhere(
          (item) => item['email'] == email,
          // orElse: () => null,
        );
        print(item);
        if (item != null) {
          print(item);
          return item;
        } else {
          throw Exception('Item not found');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<List> getUserFavorites() async {
    Map<String, dynamic> user = await fetchDataByName(UserData.email);
    // UserData.Favourites = user['favourites'];
    return user['favourites'];
  }

  Future<void> addUserFavorite(String email, String favoriteId) async {
    Map<String, dynamic> user = await fetchDataByName(email);
    print(user);
    final url = '$baseUrl/${user["UserId"]}';
    print(url);

    // final response = await _dio.get(url);
    // if (response.statusCode == 200) {
    // final user = jsonDecode(response.data);
    user['favourites'].add(favoriteId);

    final updateResponse = await _dio.put(
      url,
      data: user,
    );

    if (updateResponse.statusCode == 200) {
      print('User favorite added successfully');
    } else {
      print('Failed to add user favorite. Error: ${updateResponse.statusCode}');
    }
  }

  Future<void> RemoveUserFavorite(String email, String favoriteId) async {
    Map<String, dynamic> user = await fetchDataByName(email);
    print(user);
    final url = '$baseUrl/${user["UserId"]}';
    print(url);

    // final response = await _dio.get(url);
    // if (response.statusCode == 200) {
    // final user = jsonDecode(response.data);
    user['favourites'].remove(favoriteId);

    final updateResponse = await _dio.put(
      url,
      data: user,
    );

    if (updateResponse.statusCode == 200) {
      print('User favorite added successfully');
    } else {
      print('Failed to add user favorite. Error: ${updateResponse.statusCode}');
    }
  }
}
