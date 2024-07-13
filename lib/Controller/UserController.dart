
import '../Model/UserDao.dart';
import '../Model/UserModel.dart';

class UserController {
  final UserDao _userDao = UserDao();

  Future<void> addUser(String username, String email ,String id) async {
    final user = UserModel(
      username: username,
      email: email,
      id: id,
    );
    await _userDao.createUser(user);
  }

  Future<UserModel?> getUserById(int id) async {
    return await _userDao.getUserById(id);
  }
  Future<UserModel?> getLastUser() async {

    return await _userDao.getLastUser();

  }
}
