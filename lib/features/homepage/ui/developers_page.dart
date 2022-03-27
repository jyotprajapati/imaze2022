import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopersPage extends StatefulWidget {
  const DevelopersPage({Key? key}) : super(key: key);

  @override
  State<DevelopersPage> createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developers'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.transparent,
                      // backgroundImage: NetworkImage(
                      //     "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2Fdevelopers%2FWhatsApp%20Image%202022-03-27%20at%207.55.10%20AM.jpeg?alt=media&token=2ba9e92a-beb3-4693-be91-4312c7200364"),
                      child: ClipOval(
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2Fdevelopers%2FWhatsApp%20Image%202022-03-27%20at%208.29.45%20AM.jpeg?alt=media&token=e60ad912-b0e7-4a80-8859-3b7720836e05',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Jyot Prajapati",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        const url =
                            'https://www.linkedin.com/in/jyot-prajapati-627329197/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Connect on LinkedIn",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2Fdevelopers%2FWhatsApp%20Image%202022-03-27%20at%208.32.38%20AM.jpeg?alt=media&token=c3858afb-8d3d-40df-b741-aeab87d0df23',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Smit Choksi",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        const url =
                            'https://www.linkedin.com/in/smit-choksi-2bb1091a9/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Connect on LinkedIn",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2Fdevelopers%2FWhatsApp%20Image%202022-03-26%20at%208.58.32%20PM.jpeg?alt=media&token=e32f42bc-0729-4d12-a0bb-3e1c44b49039',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Gitel Panwar",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        const url =
                            'https://www.linkedin.com/in/gitel-panwar-166776214/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Connect on LinkedIn",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2Fdevelopers%2FWhatsApp%20Image%202022-03-27%20at%208.31.31%20AM.jpeg?alt=media&token=e11aeb24-d26d-4b0b-b845-3d66303a9280',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Jinay Shah",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        const url =
                            'https://www.linkedin.com/in/jinay-shah-5389a01ba/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Connect on LinkedIn",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // CircleAvatar(
          //   radius: 50,
          //   child: Image.network(
          //       "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2Fdevelopers%2FWhatsApp%20Image%202022-03-26%20at%208.58.32%20PM.jpeg?alt=media&token=e32f42bc-0729-4d12-a0bb-3e1c44b49039"),
          //   backgroundImage: NetworkImage(
          //     "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2Fdevelopers%2FWhatsApp%20Image%202022-03-26%20at%208.58.32%20PM.jpeg?alt=media&token=e32f42bc-0729-4d12-a0bb-3e1c44b49039",
          //     scale: 1.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
