

import 'package:github_search/model/user_model.dart';
import 'package:github_search/services/get_user.dart';
import 'package:riverpod/riverpod.dart';

final userDataProvider = FutureProvider<UserModel>((ref) async {
  final searchQuery = ref.watch(searchUserProvider);
  return ref.watch(userProvider).getUsers(searchQuery.isEmpty? "djneme" : searchQuery);
});


final searchUserProvider = StateProvider<String>((ref) => '');
