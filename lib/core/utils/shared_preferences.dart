import 'package:shared_preferences/shared_preferences.dart';

class SaveUserData {
  late SharedPreferences sharedPreferences;

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('fullName', userData['fullName'] ?? '');
    await sharedPreferences.setString('email', userData['email'] ?? '');
    await sharedPreferences.setString(
        'mobileNumber', userData['mobileNumber'] ?? '');
    await sharedPreferences.setString('password', userData['password'] ?? '');
    await sharedPreferences.setString(
        'passwordConfirm', userData['passwordConfirm'] ?? '');
    await sharedPreferences.setString('gender', userData['gender'] ?? '');
    await sharedPreferences.setString('age', userData['age'] ?? '');
    await sharedPreferences.setString('weight', userData['weight'] ?? '');
    await sharedPreferences.setString('height', userData['height'] ?? '');
    await sharedPreferences.setString('goal', userData['goal'] ?? '');
    await sharedPreferences.setString(
        'physicalActivityLevel', userData['physicalActivityLevel'] ?? '');

    print("Data Saved Successfully ✅");
  }

  Future<Map<String, dynamic>> getUserData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> userData = {
      "fullName": sharedPreferences.getString('fullName') ?? '',
      "email": sharedPreferences.getString('email') ?? '',
      "mobileNumber": sharedPreferences.getString('mobileNumber') ?? '',
      "password": sharedPreferences.getString('password') ?? '',
      "passwordConfirm": sharedPreferences.getString('passwordConfirm') ?? '',
      "gender": sharedPreferences.getString('gender') ?? '',
      "age": sharedPreferences.getString('age') ?? '',
      "weight": sharedPreferences.getString('weight') ?? '',
      "height": sharedPreferences.getString('height') ?? '',
      "goal": sharedPreferences.getString('goal') ?? '',
      "physicalActivityLevel":
          sharedPreferences.getString('physicalActivityLevel') ?? ''
    };

    print("Data Retrieved Successfully ✅");
    return userData;
  }

  Future<void> removeUserData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.remove('fullName');
    await sharedPreferences.remove('email');
    await sharedPreferences.remove('mobileNumber');
    await sharedPreferences.remove('password');
    await sharedPreferences.remove('passwordConfirm');
    await sharedPreferences.remove('gender');
    await sharedPreferences.remove('age');
    await sharedPreferences.remove('weight');
    await sharedPreferences.remove('height');
    await sharedPreferences.remove('goal');
    await sharedPreferences.remove('physicalActivityLevel');

    print("Data Removed Successfully ✅");
  }
}
