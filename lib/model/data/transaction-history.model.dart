
class TransactionHistoryModel {
  int id;
  String date;
  String amount;
  String type;
  String desc;

  TransactionHistoryModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.type,
    required this.desc,
  });

  Map toJson() {
    return {
      "id": id,
      'date': date,
      'amount': amount,
      'type': type,
      'desc': desc,
    };
  }

  factory TransactionHistoryModel.fromJson(Map<dynamic, dynamic> json) {
    return TransactionHistoryModel(
      id: json['id'],
      date: json['date'],
      amount: json['amount'],
      type: json['type'],
      desc: json['desc'],
    );
  }

}
