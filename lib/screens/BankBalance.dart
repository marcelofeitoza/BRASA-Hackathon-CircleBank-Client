import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BankBalance extends StatefulWidget {
  const BankBalance({Key? key}) : super(key: key);

  @override
  State<BankBalance> createState() => _BankBalanceState();
}

class _BankBalanceState extends State<BankBalance> {
  List banks = [
    {
      "addNewBank": false,
      "bankIcon": "assets/app-logo.svg",
      "name": "cbank",
      "balance": "2.631,36",
      "selected": false
    },
    {
      "addNewBank": false,
      "bankIcon": "assets/logo-btg.svg",
      "name": "btg pactual",
      "balance": "2.631,36",
      "selected": true
    },
    {
      "addNewBank": true,
      "bankIcon": "",
      "name": "Adicionar novo banco",
      "balance": '',
      "selected": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color.fromARGB(255, 28, 28, 28),
          //   elevation: 0,
          //   leading: IconButton(
          //     onPressed: () => Navigator.pop(context),
          //     icon: const Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.white,
          //     ),
          //   ),
          //   title: Text(
          //     "Voltar",
          //     style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
          //   ),
          // ),
          backgroundColor: Color.fromARGB(255, 28, 28, 28),
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                  Text(
                    "Voltar",
                    style: GoogleFonts.inter(color: Colors.white),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 15, right: 15),
                    child: Text("Saldo de suas contas",
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "R\$8719,12",
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text("powered by OpenFinance",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.brightness_1,
                            size: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                              balance: banks[index]["balance"],
                              addNewBank: banks[index]["addNewBank"],
                              editOnTap: () {},
                              deleteOnTap: () {});
                        }),
                  ),
                ],
              ),
            ],
          )),
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
                      ? Colors.white30
                      : selected
                          ? Colors.white30
                          : Color.fromARGB(0, 255, 255, 255),
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
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),
                  TextButton(
                      onPressed: () => print("123456789"),
                      child: Text(balance.length != 0 ? "R\$" + balance : "",
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
