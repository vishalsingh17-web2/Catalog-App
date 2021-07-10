import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:untitled/Models/Catalog.dart';
import 'package:untitled/Widgets/Drawer.dart';
import 'package:untitled/Widgets/Item_Widget.dart';
import 'package:untitled/Widgets/Theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';


 class Home_page extends StatefulWidget {
   const Home_page({Key? key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
    await rootBundle.loadString("Assets/Files/Catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m8,
          child: Column(
            children: [
              CatalogHeader().box.p16.make(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator().py16())


            ],
          ),
        ),
      ),
    );
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.bold.color(Colors.black38).make(),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/cart");
            },
            child: Container(
                child:
                Icon(CupertinoIcons.cart,size: 40,).box.alignBottomRight.make()
            ),
          )

    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context,index){
          final catalog=CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(
            catalog.image,
          ).box.color(MyTheme.creamColor).roundedLg.make().p16().w32(context),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.name.text.bold.make(),
                catalog.desc.text.color(Colors.black45).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.make(),
                    ElevatedButton(
                      onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            MyTheme.darkBluishColor,
                          ),
                          shape: MaterialStateProperty.all(
                            StadiumBorder()
                          ),
                        ),
                        child:
                          "Buy".text.white.make()
                    ),
                  ],
                )
              ],
            ),
          )

        ],
      )
    ).white.square(150).roundedLg.make().p8();
  }
}

