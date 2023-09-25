import 'package:flutter/material.dart';
import 'package:proyek_akhir/screen/profile.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network('https://i.ibb.co/PGv8ZzG/me.jpg',
                      fit: BoxFit.cover),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                email,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              name: name,
                              email: email,
                            )));
              },
              leading: Icon(Icons.person_2),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text(
                "LogOut",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Center(
                  child: Text(
                    "Aplication version : 1.0 ",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String name = 'Robert';
  String email = "robert@gmail.com";
}
