import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../Model/UserDao.dart';
import '../Model/UserModel.dart';

class UserController extends GetxController {
  final UserDao _userDao = UserDao();

  var user = Rxn<UserModel>();
  RxList<String> userStocks = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addUser(String userID, String username, String email) async {
    try {
      final userO = UserModel(
        userID: userID,
        username: username,
        email: email,
      );
      await _userDao.createUser(userO);
      print("kullanıcı başarıyla eklendi");

      await fetchLastUser();
      print("kullanıcı başarıyla çekildi ${user.value?.userID}");

    } catch (e) {
      print("kullanıcı eklenirken hata oluştu $e");
    }


  }


  Future<void> fetchUserById(int id) async {
    user.value = await _userDao.getUserById(id);
  }

  Future<void> fetchUserByUserID(String userID) async {
    try {
      print("user getiriliyor $userID");
      user.value = await _userDao.getUserByUserID(userID);
      print("kullanıcı getirildi ${user.value}");
      if (user.value != null) {
        print("hisseler getiriliyor");
        await fetchUserStocks(user.value!.userID);
        print("hisseler getirildi ${userStocks.value}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchLastUser() async {
    try {
      user.value = await _userDao.getLastUser();
      if (user.value != null) {
        fetchUserStocks(user.value!.userID);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addStockToUser(String userID, String symbol) async {
    final user = await _userDao.getUserByUserID(userID);
    print("User: $user symbol: $symbol");
    if (user != null) {
      await _userDao.addStockToUser(user.userID, symbol);
      await fetchUserStocks(userID);
    } else {
      throw Exception('User not found');
    }
  }
  Future<void> removeStockFromUser(String userID, String symbol) async {
    final user = await _userDao.getUserByUserID(userID);
    if (user != null) {
      await _userDao.removeStockFromUser(user.userID, symbol);
      await fetchUserStocks(userID); // Portföy güncellendiğinde yeniden getir
    } else {
      throw Exception('User not found');
    }
  }

  Future<void> fetchUserStocks(String userID) async {
    final user = await _userDao.getUserByUserID(userID);
    if (user != null) {
      userStocks.value = await _userDao.getUserStocks(user.userID);
      print("User Stocks: $userStocks");
    } else {
      throw Exception('User not found');
    }
  }
}
