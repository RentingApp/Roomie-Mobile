import '../services/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math';

class DummyDataInit extends StatefulWidget {
  const DummyDataInit({Key? key}) : super(key: key);

  @override
  State<DummyDataInit> createState() => _DummyDataInitState();
}

class _DummyDataInitState extends State<DummyDataInit> {
  Future<void> readJson() async {
    Random random = new Random();
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as List;
    var vsl = [
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:09.413",
        "updateDate": "2022-10-08T01:18:09.413",
        "advertId": 158,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Şanlıurfa",
        "district": "Bozova",
        "neighbourhood": "Uzunburç",
        "rooms": "1.1",
        "price": 220.00,
        "floorArea": "65"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:08.55",
        "updateDate": "2022-10-08T01:18:08.55",
        "advertId": 157,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Tunceli",
        "district": "Pertek",
        "neighbourhood": "Korluca Köyü",
        "rooms": "4.1",
        "price": 220.00,
        "floorArea": "75"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:32.5",
        "updateDate": "2022-10-08T00:51:32.5",
        "advertId": 101,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Aksaray",
        "district": "Gülağaç",
        "neighbourhood": "Atatürk",
        "rooms": "1.1",
        "price": 220.00,
        "floorArea": "95"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:21.553",
        "updateDate": "2022-10-08T00:51:21.553",
        "advertId": 95,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kilis",
        "district": "Merkez",
        "neighbourhood": "Deliçay Köyü",
        "rooms": "2.1",
        "price": 220.00,
        "floorArea": "55"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:53.48",
        "updateDate": "2022-10-08T01:17:53.48",
        "advertId": 142,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kastamonu",
        "district": "Tosya",
        "neighbourhood": "Hacı Kemal",
        "rooms": "4.1",
        "price": 350.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:26.61",
        "updateDate": "2022-10-08T01:17:26.61",
        "advertId": 135,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kayseri",
        "district": "Özvatan",
        "neighbourhood": "Tuğlaşah",
        "rooms": "1.1",
        "price": 350.00,
        "floorArea": "75"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:22.96",
        "updateDate": "2022-10-08T01:17:22.96",
        "advertId": 130,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Adana",
        "district": "Kozan",
        "neighbourhood": "Karahamzalı",
        "rooms": "3.1",
        "price": 350.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:18.06",
        "updateDate": "2022-10-08T01:17:18.06",
        "advertId": 125,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Şanlıurfa",
        "district": "Suruç",
        "neighbourhood": "Yalınca",
        "rooms": "4.1",
        "price": 350.00,
        "floorArea": "80"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:46.187",
        "updateDate": "2022-10-08T00:51:46.187",
        "advertId": 112,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kahramanmaraş",
        "district": "Elbistan",
        "neighbourhood": "Tapkırankale",
        "rooms": "2.1",
        "price": 350.00,
        "floorArea": "105"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:29.307",
        "updateDate": "2022-10-08T00:51:29.307",
        "advertId": 99,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Sakarya",
        "district": "Arifiye",
        "neighbourhood": "Hanlı Sakarya",
        "rooms": "1.1",
        "price": 350.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:28.663",
        "updateDate": "2022-10-08T00:51:28.663",
        "advertId": 98,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Sinop",
        "district": "Gerze",
        "neighbourhood": "Bolalı Köyü",
        "rooms": "2.0",
        "price": 350.00,
        "floorArea": "70"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:49:58.89",
        "updateDate": "2022-10-08T00:49:58.89",
        "advertId": 80,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Erzurum",
        "district": "Hınıs",
        "neighbourhood": "Ovaçevirme",
        "rooms": "2.0",
        "price": 350.00,
        "floorArea": "95"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:28.68",
        "updateDate": "2022-10-08T01:18:28.68",
        "advertId": 162,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Balıkesir",
        "district": "Altıeylül",
        "neighbourhood": "Küçükbostancı",
        "rooms": "1.1",
        "price": 375.00,
        "floorArea": "90"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:16.67",
        "updateDate": "2022-10-08T01:17:16.67",
        "advertId": 123,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kocaeli",
        "district": "Çayırova",
        "neighbourhood": "Cumhuriyet",
        "rooms": "2.0",
        "price": 375.00,
        "floorArea": "65"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:16.157",
        "updateDate": "2022-10-08T00:51:16.157",
        "advertId": 92,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kocaeli",
        "district": "Dilovası",
        "neighbourhood": "Çerkeşli",
        "rooms": "3.1",
        "price": 375.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:01.437",
        "updateDate": "2022-10-08T01:18:01.437",
        "advertId": 151,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bursa",
        "district": "Büyükorhan",
        "neighbourhood": "Hacıahmetler",
        "rooms": "3.1",
        "price": 400.00,
        "floorArea": "80"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:44.66",
        "updateDate": "2022-10-08T00:51:44.66",
        "advertId": 110,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Trabzon",
        "district": "Ortahisar",
        "neighbourhood": "Kurtuluş",
        "rooms": "2.0",
        "price": 400.00,
        "floorArea": "85"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:34.573",
        "updateDate": "2022-10-08T00:51:34.573",
        "advertId": 104,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Tunceli",
        "district": "Mazgirt",
        "neighbourhood": "Yukarıoyumca Köyü",
        "rooms": "4.1",
        "price": 400.00,
        "floorArea": "145"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:19.653",
        "updateDate": "2022-10-08T00:51:19.653",
        "advertId": 94,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bingöl",
        "district": "Merkez",
        "neighbourhood": "Balpınar Köyü",
        "rooms": "4.1",
        "price": 400.00,
        "floorArea": "80"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:31.603",
        "updateDate": "2022-10-08T01:18:31.603",
        "advertId": 167,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Diyarbakır",
        "district": "Kulp",
        "neighbourhood": "İnkaya",
        "rooms": "1.1",
        "price": 450.00,
        "floorArea": "65"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:17.313",
        "updateDate": "2022-10-08T01:17:17.313",
        "advertId": 124,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Balıkesir",
        "district": "Balya",
        "neighbourhood": "Çakallar",
        "rooms": "3.1",
        "price": 450.00,
        "floorArea": "110"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:42.637",
        "updateDate": "2022-10-08T00:51:42.637",
        "advertId": 109,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Uşak",
        "district": "Karahallı",
        "neighbourhood": "Karayakuplu Köyü",
        "rooms": "2.0",
        "price": 450.00,
        "floorArea": "120"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:59.49",
        "updateDate": "2022-10-08T01:17:59.49",
        "advertId": 148,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Konya",
        "district": "Karapınar",
        "neighbourhood": "Hasanoba",
        "rooms": "4.1",
        "price": 460.00,
        "floorArea": "60"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:49.623",
        "updateDate": "2022-10-08T00:51:49.623",
        "advertId": 116,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kahramanmaraş",
        "district": "Onikişubat",
        "neighbourhood": "Cüceli",
        "rooms": "3.1",
        "price": 460.00,
        "floorArea": "75"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:33.407",
        "updateDate": "2022-10-08T00:51:33.407",
        "advertId": 102,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Şırnak",
        "district": "Uludere",
        "neighbourhood": "Uzungeçit Bld.",
        "rooms": "1.1",
        "price": 460.00,
        "floorArea": "140"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:47.61",
        "updateDate": "2022-10-08T00:51:47.61",
        "advertId": 114,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Siirt",
        "district": "Merkez",
        "neighbourhood": "Akdoğmuş Köyü",
        "rooms": "2.1",
        "price": 470.00,
        "floorArea": "85"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:01.6",
        "updateDate": "2022-10-08T00:50:01.6",
        "advertId": 84,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Batman",
        "district": "Merkez",
        "neighbourhood": "Güneşli Köyü",
        "rooms": "4.1",
        "price": 470.00,
        "floorArea": "140"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:17.943",
        "updateDate": "2022-10-08T00:51:17.943",
        "advertId": 93,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Aksaray",
        "district": "Eskil",
        "neighbourhood": "Başaran Köyü",
        "rooms": "3.1",
        "price": 515.00,
        "floorArea": "95"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:31.59",
        "updateDate": "2022-10-08T00:51:31.59",
        "advertId": 100,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kırklareli",
        "district": "Pınarhisar",
        "neighbourhood": "Kurudere Köyü",
        "rooms": "1.1",
        "price": 645.00,
        "floorArea": "120"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:27.997",
        "updateDate": "2022-10-08T00:51:27.997",
        "advertId": 97,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bilecik",
        "district": "İnhisar",
        "neighbourhood": "Akkum",
        "rooms": "3.1",
        "price": 645.00,
        "floorArea": "85"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:02.727",
        "updateDate": "2022-10-08T00:50:02.727",
        "advertId": 86,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Gümüşhane",
        "district": "Şiran",
        "neighbourhood": "Yolbilen Köyü",
        "rooms": "2.0",
        "price": 645.00,
        "floorArea": "120"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:27.537",
        "updateDate": "2022-10-08T01:18:27.537",
        "advertId": 160,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Artvin",
        "district": "Borçka",
        "neighbourhood": "İbrikli Köyü",
        "rooms": "2.1",
        "price": 650.00,
        "floorArea": "145"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:07.977",
        "updateDate": "2022-10-08T01:18:07.977",
        "advertId": 156,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Gümüşhane",
        "district": "Kelkit",
        "neighbourhood": "Bulak Köyü",
        "rooms": "3.1",
        "price": 650.00,
        "floorArea": "55"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:06.027",
        "updateDate": "2022-10-08T01:18:06.027",
        "advertId": 155,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Adıyaman",
        "district": "Sincik",
        "neighbourhood": "Çamdere Köyü",
        "rooms": "2.0",
        "price": 650.00,
        "floorArea": "65"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:54.053",
        "updateDate": "2022-10-08T01:17:54.053",
        "advertId": 143,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kastamonu",
        "district": "Seydiler",
        "neighbourhood": "Çiğilerik Köyü",
        "rooms": "4.1",
        "price": 650.00,
        "floorArea": "140"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:48.42",
        "updateDate": "2022-10-08T00:51:48.42",
        "advertId": 115,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Konya",
        "district": "Altınekin",
        "neighbourhood": "Hacınuman",
        "rooms": "3.1",
        "price": 650.00,
        "floorArea": "60"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:46.857",
        "updateDate": "2022-10-08T00:51:46.857",
        "advertId": 113,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kayseri",
        "district": "Hacılar",
        "neighbourhood": "Orta",
        "rooms": "5.1",
        "price": 720.00,
        "floorArea": "60"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:00.983",
        "updateDate": "2022-10-08T00:50:00.983",
        "advertId": 83,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Ankara",
        "district": "Altındağ",
        "neighbourhood": "Başpınar",
        "rooms": "2.1",
        "price": 720.00,
        "floorArea": "55"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:49:59.857",
        "updateDate": "2022-10-08T00:49:59.857",
        "advertId": 81,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "İzmir",
        "district": "Menderes",
        "neighbourhood": "Hürriyet",
        "rooms": "5.1",
        "price": 720.00,
        "floorArea": "145"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:34.577",
        "updateDate": "2022-10-08T01:18:34.577",
        "advertId": 171,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bartın",
        "district": "Merkez",
        "neighbourhood": "Hasankadı Bld.",
        "rooms": "2.0",
        "price": 770.00,
        "floorArea": "120"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:29.857",
        "updateDate": "2022-10-08T01:18:29.857",
        "advertId": 164,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Amasya",
        "district": "Suluova",
        "neighbourhood": "Hacıbayram",
        "rooms": "2.0",
        "price": 770.00,
        "floorArea": "110"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:48.683",
        "updateDate": "2022-10-08T01:17:48.683",
        "advertId": 137,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Isparta",
        "district": "Merkez",
        "neighbourhood": "Yedişehitler",
        "rooms": "2.0",
        "price": 770.00,
        "floorArea": "55"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:15.643",
        "updateDate": "2022-10-08T01:17:15.643",
        "advertId": 122,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Samsun",
        "district": "Terme",
        "neighbourhood": "Kesikkaya",
        "rooms": "2.1",
        "price": 770.00,
        "floorArea": "120"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:52.937",
        "updateDate": "2022-10-08T00:51:52.937",
        "advertId": 120,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Amasya",
        "district": "Gümüşhacıköy",
        "neighbourhood": "Korkut Köyü",
        "rooms": "4.1",
        "price": 770.00,
        "floorArea": "105"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-07T15:23:30.143",
        "updateDate": "2022-10-07T15:33:54.157",
        "advertId": 78,
        "title": "Çok uygun fiyata Sarıyer'de.",
        "content":
            "Sigara içilmiyor, kalorifer ısıtmalı, deniz kenarnda konumlanmış.",
        "city": "İstanbul",
        "district": "Sarıyer",
        "neighbourhood": "Mehmet Akif",
        "rooms": "3.1",
        "price": 780.00,
        "floorArea": "75"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:45.367",
        "updateDate": "2022-10-08T00:51:45.367",
        "advertId": 111,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Artvin",
        "district": "Merkez",
        "neighbourhood": "Zeytinlik Köyü",
        "rooms": "5.1",
        "price": 800.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:00.803",
        "updateDate": "2022-10-08T01:18:00.803",
        "advertId": 150,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kars",
        "district": "Digor",
        "neighbourhood": "Dağpınar Bld.",
        "rooms": "4.1",
        "price": 840.00,
        "floorArea": "70"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:32.853",
        "updateDate": "2022-10-08T01:18:32.853",
        "advertId": 169,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Van",
        "district": "Gürpınar",
        "neighbourhood": "Kırkgeçit",
        "rooms": "4.1",
        "price": 860.00,
        "floorArea": "105"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:05.42",
        "updateDate": "2022-10-08T01:18:05.42",
        "advertId": 154,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Çorum",
        "district": "Kargı",
        "neighbourhood": "Alioğlu Köyü",
        "rooms": "1.1",
        "price": 890.00,
        "floorArea": "95"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:00.25",
        "updateDate": "2022-10-08T01:18:00.25",
        "advertId": 149,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kocaeli",
        "district": "Çayırova",
        "neighbourhood": "Atatürk",
        "rooms": "3.1",
        "price": 890.00,
        "floorArea": "105"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:33.633",
        "updateDate": "2022-10-08T00:50:33.633",
        "advertId": 90,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Konya",
        "district": "Altınekin",
        "neighbourhood": "Yeniyayla",
        "rooms": "1.1",
        "price": 890.00,
        "floorArea": "90"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:57.387",
        "updateDate": "2022-10-08T01:17:57.387",
        "advertId": 145,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kırıkkale",
        "district": "Yahşihan",
        "neighbourhood": "Bayraktepe",
        "rooms": "5.1",
        "price": 920.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:35.22",
        "updateDate": "2022-10-08T01:18:35.22",
        "advertId": 172,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Elazığ",
        "district": "Sivrice",
        "neighbourhood": "Üçlerce Köyü",
        "rooms": "4.1",
        "price": 950.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:49.913",
        "updateDate": "2022-10-08T01:17:49.913",
        "advertId": 139,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bingöl",
        "district": "Karlıova",
        "neighbourhood": "Halifan Köyü",
        "rooms": "4.1",
        "price": 950.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:52.4",
        "updateDate": "2022-10-08T00:51:52.4",
        "advertId": 119,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kütahya",
        "district": "Altıntaş",
        "neighbourhood": "Osmaniye Köyü",
        "rooms": "2.0",
        "price": 950.00,
        "floorArea": "75"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:34",
        "updateDate": "2022-10-08T00:51:34",
        "advertId": 103,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Ankara",
        "district": "Haymana",
        "neighbourhood": "Yergömü",
        "rooms": "3.1",
        "price": 950.00,
        "floorArea": "45"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:49:57.563",
        "updateDate": "2022-10-08T00:49:57.563",
        "advertId": 79,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Malatya",
        "district": "Pütürge",
        "neighbourhood": "Bakımlı",
        "rooms": "4.1",
        "price": 950.00,
        "floorArea": "90"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:27.95",
        "updateDate": "2022-10-08T01:18:27.95",
        "advertId": 161,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kırıkkale",
        "district": "Karakeçili",
        "neighbourhood": "Kurtuluş",
        "rooms": "4.1",
        "price": 985.00,
        "floorArea": "75"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:27.38",
        "updateDate": "2022-10-08T00:51:27.38",
        "advertId": 96,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Şanlıurfa",
        "district": "Akçakale",
        "neighbourhood": "Uğurtaş",
        "rooms": "1.1",
        "price": 985.00,
        "floorArea": "85"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:33.733",
        "updateDate": "2022-10-08T01:18:33.733",
        "advertId": 170,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Çanakkale",
        "district": "Çan",
        "neighbourhood": "Etili Köyü",
        "rooms": "5.1",
        "price": 990.00,
        "floorArea": "145"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:54.627",
        "updateDate": "2022-10-08T01:17:54.627",
        "advertId": 144,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Muş",
        "district": "Bulanık",
        "neighbourhood": "Köprüyolu Köyü",
        "rooms": "2.1",
        "price": 990.00,
        "floorArea": "80"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:24.17",
        "updateDate": "2022-10-08T01:17:24.17",
        "advertId": 132,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kocaeli",
        "district": "Çayırova",
        "neighbourhood": "Gebze OSB 2",
        "rooms": "4.1",
        "price": 990.00,
        "floorArea": "95"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:33.187",
        "updateDate": "2022-10-08T00:50:33.187",
        "advertId": 89,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Tunceli",
        "district": "Nazımiye",
        "neighbourhood": "Ayranlı Köyü",
        "rooms": "2.0",
        "price": 990.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:58.76",
        "updateDate": "2022-10-08T01:17:58.76",
        "advertId": 147,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kırıkkale",
        "district": "Merkez",
        "neighbourhood": "Ovacık",
        "rooms": "2.0",
        "price": 1000.00,
        "floorArea": "65"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:29.277",
        "updateDate": "2022-10-08T01:18:29.277",
        "advertId": 163,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kahramanmaraş",
        "district": "Onikişubat",
        "neighbourhood": "Maksutlu",
        "rooms": "2.1",
        "price": 1110.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:26.82",
        "updateDate": "2022-10-08T01:18:26.82",
        "advertId": 159,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Adana",
        "district": "Karataş",
        "neighbourhood": "Gölkaya",
        "rooms": "2.0",
        "price": 1110.00,
        "floorArea": "95"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:20.607",
        "updateDate": "2022-10-08T01:17:20.607",
        "advertId": 128,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Osmaniye",
        "district": "Düziçi",
        "neighbourhood": "Yeşildere Köyü",
        "rooms": "4.1",
        "price": 1110.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:02.21",
        "updateDate": "2022-10-08T00:50:02.21",
        "advertId": 85,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Artvin",
        "district": "Murgul",
        "neighbourhood": "Küre Köyü",
        "rooms": "1.1",
        "price": 1110.00,
        "floorArea": "110"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:03.63",
        "updateDate": "2022-10-08T01:18:03.63",
        "advertId": 152,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Çanakkale",
        "district": "Ayvacık",
        "neighbourhood": "Çakmaklar Köyü",
        "rooms": "2.1",
        "price": 1220.00,
        "floorArea": "65"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:34.61",
        "updateDate": "2022-10-08T00:50:34.61",
        "advertId": 91,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Şanlıurfa",
        "district": "Halfeti",
        "neighbourhood": "Gözeli",
        "rooms": "2.1",
        "price": 1220.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:21.447",
        "updateDate": "2022-10-08T01:17:21.447",
        "advertId": 129,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Niğde",
        "district": "Çiftlik",
        "neighbourhood": "Azatlı Bld.",
        "rooms": "4.1",
        "price": 1450.00,
        "floorArea": "45"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:00.417",
        "updateDate": "2022-10-08T00:50:00.417",
        "advertId": 82,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Burdur",
        "district": "Altınyayla",
        "neighbourhood": "Heybeli",
        "rooms": "2.1",
        "price": 1530.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:32.253",
        "updateDate": "2022-10-08T01:18:32.253",
        "advertId": 168,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bursa",
        "district": "Mustafakemalpaşa",
        "neighbourhood": "Şeyhmüftü",
        "rooms": "4.1",
        "price": 1620.00,
        "floorArea": "80"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:18.703",
        "updateDate": "2022-10-08T01:17:18.703",
        "advertId": 126,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Osmaniye",
        "district": "Kadirli",
        "neighbourhood": "Sarıtanışmanlı Köyü",
        "rooms": "5.1",
        "price": 1620.00,
        "floorArea": "80"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:30.973",
        "updateDate": "2022-10-08T01:18:30.973",
        "advertId": 166,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kırşehir",
        "district": "Boztepe",
        "neighbourhood": "Orta",
        "rooms": "5.1",
        "price": 1650.00,
        "floorArea": "90"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:57.983",
        "updateDate": "2022-10-08T01:17:57.983",
        "advertId": 146,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Gaziantep",
        "district": "Oğuzeli",
        "neighbourhood": "Taşyazı",
        "rooms": "5.1",
        "price": 1650.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:25.81",
        "updateDate": "2022-10-08T01:17:25.81",
        "advertId": 134,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Karabük",
        "district": "Eskipazar",
        "neighbourhood": "Sallar Köyü",
        "rooms": "3.1",
        "price": 1650.00,
        "floorArea": "65"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:50.61",
        "updateDate": "2022-10-08T00:51:50.61",
        "advertId": 117,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Batman",
        "district": "Kozluk",
        "neighbourhood": "Çayönü Köyü",
        "rooms": "3.1",
        "price": 1650.00,
        "floorArea": "70"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:24.96",
        "updateDate": "2022-10-08T01:17:24.96",
        "advertId": 133,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Afyonkarahisar",
        "district": "Sandıklı",
        "neighbourhood": "Sazak",
        "rooms": "1.1",
        "price": 1950.00,
        "floorArea": "90"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:37.567",
        "updateDate": "2022-10-08T00:51:37.567",
        "advertId": 106,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Gümüşhane",
        "district": "Köse",
        "neighbourhood": "Cumhuriyet",
        "rooms": "3.1",
        "price": 1950.00,
        "floorArea": "105"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:27.333",
        "updateDate": "2022-10-08T01:17:27.333",
        "advertId": 136,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Hatay",
        "district": "İskenderun",
        "neighbourhood": "Çay",
        "rooms": "2.0",
        "price": 2250.00,
        "floorArea": "140"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:20.007",
        "updateDate": "2022-10-08T01:17:20.007",
        "advertId": 127,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Amasya",
        "district": "Suluova",
        "neighbourhood": "Kıranbaşalan Köyü",
        "rooms": "2.0",
        "price": 2250.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:38.17",
        "updateDate": "2022-10-08T00:51:38.17",
        "advertId": 107,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bartın",
        "district": "Ulus",
        "neighbourhood": "Eseler Köyü",
        "rooms": "5.1",
        "price": 2250.00,
        "floorArea": "130"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:52.96",
        "updateDate": "2022-10-08T01:17:52.96",
        "advertId": 141,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kocaeli",
        "district": "Kandıra",
        "neighbourhood": "Aydınlık",
        "rooms": "4.1",
        "price": 3500.00,
        "floorArea": "85"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:40.62",
        "updateDate": "2022-10-08T00:51:40.62",
        "advertId": 108,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kocaeli",
        "district": "Karamürsel",
        "neighbourhood": "Yalakdere",
        "rooms": "2.1",
        "price": 3500.00,
        "floorArea": "85"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:31.27",
        "updateDate": "2022-10-08T00:50:31.27",
        "advertId": 88,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Isparta",
        "district": "Atabey",
        "neighbourhood": "Gezirler",
        "rooms": "5.1",
        "price": 4200.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:35.987",
        "updateDate": "2022-10-08T01:18:35.987",
        "advertId": 173,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Samsun",
        "district": "Havza",
        "neighbourhood": "Üniversite",
        "rooms": "4.1",
        "price": 4500.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:04.3",
        "updateDate": "2022-10-08T01:18:04.3",
        "advertId": 153,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Balıkesir",
        "district": "Marmara",
        "neighbourhood": "Abroz",
        "rooms": "1.1",
        "price": 4500.00,
        "floorArea": "80"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:51.78",
        "updateDate": "2022-10-08T01:17:51.78",
        "advertId": 140,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Diyarbakır",
        "district": "Dicle",
        "neighbourhood": "Yeşiltepe",
        "rooms": "1.1",
        "price": 4500.00,
        "floorArea": "85"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:49.243",
        "updateDate": "2022-10-08T01:17:49.243",
        "advertId": 138,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Eskişehir",
        "district": "Çifteler",
        "neighbourhood": "Erbap",
        "rooms": "5.1",
        "price": 4500.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:23.493",
        "updateDate": "2022-10-08T01:17:23.493",
        "advertId": 131,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Osmaniye",
        "district": "Kadirli",
        "neighbourhood": "Kayasuyu Köyü",
        "rooms": "2.1",
        "price": 4500.00,
        "floorArea": "45"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:17:14.797",
        "updateDate": "2022-10-08T01:17:14.797",
        "advertId": 121,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Mersin",
        "district": "Çamlıyayla",
        "neighbourhood": "Fakılar",
        "rooms": "5.1",
        "price": 4500.00,
        "floorArea": "50"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:37.06",
        "updateDate": "2022-10-08T01:18:37.06",
        "advertId": 174,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Erzincan",
        "district": "Tercan",
        "neighbourhood": "Topalhasan Köyü",
        "rooms": "4.1",
        "price": 5500.00,
        "floorArea": "60"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:50:30.167",
        "updateDate": "2022-10-08T00:50:30.167",
        "advertId": 87,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Bursa",
        "district": "İznik",
        "neighbourhood": "Osmaniye",
        "rooms": "5.1",
        "price": 5500.00,
        "floorArea": "60"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T01:18:30.387",
        "updateDate": "2022-10-08T01:18:30.387",
        "advertId": 165,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Karabük",
        "district": "Eskipazar",
        "neighbourhood": "Kapaklı Köyü",
        "rooms": "2.0",
        "price": 6250.00,
        "floorArea": "90"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:35.233",
        "updateDate": "2022-10-08T00:51:35.233",
        "advertId": 105,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Van",
        "district": "Erciş",
        "neighbourhood": "Ulupamir",
        "rooms": "2.1",
        "price": 6250.00,
        "floorArea": "90"
      },
      {
        "username": "sara",
        "applicationUserId": 2,
        "publishDate": "2022-10-08T00:51:51.697",
        "updateDate": "2022-10-08T00:51:51.697",
        "advertId": 118,
        "title": "Uygun fiyata sigara ve alkolsuz bir yer",
        "content":
            "Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.",
        "city": "Kars",
        "district": "Digor",
        "neighbourhood": "Bayırbağı Köyü",
        "rooms": "2.1",
        "price": 8600.00,
        "floorArea": "55"
      }
    ];
    print("total ads " + vsl.length.toString());
    int count = 0;
    while (count != 20) {
      var city = random.nextInt(81);
      var districts = [];
      var neighbourhoods = [];
      var floorAreas = [
        45,
        60,
        105,
        145,
        65,
        80,
        90,
        50,
        120,
        75,
        95,
        110,
        130,
        140,
        55,
        70,
        85
      ];
      var rooms = [1.1, 2.1, 2.0, 3.1, 4.1, 5.1];

      var price = [
        1220,
        950,
        800,
        720,
        650,
        1650,
        450,
        350,
        220,
        460,
        990,
        645,
        985,
        375,
        645,
        400,
        1110,
        515,
        1530,
        1230,
        1100,
        470,
        890,
        920,
        1000,
        1620,
        4200,
        3500,
        8600,
        4500,
        3250,
        2250,
        1950,
        1450,
        6250,
        5500,
        1760,
        880,
        9250,
        650,
        840,
        770,
        860
      ];

      for (var element in data[city]['towns']) {
        districts.add(element['name']);
      }
      var district = random.nextInt(districts.length);
      for (var element1 in data[city]['towns'][district]['districts']) {
        for (var element in element1['quarters']) {
          //print(element['name']);
          neighbourhoods.add(element['name']);
        }
      }

      var values = {
        "AdvertId": -1,
        "Title": 'Uygun fiyata sigara ve alkolsuz bir yer',
        "Content":
            'Şuan için 2 kişi olarak kalıyoruz(2 kız) 1 kişi daha dahil etmek istiyoruz. Sigarayla aramız yok pek. Alkol olmasa daha iyi olur ama olursa da sorun olmaz. Daha fazlası için dm den ulaşabilirsiniz.',
        "City": data[city]['name'].toString().trim(),
        "District": districts[district].toString().trim(),
        "Neighbourhood": neighbourhoods[random.nextInt(neighbourhoods.length)]
            .toString()
            .trim(),
        "Rooms": rooms[random.nextInt(rooms.length)].toString().trim(),
        "Price": price[random.nextInt(price.length)],
        "FloorArea":
            floorAreas[random.nextInt(floorAreas.length)].toString().trim(),
      };
      await createHttpRequest('api/Advert', 'POST', values, context);
      count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text('click'),
        onPressed: () {
          readJson();
        },
      ),
    );
  }
}
