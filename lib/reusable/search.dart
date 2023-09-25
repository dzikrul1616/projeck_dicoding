import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Search ...',
                filled: true,
                contentPadding: EdgeInsets.all(10),
                fillColor: Colors.grey[200],
                border:
                    OutlineInputBorder(borderSide: BorderSide.none)),
          )),
    );
  }
}
