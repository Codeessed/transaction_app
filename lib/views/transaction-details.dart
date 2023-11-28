import 'package:cashir_app/model/data/transaction-history.model.dart';
import 'package:cashir_app/theme/color.dart';
import 'package:cashir_app/theme/text-styles.dart';
import 'package:cashir_app/views/common/height-spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsDetails extends StatelessWidget{

  final TransactionHistoryModel transactionHistoryModel;
  const TransactionsDetails({super.key, required this.transactionHistoryModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                HeightSpacer(0.03),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.arrow_back_outlined, color: Colors.black,)
                      ),
                    ),
                    Text(
                      'Transaction Details',
                      style: headerText3Style.copyWith(color: Colors.black),
                    )
                  ],
                ),
                HeightSpacer(0.05),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appPrimaryColor.withOpacity(0.05)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    "Id:",
                                    style: bodyText2Style.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                                  )
                              ),
                              Text(
                                  transactionHistoryModel.id.toString()
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    "Description:",
                                    style: bodyText2Style.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                                  )
                              ),
                              Text(
                                  transactionHistoryModel.desc
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    "Type:",
                                    style: bodyText2Style.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                                  )
                              ),
                              Text(
                                  transactionHistoryModel.type
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    "Amount:",
                                    style: bodyText2Style.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                                  )
                              ),
                              Text(
                                  "₦${transactionHistoryModel.amount}"
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    "Date:",
                                    style: bodyText2Style.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                                  )
                              ),
                              Text(
                                  transactionHistoryModel.date
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}