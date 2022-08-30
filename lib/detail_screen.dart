import 'package:flutter/material.dart';
import 'package:reaboks/model/list_book.dart';

class DetailScreen extends StatelessWidget {
  final Book book;

  const DetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebView(book: book);
        } else {
          return DetailMobileView(book: book);
        }
      },
    );
  }
}

class DetailMobileView extends StatefulWidget {
  final Book book;

  const DetailMobileView({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailMobileView> createState() => _DetailMobileViewState();
}

class _DetailMobileViewState extends State<DetailMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget.book.judul,
                    child: Image.network(widget.book.imageUrls),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Text(
                          widget.book.judul,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.purpleAccent,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  widget.book.pengarang,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  widget.book.genre,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            widget.book.sinopsis,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  FavoriteButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebView extends StatefulWidget {
  final Book book;

  const DetailWebView({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailWebView> createState() => _DetailWebViewState();
}

class _DetailWebViewState extends State<DetailWebView> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 64,
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "RevBook'S",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Hero(
                            tag: widget.book.judul,
                            child: Image.network(widget.book.imageUrls),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10,),
                SingleChildScrollView(
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.book.judul,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.purpleAccent,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.book.pengarang,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                              FavoriteButton(),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 30,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                widget.book.genre,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              widget.book.sinopsis,
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
