
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_search/screens/user_details_screen.dart';

import '../provider/user_provider.dart';

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  TextEditingController inputController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    void fetchUser() {
      print(inputController.text);
      ref.read(searchUserProvider.notifier).state = inputController.text;
    }


    print("hey $userData");
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 222, 222),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: inputController,
                        decoration: const InputDecoration(
                            hintText: 'Search', border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: fetchUser, child: const Text("Search"))
              ],
            ),
            Center(
              child: userData.when(data: (userData) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetailsScreen(
                                  user: userData,
                                )));
                  },
                  child: Material(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 5,
                    child: (Container(
                      height: 150,
                      width: 300,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.network(
                                userData.avatar_url != null
                                    ? userData.avatar_url!
                                    : " ",
                                height: 100,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userData.name),
                                Text(userData.login),
                                Text(userData.location ?? "No Location")
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                );
              }, error: (error, s) {
                return const Text("No user found");
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              }),
            ),
          ],
        ));
  }
}
