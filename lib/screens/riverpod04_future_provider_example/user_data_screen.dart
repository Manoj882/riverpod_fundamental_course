import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_course/models/user_model.dart';
import 'package:riverpod_course/services/api_service.dart';


//RiverPod4: Future Provider

// for Future Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());
final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});


class UserDataScreen extends ConsumerWidget {
  const UserDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: userData.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(data[index].avatar),
                ),
                title: Text('${data[index].firstName} ${data[index].lastName}'),
                subtitle: Text(data[index].email),
              );
            },
          );
        },
        error: ((error, stackTrace) => Text(
              error.toString(),
            )),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
