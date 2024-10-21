import 'package:api3/model/user.dart';
import 'package:api3/servies/user_api.dart';
import 'package:flutter/material.dart';
import '../model/user_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Rest Apis Call',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index){
            final user = users[index];
            final email=user.email;
            // final color =user.gender=='male' ? Colors.blueAccent : Colors.redAccent;
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.location.country),
              // tileColor: color,
            );
          }
      ),
    );
  }

  Future <void> fetchUsers()async{
    final response = await  UserApi.fetchUsers();
    setState(() {
      users =response;
    });
  }

}
