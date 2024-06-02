import 'dart:async';

import 'package:flutter/material.dart';

//classe du widget
class AdsWidget extends StatefulWidget {
  AdsWidget({super.key});

  /*
  dart :
    List : équivalent à un array
    Map: équivalent objet

  visibilité des membres :
  pas de protected
  préfixe _ : équivalent à private


  */

  //Liste des maps
  final List<Map> _items = [
    {'img': 'ad1.jpeg', 'text': 'Text1'},
    {'img': 'ad2.jpeg', 'text': 'Text1'},
    {'img': 'ad3.jpeg', 'text': 'Text1'},
  ];

  //indice de la liste
  int _index = 0;

  //minuteur
  //? : valeur nulle
  Timer? _timer;

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

//classe de l'état du widget
class _AdsWidgetState extends State<AdsWidget> {
  /*
    cycle de vie d'un widget
    initState :  affichage d'un widget
    dispose : désaffichage d'un widget
  */
  @override
  void initState() {
    super.initState();
    //déclencher le timer
    widget._timer = Timer.periodic(const Duration(seconds: 2), _setTimer);
  }

  void _setTimer(Timer timer) {
    //setState : permet de modifier l'état et de déclencher la maj du widget
    setState(() {
      if (widget._index < widget._items.length - 1) {
        widget._index++;
      } else {
        widget._index = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    //stopper minuteur
    //null coaslescing : utilisation ?
    //! : permet de féfinir que la valeur n'est pas nulle
    widget._timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //le mot clé widget permet d'accéder à la classe widget à partir de
      //l'état du widget
      children: [
        Image.asset('assets/img/${widget._items[widget._index]['img']}'),
        Text(widget._items[widget._index]['text'])
      ],
    );
  }
}
