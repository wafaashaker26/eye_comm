import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.list,
    required this.backcolor,
  });

  final String title;
  final String description;
  final Color color;
  final Color backcolor;
  final List list;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              color: Colors.white,
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: backcolor,
                      child: Icon(Icons.arrow_back, color: color, size: 27),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => list[index],
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
