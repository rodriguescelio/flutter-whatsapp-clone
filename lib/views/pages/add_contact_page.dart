import 'package:flutter/material.dart';
import 'package:whatsapp/utils/color_utils.dart';

class AddContactPage extends StatelessWidget {
  final String _avatar =
      'https://github.com/rodriguescelio/flutter-whatsapp-clone/raw/master/lib/assets/1.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Contato'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ColorUtils.generateMaterialColor(230, 242, 241, 0xFFE6F2F1),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.60,
                height: MediaQuery.of(context).size.width * 0.60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(_avatar),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Jhon Doe',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color:
                    ColorUtils.generateMaterialColor(18, 140, 126, 0xFF128C7E),
              ),
            ),
            Text(
              'jhon_doe',
              style: TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () => null,
              color: ColorUtils.generateMaterialColor(18, 140, 126, 0xFF128C7E),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Text(
                  'Adicionar à lista de contatos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
