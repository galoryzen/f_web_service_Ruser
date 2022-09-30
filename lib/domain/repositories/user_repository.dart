import 'package:loggy/loggy.dart';

import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {
  UserLocalDataSource userLocalDataSource = UserLocalDataSource();
  UserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();

  UserRepository() {
    logInfo("Starting UserRepository");
  }

  Future<bool> getUser() async {
    logInfo("Getting user from remote");
    RandomUser user = await userRemoteDataSource.getUser();
    logInfo("Got user from remote");
    print(user.email);
    userLocalDataSource.addUser(user);
    return true;
  }

  Future<List<RandomUser>> getAllUsers() async =>
      userLocalDataSource.getAllUsers();

  Future<void> deleteUser(id) async => userLocalDataSource.deleteUser(id);

  Future<void> deleteAll() async => userLocalDataSource.deleteAll();

  Future<void> updateUser(user) async => userLocalDataSource.updateUser(user);
}
