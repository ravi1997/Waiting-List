import 'dart:convert';

import 'package:rpc_waiting_list/modal/login_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAccount {
  String account = 'account';

  Future<Account?> getAccount() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string
    String? accountJson = prefs.getString(account);

    // If the JSON string exists, decode it into a User object
    if (accountJson != null) {
      Map<String, dynamic> accountMap = jsonDecode(accountJson);
      return Account.fromJson(accountMap);
    }

    // Return null if no user data exists
    return null;
  }

  Future<void> writeAccount(Account accountObj) async {
    final prefs = await SharedPreferences.getInstance();
    String accountJson = jsonEncode(accountObj.toJson());

    await prefs.setString(account, accountJson);
  }

  Future<void> clearAccount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(account);
  }

//   final accessAccount = getAccount();
// // Use accessAccount in API requests or other operations
}
