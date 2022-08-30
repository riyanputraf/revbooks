import 'package:flutter/material.dart';
import 'package:reaboks/detail_screen.dart';
import 'package:reaboks/model/list_book.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 110.0,
            backgroundColor: Color(0xFFE040FB),
            centerTitle: true,
            title: const Text(
              "RevBook'S",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const WidgetBookList();
              } else if (constraints.maxWidth <= 1200) {
                return const WidgetBookGrid(
                  gridCount: 4,
                );
              } else {
                return const WidgetBookGrid(
                  gridCount: 6,
                );
              }
            },
          ),
          backgroundColor: Color(0xFF4FC3F7),
        );
      },
    );
  }
}

class WidgetBookList extends StatelessWidget {
  const WidgetBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Book book = bookList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(book: book);
              }));
            },
            child: Card(
              elevation: 2.0,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Hero(
                      tag: book.judul,
                      child: Container(
                        width: 100.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(book.imageUrls),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          book.judul,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.purpleAccent,
                            ),
                            Text(
                              book.pengarang,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 28,
                            ),
                            Text(
                              book.genre,
                              style: TextStyle(fontSize: 15.0),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: bookList.length,
      ),
    );
  }
}

class WidgetBookGrid extends StatelessWidget {
  final int gridCount;

  const WidgetBookGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: bookList.map((book) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(book: book);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(book.imageUrls),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      book.judul,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.purpleAccent,
                      ),
                      Text(book.pengarang),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(book.genre),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
