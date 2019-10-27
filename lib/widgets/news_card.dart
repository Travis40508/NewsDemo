import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/utils/strings.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final VoidCallback onClick;

  NewsCard({@required this.article, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        child: Column(
          children: <Widget>[
            Card(
              child: Image(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  article?.urlToImage,
                ),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article?.title ?? Strings.emptyText,
                      style: TextStyle(
                          fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        article?.description ?? Strings.emptyText,
                      style: TextStyle(
                        fontSize: 16.0
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                          onTap: onClick,
                          child: Text(Strings.clickForMoreButton)),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
