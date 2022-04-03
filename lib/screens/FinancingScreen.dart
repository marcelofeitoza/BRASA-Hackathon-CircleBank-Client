import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class FinancingScreen extends StatefulWidget {
  const FinancingScreen({Key? key}) : super(key: key);

  @override
  State<FinancingScreen> createState() => _FinancingScreenState();
}

class _FinancingScreenState extends State<FinancingScreen> {
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
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    const ContentText(
                        type: "Aquisição de veículos automotores",
                        value: "120.435,53",
                        code: "3528e870-9a85-4160",
                        instituition: "cbank",
                        image: "assets/app-logo.svg"),
                    SizedBox(
                      height: 40,
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Color(0xff62636A),
                          height: 150,
                          width: double.maxFinite,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            decoration: const BoxDecoration(
                                color: const Color(0xff393A3E),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40))),
                            child: const ContentText(
                                type: "Financiamento imobiliário",
                                value: "683.112,53",
                                code: "3528e870-9a85-4160",
                                instituition: "btg pactual",
                                image: "assets/btg-logo.svg"))
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        decoration: const BoxDecoration(
                            color: const Color(0xff62636A),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                        child: const ContentText(
                            type: "Financiamento imobiliário",
                            value: "434.862,12",
                            code: "3528e870-9a85-4160",
                            instituition: "btg pactual",
                            image: "assets/btg-logo.svg"))
                  ],
                ),
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

class ContentText extends StatelessWidget {
  const ContentText({
    Key? key,
    required this.type,
    required this.value,
    required this.code,
    required this.instituition,
    required this.image,
  }) : super(key: key);
  final String type;
  final String value;
  final String code;
  final String instituition;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: GoogleFonts.inter(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "R\$" + value,
                style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                code,
                style: GoogleFonts.inter(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text(
                instituition,
                style: GoogleFonts.inter(
                    color: Colors.white, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Container(width: 90, height: 90, child: SvgPicture.asset(image)),
        ],
      ),
    );
  }
}
