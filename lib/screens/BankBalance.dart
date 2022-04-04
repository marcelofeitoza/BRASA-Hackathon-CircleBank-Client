import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BankBalance extends StatefulWidget {
  const BankBalance({Key? key}) : super(key: key);

  @override
  State<BankBalance> createState() => _BankBalanceState();
}

// class _BankBalanceState extends State<BankBalance> {
class _BankBalanceState extends State<BankBalance> {
  List banks = [
    {
      "addNewBank": false,
      "bankIcon": "assets/app-logo.svg",
      "name": "CBank",
      "balance": 2631.36,
      "selected": false
    },
    {
      "addNewBank": false,
      "bankIcon": "assets/logo-btg.svg",
      "name": "BTG Pactual",
      "balance": 2631.36,
      "selected": true
    },
    {
      "addNewBank": true,
      "bankIcon": "",
      "name": "Adicionar novo banco",
      "balance": 0.00,
      "selected": false
    }
  ];

  double totalBalance = 0.0;

  @override
  void _updateTotalBalance() {
    var arrayLength = banks.length;

    for (var i = 0; i < arrayLength; i++) {
      totalBalance += banks[i]['balance'];
    }

    // print(banks[0]['balance']);
  }

  @override
  void initState() {
    super.initState();
    _updateTotalBalance(); //running initialisation code; getting prefs etc.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: ExpandableBottomSheet(
          enableToggle: true,
          animationCurveExpand: Curves.decelerate,
          background: Container(
            color: Colors.black,
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Color(0xff1c1c1c),
                    elevation: 0,
                    title: TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Voltar",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 14),
                      ),
                    )),
                backgroundColor: Color.fromARGB(255, 28, 28, 28),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Saldo de suas contas",
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                          Text(
                            "R\$ " + totalBalance.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text("powered by OpenFinance",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: banks.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ConfigCard(
                                  bankIcon: banks[index]["bankIcon"],
                                  title: banks[index]["name"],
                                  selected: banks[index]["selected"],
                                  balance: banks[index]["balance"].toString(),
                                  addNewBank: banks[index]["addNewBank"],
                                  editOnTap: () {},
                                  deleteOnTap: () {});
                            }),
                      ),
                    ],
                  ),
                )),
          ),
          persistentHeader: Container(
            color: Colors.transparent,
            height: 100,
            width: double.maxFinite,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  Container(
                    width: 48,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Color(0xff1C1C1C),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    height: 85,
                    width: 100,
                    child: SvgPicture.asset("assets/open-bank.svg"),
                  ),
                ],
              ),
            ),
          ),
          expandableContent: Container(
            height: 500,
            // color: Colors.green,
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "O open-finance permite a existência dessa facilidade na medida que:",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "• permite o compartilhamento de dados entre diferentes instituições financeiras, contribuindo para uma melhor gestão do dinheiro por parte de seus usuários",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Para fornecer esses dados, foram utilizadas as seguintes permissões do open-banking:",
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "• acesso a históricos de financiamentos e a linhas de créditos",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.maxFinite, 80),
                          primary: Color(0xff393A3E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "aprender mais",
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 24),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 40,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        )),
      ),
    );
  }
}

class ConfigCard extends StatelessWidget {
  bool selected = false;

  ConfigCard(
      {Key? key,
      required this.title,
      required this.editOnTap,
      required this.deleteOnTap,
      required this.selected,
      required this.balance,
      required this.bankIcon,
      required this.addNewBank})
      : super(key: key);
  final String title;
  final String balance;
  final bankIcon;
  final bool addNewBank;
  final VoidCallback editOnTap;
  final VoidCallback deleteOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: 80,
              decoration: BoxDecoration(
                  color: addNewBank
                      ? Color(0xff393a3e)
                      : selected
                          ? Color(0xff393A3E)
                          : Color.fromARGB(0, 0, 0, 0),
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => print("Add new cardz"),
                      icon: addNewBank
                          ? Icon(
                              Icons.add,
                              color: Colors.white,
                            )
                          : Container(
                              child: SvgPicture.asset(bankIcon),
                              width: 75,
                              height: 75,
                            )),
                  Text(title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white)),
                  TextButton(
                      onPressed: () => print("123456789"),
                      child: Text(addNewBank ? "" : "R\$ " + balance,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
