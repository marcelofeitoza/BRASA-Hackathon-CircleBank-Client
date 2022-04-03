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
    {"name": "btg pactual"},
    {"name": "nu pagamentos s.a."},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                label: Text(
                  "Voltar",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                ),
              )),
          // backgroundColor: Colors.black,
          backgroundColor: Colors.amber,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Saldo de suas contas",
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                Text(
                  "Gerencie suas configurações do sistema open-finance de uma maneira simples, transparente e rápida",
                  style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "aqui você pode editar e deletar todas as permissões de suas conexões open-banking",
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
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
                            title: banks[index]["name"],
                            editOnTap: () {},
                            deleteOnTap: () {});
                      }),
                  // children: [
                  //   ConfigCard(
                  //       title: "btg pactual",
                  //       editOnTap: () {},
                  //       deleteOnTap: () {}),
                  //   ConfigCard(
                  //       title: "nu pagamentos s.a.",
                  //       editOnTap: () {},
                  //       deleteOnTap: () {})
                  // ],
                  // ),
                )
              ],
            ),
          )),
    );
  }
}

class ConfigCard extends StatelessWidget {
  const ConfigCard({
    Key? key,
    required this.title,
    required this.editOnTap,
    required this.deleteOnTap,
  }) : super(key: key);
  final String title;
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
                  color: Colors.black, borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),
                  IconButton(
                    icon: Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 30,
                    ),
                    onPressed: editOnTap,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: deleteOnTap,
              icon: Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
    );
  }
}
