
import 'package:flutter/material.dart';
import 'package:netflix_clone/api/model/comming.dart';

import '../../core/constands.dart';

class MainCard extends StatelessWidget {
  List<DownloadModel> items;
   MainCard({
    Key? key,required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 150,
        height: 250,
        decoration:  BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
            
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg'),
          ),
        ),
      ),
    );
    
  }
}
