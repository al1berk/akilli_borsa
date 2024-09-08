import 'package:akilli_borsa/Model/product.dart';
import 'package:akilli_borsa/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  var userTools = <String>[].obs;
  var userToolsName = <String>[].obs;
  Products products = Products();

  Future<void> addUser( UserModel user ) async {
    await db.collection("Users").doc(user.userID).set(user.toMap());
  }
  Future<void> addToolWithUserId(String userId, String toolName) async {
    try {
      await db.collection("Users").doc(userId).update({
        "tools": FieldValue.arrayUnion([toolName])
      });
      print("Tool successfully added.");
    } catch (e) {
      print("Failed to add tool: $e");
    }
  }


  Future<void> removeToolWithUserId(String userId, String toolName) async {
    await db.collection("Users").doc(userId).update({
      "tools": FieldValue.arrayRemove([toolName])
    });
  }

  Future<void> getUserTools(String userId) async {
    final user = await db.collection("Users").doc(userId).get();
    userTools.value = List<String>.from(user.data()!['tools']);
    userToolsName.value = products.productNames(userTools);
  }


}
