// ignore_for_file: library_private_types_in_public_api, library_prefixes, prefer_const_constructors, use_build_context_synchronously, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_aes/app/data/hive_manager_data.dart';
import 'package:flutter_aes/constant/color_constant.dart';
import 'package:flutter_aes/core/base_widget.dart';
import 'package:flutter_aes/core/padding.dart';
import 'package:flutter_aes/pages/details_page.dart';
import 'package:flutter_aes/services/encyrpt_service.dart';
import 'package:flutter_aes/src/text_string.dart';
import 'package:flutter_aes/style/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_aes/widgets/icon.dart' as CustomIcons;
import 'package:path_provider/path_provider.dart' as path_provider;

class PasswordHomePage extends StatefulWidget {
  const PasswordHomePage({Key? key}) : super(key: key);

  @override
  _PasswordHomePageState createState() => _PasswordHomePageState();
}

class _PasswordHomePageState extends State<PasswordHomePage> {
  final Box box = Hive.box("password");
  final HiveData _hiveData = HiveData();
  final EncryptService _encryptService = EncryptService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(StringTextWidget.appBarTitle, style: styleFontsWhite),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DetailsPage()));
              },
              icon: Icon(Icons.density_large))
        ],
      ),
      body: Padding(
        padding: horzonVertical,
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box box, _) {
            if (box.values.isEmpty) {
              return Center(
                  child: Text(StringTextWidget.noPassText,
                      style: styleFontsBlack));
            }
            return gridViewBuild(box);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {},
        child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  GridView gridViewBuild(Box<dynamic> box) {
    return GridView.builder(
      itemCount: box.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        Map data = box.getAt(index);
        return InkWell(
          onTap: () {
            _encryptService.copyToClipboard(
              data['password'],
              context,
            );
          },
          child: iconCard(index, data, context),
        );
      },
    );
  }

  Card iconCard(int index, Map<dynamic, dynamic> data, BuildContext context) {
    return Card(
      elevation: 3,
      color: cardColor,
      margin: EdgeInsets.all(
        10.0,
      ),
      child: slidableWidget(index, data, context),
    );
  }

  Slidable slidableWidget(
      int index, Map<dynamic, dynamic> data, BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        IconSlideAction(
          closeOnTap: true,
          caption: StringTextWidget.deleteText,
          color: red,
          icon: Icons.delete,
          onTap: () => alertDelete(index, data['type']),
        ),
      ],
      child: CustomIcons.icons[data['type'.trim()]] ??
          Icon(
            Icons.lock,
            size: 32.0,
            color: iconColor,
          ),
    );
  }

  void alertDelete(int index, String type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Center(child: Text(StringTextWidget.deleteText, style: styleFonts)),
        content: Text(StringTextWidget.isDelete),
        actions: [
          TextButton(
              child: Text(StringTextWidget.deleteText),
              onPressed: () async {
                _hiveData.deletePassword(index);
                setState(() {});
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
