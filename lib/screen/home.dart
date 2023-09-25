import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir/reusable/drawer.dart';
import 'package:proyek_akhir/reusable/search.dart';
import 'package:proyek_akhir/screen/view/recomendation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(),
            Builder(builder: (context) {
              List images = [
                "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
              ];

              return CarouselSlider(
                options: CarouselOptions(
                  height: 160.0,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                ),
                items: images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            const SizedBox(
              height: 30.0,
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.0,
                crossAxisCount: 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
              ),
              itemCount: menu.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final data = menu[index];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(data['icon']),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          data['title'],
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recomendation",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecomendationView()),
                    ),
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: 3,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final data = recomendation[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        child: Text(
                                          data['subtitle'],
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            // overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> menu = [
    {"menu": "utama", "title": "Utama", "icon": Icons.apartment},
    {"menu": "petunjuk", "title": "Petunjuk", "icon": Icons.info},
    {"menu": "barcode", "title": "Barcode", "icon": Icons.qr_code},
    {"menu": "repair", "title": "Repair", "icon": Icons.car_repair},
    {"menu": "Coming", "title": "Coming", "icon": Icons.watch_later_outlined},
    {"menu": "Coming", "title": "Coming", "icon": Icons.watch_later_outlined},
    {"menu": "Coming", "title": "Coming", "icon": Icons.watch_later_outlined},
    {"menu": "Coming", "title": "Coming", "icon": Icons.watch_later_outlined},
  ];
  List<Map<String, dynamic>> recomendation = [
    {
      "title": "Penyebab Dari penggunaan oli yang tak kunjung di ganti",
      "subtitle":
          "Oli yang lama tidak diganti akan menyebabkan salah satunya adalah karat pada mesin",
      "image": "https://i.ibb.co/QrTHd59/woman.jpg"
    },
    {
      "title": "Penyebab Dari penggunaan oli yang tak kunjung di ganti",
      "subtitle":
          "Oli yang lama tidak diganti akan menyebabkan salah satunya adalah karat pada mesin",
      "image": "https://i.ibb.co/QrTHd59/woman.jpg"
    },
    {
      "title": "Penyebab Dari penggunaan oli yang tak kunjung di ganti",
      "subtitle":
          "Oli yang lama tidak diganti akan menyebabkan salah satunya adalah karat pada mesin",
      "image": "https://i.ibb.co/QrTHd59/woman.jpg"
    },
  ];
}
