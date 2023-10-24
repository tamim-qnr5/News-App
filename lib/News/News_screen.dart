import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher/url_launcher_string.dart';

import '../MyTheme.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsScreen extends StatelessWidget {
  static const String routeName = 'NewsScreen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as NewsArgs;
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/pattern.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text('News App'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          body: Padding(
            padding:EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05,horizontal: 10),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,//to apply BorderRadius
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: args.news.urlToImage??'',
                          placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Text(args.news.author??'',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.grayColor,fontSize:15),),

                      Text(args.news.title??''),
                      Text(args.news.publishedAt??'',
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.grayColor,fontSize:15 ),),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: MyTheme.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(args.news.content??''),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Link(
                              //     uri: Url,
                              //     target: LinkTarget.defaultTarget,
                              //     builder: (context,openLink) => TextButton(
                              //         onPressed: openLink,
                              //         child: Text('View Full Article'))
                              // ),
                              TextButton(
                                onPressed: ()async{
                                  launcher.launchUrl(Uri.parse(args.news.url??''));
                                },
                                  child: Text('View Full Article')),
                              Icon(CupertinoIcons.play_fill)
                            ],
                          ),
                        )
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
}
class NewsArgs{
  News news;
  NewsArgs({required this.news});
}
void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
