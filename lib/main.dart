import 'package:bilgi_test_app/test_veri.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(const BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: const SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({Key? key}) : super(key: key);

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri testVeri1 = TestVeri();
  void buttonFonksiyonu(bool durum) {
    if (testVeri1.testBittimi() == true) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Test Bitti!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Bravo Testi Bitirdiniz 💪'),
                  Text('Tekrar Çözmek İster misiniz?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Başa Dön'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    testVeri1.testiSifirla();
                    secimler = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        testVeri1.getSoruYantiti() == durum
            ? secimler.add(kDogruIconu)
            : secimler.add(kYanlisIconu);
        testVeri1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                testVeri1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 3,
          runSpacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: const Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            buttonFonksiyonu(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: const Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            buttonFonksiyonu(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
