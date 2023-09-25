import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_akhir/screen/view/recomendation_provider.dart';

class RecomendationView extends StatelessWidget {
  const RecomendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => RecomendationProvider(),
        child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.amberAccent[200],
              centerTitle: true,
              title: Text(
                "Recomendation",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: Consumer<RecomendationProvider>(
                builder: (context, value, child) {
              return SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: value.recomendation.length,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final data = value.recomendation[index];
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
              ));
            })));
  }
}
