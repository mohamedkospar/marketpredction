import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'base_list.dart';
import 'colors.dart';

class Attributions extends StatelessWidget {
  static const _kHeadlineStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const _kTextStyle = TextStyle(
    color: kLighterGray,
    height: 1.8,
    fontWeight: FontWeight.w600,
  );

  static const _kSubtitleStyling = TextStyle(
      color: Color(0XFFb0b0b0), fontSize: 18, fontWeight: FontWeight.w800);

  const Attributions({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseList(
      children: <Widget>[
        _buildContent(
            title:
                'Application Developed by , Faculty of Computer and Information science Ain Shams University (Computer System Department) Team',
            text: 'You can find this app\'s source code soon.',
            url: 'https://github.com/JoshuaR503/Stock-Market-App'),
        const Divider(),
        _buildContent(
          title: 'supervisor',
          text:
              ' Dr. Mervat ElQatt and Dr. Nadine Halawa we express our sincere appreciation for your guidance and support throughout our graduation project.',
          url: 'https://newsapi.org/',
          //icon: FontAwesomeIcons.earthAmericas,
        ),
        const Divider(),
        _buildContent(
            title: 'Built with Flutter',
            text:
                'None of this would have been posible without Flutter, its amazing community and packages.',
            url: 'https://flutter.dev/'),
        const Divider(),
        const Text('APIs used in this app:', style: _kHeadlineStyle),
        const SizedBox(height: 18),
        _buildApisContent(
          title: 'Financial Modeling Prep API',
          text:
              'The Portfolio & Markets are powered by this API. Tap here to learn more.',
          url: 'https://financialmodelingprep.com/developer/docs/',
          icon: FontAwesomeIcons.shapes,
        ),
        const Divider(),
        _buildApisContent(
          title: 'Alpha Vantage API',
          text:
              'The Search section is powered by Alpha Vantage API. Tap here to learn more.',
          url: 'https://www.alphavantage.co/documentation/',
          icon: FontAwesomeIcons.magnifyingGlass,
        ),
        const Divider(),
        _buildApisContent(
          title: 'Machine Learning model',
          text:
              'the Machine Learning model LSTM we used For prediction page. Tap here to learn more.',
          url: 'https://newsapi.org/',
          icon: FontAwesomeIcons.earthAmericas,
        ),
        /* const Divider(),
        _buildApisContent(
          title: 'Finnhub Stock API',
          text:
              'The news section in the Profile page is powered by the Finnhub Stock API. Tap here to learn more.',
          url: 'https://finnhub.io/',
          icon: FontAwesomeIcons.solidNewspaper,
        ),*/
      ],
    );
  }

  Widget _buildContent(
      {required String title, required String text, required String url}) {
    return GestureDetector(
      //onTap: () => launchUrl(url),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: _kHeadlineStyle),
          const SizedBox(height: 8),
          Text(text, style: _kTextStyle),
        ],
      ),
    );
  }

  Widget _buildApisContent(
      {required String title,
      required String text,
      required String url,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: GestureDetector(
          //onTap: () => launchUrl(url),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(icon),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: _kSubtitleStyling),
              const SizedBox(height: 8),
              Text(text, style: _kTextStyle),
            ],
          ))
        ],
      )),
    );
  }
}
