import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenBankingSettings extends StatefulWidget {
  const OpenBankingSettings({Key? key}) : super(key: key);

  @override
  State<OpenBankingSettings> createState() => _OpenBankingSettingsState();
}

class _OpenBankingSettingsState extends State<OpenBankingSettings> {
  List banks = [
    {"name": "btg pactual"},
    {"name": "nu pagamentos s.a."},
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
                Container(
                    height: 150,
                    width: 150,
                    child: SvgPicture.asset("assets/open-bank.svg")),
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
                            deleteOnTap: () {
                              _showConfirmExclusion();
                            });
                      }),
                )
              ],
            ),
          )),
    );
  }

  Future<void> _showConfirmExclusion() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: Text(
            'Você tem certeza que deseja excluir a conexão open-banking com a instituição btg pactual?',
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Não será mais possível acessar o saldo de sua conta diretamente pelo CBank, consultar históricos de pagamentos, cartões de crédito e muito mais.',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  child: Text('não',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white)),
                  style: TextButton.styleFrom(
                    fixedSize: Size(120, 50),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 10),
                TextButton(
                  child: Text('sim',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: Size(100, 50),
                      backgroundColor: Color(0xffAAAAAA)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
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
