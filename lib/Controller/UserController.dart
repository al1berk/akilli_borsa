import 'package:get/get.dart';
import '../Model/UserDao.dart';
import '../Model/UserModel.dart';

class UserController extends GetxController {
  final UserDao _userDao = UserDao();

  var user = Rxn<UserModel>();
  var userStocks = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLastUser();
    fetchUserByUserID(user.value?.userID ?? '');
  }

  Future<void> addUser(String userID, String username, String email) async {
    final user = UserModel(
      userID: userID,
      username: username,
      email: email,
    );
    await _userDao.createUser(user);
    fetchLastUser();

  }

  Future<void> fetchUserById(int id) async {
    user.value = await _userDao.getUserById(id);
  }

  Future<void> fetchUserByUserID(String userID) async {
    user.value = await _userDao.getUserByUserID(userID);
  }

  Future<void> fetchLastUser() async {
    user.value = await _userDao.getLastUser();
    if (user.value != null) {
      fetchUserStocks(user.value!.userID);
    }
  }

  Future<void> addStockToUser(String userID, String symbol) async {
    final user = await _userDao.getUserByUserID(userID);
    if (user != null) {
      await _userDao.addStockToUser(user.id!, symbol);
      fetchUserStocks(userID);
    } else {
      throw Exception('User not found');
    }
  }

  Future<void> fetchUserStocks(String userID) async {
    final user = await _userDao.getUserByUserID(userID);
    if (user != null) {
      userStocks.value = await _userDao.getUserStocks(user.id!);
    } else {
      throw Exception('User not found');
    }
  }
}
