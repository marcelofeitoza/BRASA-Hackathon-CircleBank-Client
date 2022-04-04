import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = [
    {
      "title": "Área pix",
      "route": "",
      "icon": SvgPicture.asset("assets/pix.svg"),
    },
    {
      "title": "Transferir e depositar",
      "route": "",
      "icon": SvgPicture.asset("assets/transfer.svg"),
    },
    {
      "title": "Financiamentos",
      "route": "/loans",
      "icon": SvgPicture.asset("assets/car.svg")
    },
    {
      "title": "Open Finance",
      "route": "/banking-settings",
      "icon": SvgPicture.asset("assets/dot.svg")
    },
    {
      "title": "Cartões",
      "route": "/cards",
      "icon": SvgPicture.asset("assets/credit_card.svg"),
    },
    {
      "title": "Empréstimos",
      "route": "/financing",
      "icon": SvgPicture.asset("assets/percent.svg"),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Color(0xff1C1C1C),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: SvgPicture.asset("assets/app-logo.svg"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text("Olá, Luiza!",
                            style: GoogleFonts.inter(
                                // fontWeight: FontWeight.w300,
                                fontSize: 22,
                                color: Colors.white,
                                decoration: TextDecoration.none)),
                        Text("Seja bem-vinda de volta :-)",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 22,
                                color: Colors.white,
                                decoration: TextDecoration.none))
                      ],
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff393A3E),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                            minimumSize: Size(80, 35),
                          ),
                          child: Text("ver extrato",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12))),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 300,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Card(
                              title: items[index]["title"],
                              icon: items[index]["icon"],
                              route: items[index]["route"]),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: (() => Navigator.pushNamed(context, "/balance")),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.maxFinite,
                  height: 120,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color(0xff393A3E),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Saldo de suas contas",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white,
                                  decoration: TextDecoration.none)),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("R\$8.729,12",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white,
                                      decoration: TextDecoration.none)),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 50,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  Card({
    Key? key,
    required this.title,
    required this.icon,
    this.route = "",
  }) : super(key: key);
  final String title;
  final Widget icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () => route.isEmpty ? null : Navigator.pushNamed(context, route),
        child: Container(
            // height: 130,
            // width: 130,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xff1C1C1C),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: icon,
                ),
                Text(
                  title,
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.none),
                )
              ],
            )),
      ),
    );
  }
}
