import 'package:flutter/material.dart';
import 'package:for_x/models/news_models/article_model.dart';
import 'package:google_fonts/google_fonts.dart';

  Widget customNewsCard(Article article) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image:
                    DecorationImage(image: NetworkImage(article.urlToImage!))),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(article.source!.name.toString()),
          ),
          const SizedBox(height: 8),
          Text(article.title.toString() , style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,

          ),)
        ],
      ),
    );
  }

