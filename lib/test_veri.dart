import 'soru.dart';

class TestVeri {
  int _soruIndex = 0;

  final List<Soru> _soruBankasi = [
    Soru(
        soruMetni: "Titanic Gelmiş Geçmiş En büyük Gemidir.",
        soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki Tavuk Sayısı İnsan Sayısından Fazladır.",
        soruYaniti: true),
    Soru(soruMetni: "Kelebeklerin Ömrü 1 Gündür.", soruYaniti: true),
    Soru(soruMetni: "Dünya Düzdür", soruYaniti: false),
    Soru(
        soruMetni: "Kaju Fıstığı Aslında Bir Meyve Sapıdır.", soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet Hiç Patates Yememiştir.",
        soruYaniti: false)
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYantiti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  bool testBittimi() {
    if (_soruIndex >= _soruBankasi.length - 1) {
      return true;
    }
    return false;
  }

  void testiSifirla() {
    _soruIndex = 0;
  }
}
