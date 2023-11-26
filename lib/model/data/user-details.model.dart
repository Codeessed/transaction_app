
import 'package:cashir_app/model/data/transaction-history.model.dart';

class UserDetailsModel {
  String firstName;
  String lastName;
  String accountBal;
  String accNo;
  List<TransactionHistoryModel> transactions;

  UserDetailsModel({
    required this.firstName,
    required this.lastName,
    required this.accountBal,
    required this.accNo,
    required this.transactions,
  });

  Map toJson() {
    return {
      "first_name": firstName,
      'last_name': lastName,
      'account_balance': accountBal,
      'virtual_acct_no': accNo,
      'transaction': transactions,
    };
  }

  factory UserDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return UserDetailsModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      accountBal: json['account_balance'],
      accNo: json['virtual_acct_no'],
      transactions: (json['transaction'] as List).map((e) => TransactionHistoryModel.fromJson(e)).toList(),
    );
  }

}
