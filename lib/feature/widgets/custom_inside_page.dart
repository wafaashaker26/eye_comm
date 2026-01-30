import 'package:flutter/material.dart';

class CustomInsidePage extends StatelessWidget {
  const CustomInsidePage({
    super.key,
    required this.title,
    required this.backTitle,
    required this.color,
    required this.backcolor,
    required this.list,
    required this.isExist, required this.description,
  });

  final String title;
  final String backTitle;
  final String description;
  final Color color;
  final Color backcolor;
  final List list;
  final bool isExist;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                spacing: 1,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Row(
                    children: [
                      Text(
                        "$backTitle > ",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7,),
            ?isExist?null:ClipRRect(borderRadius:BorderRadius.circular(15),child: Image(image: AssetImage("assets/images/img.png"))),
            ?isExist?null:SizedBox(height: 7,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.separated(
                  itemBuilder: (context, index) => list[index],
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: list.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
