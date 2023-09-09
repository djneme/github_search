import 'package:flutter/material.dart';
import 'package:github_search/model/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key, required this.user});

   final UserModel user;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.user.login} Details"),
        elevation: 3,
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Image.network(widget.user.avatar_url?? "", width: 200,),
        Text(widget.user.name),
        Text(widget.user.login),
        Text(widget.user.followers.toString()),
        Text(widget.user.repos_url.toString()),
        Text(widget.user.following.toString()),
      ]),
    );
  }
}
