import 'package:flutter/material.dart';

class Like extends StatefulWidget {
  Like({
    super.key,
    required this.removeProductCallBack,
    required this.like,
  });

  final List<Map<String, dynamic>> like;
  final Function(Map<String, dynamic>) removeProductCallBack;

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text("Like", style: TextStyle(color: Colors.black)),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Icon(
          //       Icons.shopping_bag_outlined,
          //       color: Colors.black,
          //     ),
          //   )
          // ],
          backgroundColor: Colors.green,
          elevation: 1),
      body: ListView.builder(
        itemCount: widget.like.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 140,
            width: 365,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Container(
                    height: 120,
                    width: 125,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage("${widget.like[index]["image"]}"),
                            fit: BoxFit.contain),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15))),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.like[index]['category']}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.like[index]['title']}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Price: ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "\u{20B9} ${(widget.like[index]['price'] * 82).round()}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.removeProductCallBack(widget.like[index]);
                          });
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
