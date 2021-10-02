import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_user.dart';

class Preference {
  Future saveUser(DataUser datauser)async{
    final pref=await SharedPreferences.getInstance();
    await pref.setString('fullname', datauser.name);
    await pref.setInt('phone', datauser.phone);
    await pref.setString('email', datauser.email);
  }
  Future getDataUser()async{
    final pref=await SharedPreferences.getInstance();
    final name=pref.getString('name');
    final phone=pref.getInt('phone');
    final email=pref.getString('email');
    return DataUser(
      name:name,
      phone:phone,
      email:email,
    );
  }
}
