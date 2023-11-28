import 'package:cashir_app/model/data/transaction-history.model.dart';
import 'package:cashir_app/theme/color.dart';
import 'package:cashir_app/theme/sizes.dart';
import 'package:cashir_app/theme/text-styles.dart';
import 'package:cashir_app/viewmodels/usesr-view-model.dart';
import 'package:cashir_app/views/common/app-button.dart';
import 'package:cashir_app/views/common/height-spacer.dart';
import 'package:cashir_app/views/transaction-details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'common/width-spacer.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }

}

class DashboardState extends State<Dashboard> {
  Map<String, dynamic>? customFilter = {};

  bool hideStatus = false;

  @override
  Widget build(BuildContext context) {

    UserViewModel userViewModel = context.watch<UserViewModel>();

    // if(customFilter == null){
    //
    // }else{
    //   walletHistoryList.clear();
    //   if(customFilter!.isEmpty){
    //     walletHistoryList.addAll(walletTestData);
    //   }else{
    //     if(customFilter!['start_date'] == null && customFilter!['status'] == null){
    //       walletHistoryList.addAll(walletTestData);
    //     }else{
    //       List<TransactionHistoryModel> filterList = [];
    //       filterList.addAll(walletTestData);
    //       if(customFilter!['start_date'] != null){
    //
    //         filterList.retainWhere((element) =>
    //         (DateFormat("yyyy-MM-dd").parse(element.date).millisecondsSinceEpoch >= customFilter!['start_date']) && (DateFormat("yyyy-MM-dd").parse(element.date).millisecondsSinceEpoch <= customFilter!['end_date'])
    //         );
    //       }
    //       if(customFilter!['status'] != null){
    //         filterList.retainWhere((element) =>
    //         element.status.toLowerCase() == customFilter!['status']
    //         );
    //       }
    //       walletHistoryList.addAll(filterList);
    //     }
    //   }
    // }

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: userViewModel.details == null ?
                Center(
                  child: CircularProgressIndicator(),
                )
            : userViewModel.details?.data != null ? Column(
              children: [
                HeightSpacer(0.03),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Visibility(
                        visible: userViewModel.details != null,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Text(
                          '${userViewModel.details?.data?.firstName[0].toUpperCase() ?? 'L'}${userViewModel.details?.data?.lastName[0].toUpperCase() ?? 'S'}',
                          // 'GM',
                          style: bodyText2Style.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome, ${userViewModel.details!.data!.firstName}',
                                style: bodyText2Style.copyWith(fontWeight: FontWeight.w500, fontSize: ts4, color: Colors.black),
                              ),
                              Text(
                                'What do you want to do today?',
                                style: bodyText2Style.copyWith(fontSize: ts5, color: Colors.black),
                              )
                            ],
                          ),
                        )
                    ),
                    Icon(Icons.notifications_active_outlined, size: ts2,)
                  ],
                ),
                HeightSpacer(0.03),
                Card(
                  color: appPrimaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Account Balance',
                                    style: bodyText2Style.copyWith(color: Colors.white),
                                  ),
                                  HeightSpacer(0.005),
                                  Text(
                                    hideStatus ? '******' : '₦${userViewModel.details!.data!.accountBal}',
                                    style: bodyText2Style.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  hideStatus = !hideStatus;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: appPrimaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Icon( hideStatus ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 20, color: Colors.white),
                                      WidthSpacer(0.01),
                                      Text(
                                        hideStatus ? 'Show Balance' : 'Hide Balance',
                                        style: bodyText2Style.copyWith(fontWeight: FontWeight.w500, fontSize: ts5, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        HeightSpacer(0.03),
                        Text.rich(
                          textAlign: TextAlign.start,
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Virtual Account No: ',
                                  style: bodyText2Style.copyWith(color: Colors.white)
                              ),
                              TextSpan(
                                text: userViewModel.details!.data!.accNo,
                                style: bodyText2Style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),

                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                HeightSpacer(0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction History',
                      style: bodyText2Style.copyWith(fontWeight: FontWeight.bold, color: Colors.black),

                    ),
                    GestureDetector(
                        onTap: (){

                        },
                        child: Icon(Icons.filter_alt_outlined, color: appPrimaryColor, size: ts1,)
                    )
                  ],
                ),
                HeightSpacer(0.01),
                Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder:(context, index){
                          var transaction = userViewModel.details!.data!.transactions[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransactionsDetails(transactionHistoryModel: transaction,),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: transaction.type == "debit" ? Colors.grey.withOpacity(0.1) : Colors.red.withOpacity(0.1)
                                    ),
                                    child: SvgPicture.asset(
                                      transaction.type == "debit" ? 'assets/icons/arrow-in.svg' : 'assets/icons/arrow-out.svg',
                                      color: transaction.type == "debit" ? appPrimaryColor : Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              transaction.desc,
                                              style: bodyText2Style.copyWith(color: Colors.black),
                                            ),
                                            HeightSpacer(0.01),
                                            Text(
                                              transaction.date,
                                              style: bodyText2Style.copyWith(color: Colors.black),
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                  Text(
                                    '₦${transaction.amount}',
                                    style: bodyText2Style.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    )
                )
              ],
            ) : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (){
                        userViewModel.getDetailsFromServer();
                      },
                      child: Text(
                        'Retry'
                      )
                  ),
                  Text(
                    userViewModel.details?.error?.message ?? '',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )));
  }
}