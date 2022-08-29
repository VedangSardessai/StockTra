import 'package:flutter/material.dart';
import 'package:for_x/models/news_models/news_card.dart';
import 'package:for_x/models/news_models/news_services/news_api.dart';
import 'package:google_fonts/google_fonts.dart';

import 'article_model.dart';

class NewsCreen extends StatelessWidget {
  APIServices client = APIServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.black,
        title: Text(
          'Wall Street Journal',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> article = snapshot.data!;
            return ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => customNewsCard(article[index]),
              //     ListTile(
              //   title: Text(article[index].title.toString()),
              // ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
