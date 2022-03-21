import 'package:news_app/presentation/modules/web_view_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/news_model.dart';
import 'package:flutter/material.dart';

Column buildNewsItem(List<NewsModel> news, index,context) {
  return Column(
    children: [
      InkWell(
        onTap: (){
          navigatorTo(context,WebNews(news[index].url.toString()));
        },
        child: Container(
          height: 140,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 5,
                blurRadius: 7),
          ]),
          child: Row(
            children: [
              news[index].urlToImage !=null ? FadeInImage.assetNetwork(
                image: news[index].urlToImage.toString(),
                height: 140,
                width: 130,
                fit: BoxFit.cover,
                placeholder: 'assets/images/loading.gif',
              ) : Image.asset('assets/images/abc.png',
                height: 140,
                width: 130,
                fit: BoxFit.cover,),
              Expanded(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                            "${news[index].title}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 4,
                            textAlign: TextAlign.end,
                          )),
                      Text(
                        "${news[index].publishedAt}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
void navigatorTo (context,Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> widget));
}
void lunchUrl(String url) async {
  await canLaunch(url) ? await launch(url) : throw " Could not launch $url";
}
