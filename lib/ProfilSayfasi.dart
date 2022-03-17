import 'package:flutter/material.dart';
import 'package:sociaworld/gonderikarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String? isimSoyad;
  final String? kullaniciAdi;
  final String? kapakResimLinki;
  final String? profilResimLinki;
  final String? takipciSayisi;
  final String? takipSayisi;
  final String? paylasimSayisi;

  ProfilSayfasi(
      {this.isimSoyad,
      this.kullaniciAdi,
      this.kapakResimLinki,
      this.profilResimLinki,
      this.takipciSayisi,
      this.takipSayisi,
      this.paylasimSayisi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
                //color: Colors.yellow,
              ),
              //Profil Arka Plan Resmi
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage(
                      kapakResimLinki.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //Profil Resmi
              Positioned(
                left: 30.0,
                bottom: 0.0,
                child: Hero(
                  tag: kullaniciAdi.toString(),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.lightBlue,
                      image: DecorationImage(
                        image: NetworkImage(
                          profilResimLinki.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              //Profil Sayfasi Isim Soyad
              Positioned(
                left: 160.0,
                bottom: 6.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      kullaniciAdi.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      isimSoyad.toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              //Profil Sayfasi Takip Et Butonu
              Positioned(
                right: 15.0,
                top: 130.0,
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(width: 2.0, color: Colors.white),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_circle,
                        size: 18.0,
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        "Takip Et",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              // Profil Sayfasi Geri Butonu
              IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          //Profil Sayfasi Takipci Takip Paylasim Satiri
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  sayac("Takipçi", takipciSayisi.toString()),
                  sayac("Takip", takipSayisi.toString()),
                  sayac("Paylaşım", paylasimSayisi.toString()),
                ],
              ),
            ),
          ),
          GonderiKartlari(
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2016/07/22/16/54/portrait-1535266_960_720.jpg",
            isimSoyad: "Tom Cruise",
            gecenSure: "3 saat önce",
            aciklama: "Delisin",
            gonderilenResimLinki:
                "https://cdn.pixabay.com/photo/2021/10/10/19/52/motorcycle-6698576_960_720.png",
          ),
        ],
      ),
    );
  }

//Profil Sayfasi Takipci Takip Paylasim Metodu
  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          sayi,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          baslik,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17.0,
          ),
        ),
      ],
    );
  }
}
