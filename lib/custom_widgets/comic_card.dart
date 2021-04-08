import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_brisa/custom_widgets/custom_text.dart';
import 'package:marvel_brisa/model/comic.dart';
import 'package:marvel_brisa/utils/nav.dart';
import 'package:marvel_brisa/views/map_view.dart';

class ComicCard extends StatefulWidget {
  final Comic comic;
  ComicCard(this.comic);

  @override
  _ComicCardState createState() => _ComicCardState();
}

class _ComicCardState extends State<ComicCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        elevation: 20,
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    "${widget.comic.thumbnail.path}.${widget.comic.thumbnail.extension}",
              ),
              Container(
                color: Colors.black54,
              ),
              Container(
                padding: EdgeInsets.all(3),
                alignment: Alignment.bottomCenter,
                child: CustomText(
                  texto: widget.comic.title,
                  cor: Colors.white,
                  tamanhoFonte: 12,
                  bold: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTap() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "${widget.comic.thumbnail.path}.${widget.comic.thumbnail.extension}",
            ),
            Container(
              color: Colors.black87,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    texto: "Title: ${widget.comic.title}",
                    cor: Colors.white,
                    bold: true,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    texto:
                        "Description: ${widget.comic.description != null ? widget.comic.description : "Description not exists"}",
                    cor: Colors.white,
                    bold: true,
                    tamanhoFonte: 13,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 300,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: () {
                    push(context, MapView());
                  },
                  icon: Image.asset("assets/images/maps.png"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
