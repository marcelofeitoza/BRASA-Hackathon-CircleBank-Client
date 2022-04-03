import 'package:accordion/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:accordion/accordion.dart';

class BankingSettings extends StatefulWidget {
  const BankingSettings({Key? key}) : super(key: key);

  @override
  State<BankingSettings> createState() => _BankingSettingsState();
}

class _BankingSettingsState extends State<BankingSettings> {
  List permissions = [
    {
      "name": "Dados de cadastro",
      "status": true,
      "details": [
        {"name": "Dados cadastrais", "status": false},
        {"name": "Informações complementares", "status": true}
      ]
    },
    {
      "name": "Dados da conta",
      "status": true,
      "details": [
        {"name": "Dados cadastrais", "status": false},
        {"name": "Informações complementares", "status": true}
      ]
    },
    {
      "name": "Dados de cartão de crédito",
      "status": true,
      "details": [
        {"name": "Dados cadastrais", "status": false},
        {"name": "Informações complementares", "status": true}
      ]
    },
    {
      "name": "Dados de operações de crédito",
      "status": true,
      "details": [
        {"name": "Dados cadastrais", "status": false},
        {"name": "Informações complementares", "status": true}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                label: Text(
                  "Voltar",
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 14),
                ),
              )),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 150,
                        width: 150,
                        child: SvgPicture.asset("assets/open-bank.svg")),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "btg pactual",
                      style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
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
                            "Para consultar suas informações financeiras de outros bancos por aqui e ter ofertas personalizadas de produtos e serviços, são necessários os dados abaixo:",
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
                AccordionItem(title: 'permissions[index]["name"]', status: true,
                    // status:true'permissions[index]["status"]',
                    content: []
                    // content: 'permissions[index]["details"])';
                    // Expanded(
                    //   child: ListView.builder(
                    //       physics: const BouncingScrollPhysics(),
                    //       itemCount: permissions.length,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return
                    //       }),
                    )
              ],
            ),
          )),
    );
  }
}

class AccordionItem extends StatelessWidget {
  const AccordionItem({
    Key? key,
    required this.title,
    required this.status,
    required this.content,
  }) : super(key: key);

  final String title;
  final bool status;
  final List<dynamic> content;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 2,
      children: [
        AccordionSection(
          isOpen: true,
          headerBackgroundColor: Colors.black,
          headerPadding: EdgeInsets.all(25),
          headerBorderRadius: 25,
          contentBorderColor: Colors.black,
          contentBackgroundColor: Colors.black,
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dados de cadastro",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
              ),
              CupertinoSwitch(
                  activeColor: Colors.white,
                  thumbColor: Colors.black,
                  value: true,
                  onChanged: (value) => print(value))
            ],
          ),
          contentVerticalPadding: 10,
          contentBorderRadius: 25,
          content: Column(
            children: [
              Container(
                height: 30,
                child: Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        value: true,
                        fillColor: MaterialStateProperty.all(Colors.white),
                        onChanged: (value) {
                          print(value);
                        }),
                    Text(
                      'Dados Cadastrais',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                child: Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        value: true,
                        fillColor: MaterialStateProperty.all(Colors.white),
                        onChanged: (value) {
                          print(value);
                        }),
                    Text(
                      'Informações complementares',
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
