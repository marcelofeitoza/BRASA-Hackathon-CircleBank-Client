import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BankCards extends StatefulWidget {
  const BankCards({Key? key}) : super(key: key);

  @override
  State<BankCards> createState() => _BankCardsState();
}

class _BankCardsState extends State<BankCards> {
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
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Color(0xff393A3E),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Saldo de crédito \nrestante",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "R\$8.729,12",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "cbank",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "american express",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "•••• •••• •••• 2234",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xff393A3E),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child:
                                      SvgPicture.asset("assets/btg-logo.svg"),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "btg pactual",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                            Text(
                              "R\$2.631,36",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton.icon(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff393A3E),
                            fixedSize: Size(double.maxFinite, 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onPressed: () {},
                        label: Text(
                          "adicionar novo cartão",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
                  SizedBox(
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
