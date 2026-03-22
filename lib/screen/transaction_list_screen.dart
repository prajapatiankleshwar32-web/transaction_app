import 'package:flutter/material.dart';
import 'package:transaction_app/helper/bottom_sheet_screen.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  final List<Map<String, dynamic>> todayTransactionsList = [
    {
      'title': 'Spotify',
      'subtitle': 'Subscription',
      'amounttype': '-CHF 350',
      'accounttype': 'UBS Account',
      'ontap': () {},
      'image': 'assets/images/spotify.png',
    },
    {
      'title': 'Clickup',
      'subtitle': 'Subscription',
      'amounttype': '-CHF 900',
      'accounttype': 'Vantable Account',
      'image': 'assets/images/exit.png',
    },
    {
      'title': 'Cleint Sarl',
      'subtitle': 'Transfer',
      'amounttype': '+CHF 3,800',
      'accounttype': 'UBS Account',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'All Transactions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Today',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: MediaQuery.removePadding(
                  removeBottom: true,
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: todayTransactionsList.length,
                    itemBuilder: (context, index) {
                      // final transaction = todayTransactions[index];
                      return today(
                        title: todayTransactionsList[index]['title'] as String,
                        subtitle:
                            todayTransactionsList[index]['subtitle'] as String,
                        amounttype:
                            todayTransactionsList[index]['amounttype']
                                as String,
                        accounttype:
                            todayTransactionsList[index]['accounttype']
                                as String,
                        ontap: () {
                          showMyBottomSheet(context);
                        },
                        image:
                            todayTransactionsList[index]['image'] ??
                            'assets/images/spotify.png',
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '23 July 2022',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: MediaQuery.removePadding(
                  removeBottom: true,
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: todayTransactionsList.length,
                    itemBuilder: (context, index) {
                      // final transaction = todayTransactions[index];
                      return today(
                        title: todayTransactionsList[index]['title'] as String,
                        subtitle:
                            todayTransactionsList[index]['subtitle'] as String,
                        amounttype:
                            todayTransactionsList[index]['amounttype']
                                as String,
                        accounttype:
                            todayTransactionsList[index]['accounttype']
                                as String,
                        ontap: () {
                          showMyBottomSheet(context);
                        },
                        image:
                            todayTransactionsList[index]['image'] ??
                            'assets/images/spotify.png',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BottomSheetScreen();
      },
    );
  }

  Column today({
    required String title,
    required String subtitle,
    required String amounttype,
    required String accounttype,
    required Function ontap,
    required String image,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: () => ontap(),
          leading: CircleAvatar(
            child: Image.asset(
              image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              //backgroundImage: AssetImage(AssetHelper.avatar1),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(subtitle),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amounttype,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: amounttype.contains("+")
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  Text(
                    accounttype,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
        Divider(height: 1, thickness: 0.5),
      ],
    );
  }
}
