import 'package:flutter/material.dart';
import 'package:sociaworld/gonderikarti.dart';
import 'package:sociaworld/ProfilSayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projem",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 32.0,
            ),
            onPressed: () {},
          ),
          title: Text(
            "Socia World",
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.purple.shade300,
                size: 32.0,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          duyuru("Kamil Seni Takip Etti", "5 dk önce"),
                          duyuru("Seda Gönderine Yorum Yaptı", "29 gün önce"),
                          duyuru("Hikmet Fotoğrafını Beğendi", "1 ay önce"),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 2.5),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ///Profil Kartı
                  profilKartiOlustur(
                    "Jessica",
                    "https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147_960_720.jpg",
                    "Jessica Hardy",
                    "https://cdn.pixabay.com/photo/2016/08/11/23/48/mountains-1587287_960_720.jpg",
                    "10K",
                    "1K",
                    "142",
                  ),
                  profilKartiOlustur(
                    "Tom",
                    "https://cdn.pixabay.com/photo/2016/07/22/16/54/portrait-1535266_960_720.jpg",
                    "Tom Watson",
                    "https://cdn.pixabay.com/photo/2013/10/09/02/27/lake-192990_960_720.jpg",
                    "7K",
                    "4K",
                    "14",
                  ),
                  profilKartiOlustur(
                    "Belma",
                    "https://cdn.pixabay.com/photo/2019/06/03/05/07/portrait-4248098_960_720.jpg",
                    "Belma Abasıyanık",
                    "https://cdn.pixabay.com/photo/2019/02/25/00/17/kitten-4018756_960_720.jpg",
                    "109K",
                    "1",
                    "1512",
                  ),
                  profilKartiOlustur(
                    "Selçuk",
                    "https://cdn.pixabay.com/photo/2016/06/21/06/27/travel-1470533_960_720.jpg",
                    "Selçuk Yöndem",
                    "https://cdn.pixabay.com/photo/2014/08/01/00/08/pier-407252_960_720.jpg",
                    "239",
                    "220",
                    "0",
                  ),
                  profilKartiOlustur(
                    "Ayşe",
                    "https://cdn.pixabay.com/photo/2021/02/22/12/25/portrait-6040015_960_720.jpg",
                    "Ayşe Kulin",
                    "https://cdn.pixabay.com/photo/2019/02/25/00/17/kitten-4018756_960_720.jpg",
                    "77K",
                    "333",
                    "279",
                  ),
                  //Profil Kartı
                ],
              ),
            ),
            SizedBox(height: 10.0),
            GonderiKartlari(
              profilResimLinki:
                  "https://cdn.pixabay.com/photo/2021/02/22/12/25/portrait-6040015_960_720.jpg",
              isimSoyad: "Ayşe Yılmaz",
              gecenSure: "1 saat önce",
              aciklama: "Çok Hoş Bir Gündü...",
              gonderilenResimLinki:
                  "https://cdn.pixabay.com/photo/2015/07/28/22/12/autumn-865157_960_720.jpg",
            ),
            GonderiKartlari(
              profilResimLinki:
                  "https://cdn.pixabay.com/photo/2016/07/22/16/54/portrait-1535266_960_720.jpg",
              isimSoyad: "Tom Watson",
              gecenSure: "3 saat önce",
              aciklama: "Delisin",
              gonderilenResimLinki:
                  "https://cdn.pixabay.com/photo/2021/10/10/19/52/motorcycle-6698576_960_720.png",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple.shade400,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
        ));
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            mesaj.toString(),
            style: TextStyle(
              fontSize: 15.5,
            ),
          ),
          Text(gecenSure.toString()),
        ],
      ),
    );
  }

  Widget profilKartiOlustur(
      String kullaniciAdi,
      String url,
      String isimSoyad,
      String kapakResimLinki,
      String takipciSayisi,
      String takipSayisi,
      String paylasimSayisi) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenVeri = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ProfilSayfasi(
                profilResimLinki: url,
                kullaniciAdi: kullaniciAdi,
                isimSoyad: isimSoyad,
                kapakResimLinki: kapakResimLinki,
                takipciSayisi: takipciSayisi,
                takipSayisi: takipSayisi,
                paylasimSayisi: paylasimSayisi,
              ),
            ),
          );
          if (donenVeri == true) {
            print("Kullanici Profil Sayfasindan dondu...");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  //Profil Resmi
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            url,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 6.0),
              Text(
                kullaniciAdi,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
