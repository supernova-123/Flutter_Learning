import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Card Collection"),
          backgroundColor: Colors.amber,
        ),
        body: MyCard(),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        getCard(
          "http://cozy-life.hangzhouhotelsweb.com/data/Pics/OriginalPhoto/5909/590989/590989362/pic-cozy-life-hangzhou-1.JPEG",
          "https://upload.thwiki.cc/2/2a/DOPE_ICON%E5%B0%81%E9%9D%A2.png",
          "Jayden Zhu",
          "COZY LIFE.",
        ),
        getCard(
          "https://as2.ftcdn.net/v2/jpg/02/05/80/75/1000_F_205807561_b0clLQHiw1xdmTA4wJsAhGBZaxA80XZS.jpg",
          "https://p7.itc.cn/images01/20230814/536a0eafa7a041e4a0aa56ea11a9bc68.jpeg",
          "Lil Red",
          "Beautiful Flowers.",
        ),
        getCard(
          "https://www.positran.eu/wp-content/uploads/elementor/thumbs/sun-orqgk2tuqot7gt0qav47paeals7llws0sruucdiydk.jpg",
          "https://p9.itc.cn/images01/20230814/ab6ebecf8e6846a093220781c76862a1.jpeg",
          "Xiao Hong",
          "Sunshine!"
        ),
        getCard(
          "https://cc-prod.scene7.com/is/image/CCProdAuthor/vintage-aesthetic_P1_900x420?\$pjpeg\$&jpegSize=200&wid=900",
          "https://upload.thwiki.cc/3/3d/SWING_HOLIC_VOL.07%E5%B0%81%E9%9D%A2.jpg",
          "SuperNova",
          "Yellow makes world better.",
        ),
      ],
    );
  }
}

Card getCard(String url, String avatar, String name, String describe) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
        ListTile(
          leading: Container(
            height: 44,
            width: 44,
            child: ClipOval(
              child: Image.network(
                avatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(name),
          subtitle: Text(describe),
        ),
      ],
    ),
  );
}
