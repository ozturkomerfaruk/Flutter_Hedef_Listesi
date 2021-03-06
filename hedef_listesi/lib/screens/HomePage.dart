import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hedef_listesi/modals/color_theme_data.dart';
import 'package:hedef_listesi/modals/items_data.dart';
import 'package:provider/provider.dart';
import '../widgets/item_card.dart';
import '../screens/item_adder.dart';
import './settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                //height: 150,
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${Provider.of<ItemData>(context).items.length} Items',
                style: Theme.of(context).textTheme.headline3,
              ),
            )),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Consumer<ItemData>(
                    builder: (context, itemData, child) => Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: itemData.items.length,
                          itemBuilder: (context, index) => ItemCard(
                                title: itemData.items[index].title,
                                isDone: itemData.items[index].isDone,
                                toggleStatus: (_) {
                                  itemData.toggleStatus(index);
                                },
                                deleteItem: (_) {
                                  itemData.deleteItem(index);
                                },
                              )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: const [
                Text(
                  "??mer Faruk ??zt??rk",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "iletisim@ozturkomerfaruk.com",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: buildFAB(context),
    );
  }

  FloatingActionButton buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            //isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            context: context,
            builder: (context) => SingleChildScrollView(child: ItemAdder()));
      },
      child: Icon(Icons.add),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.settings,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        )
      ],
      title: Text(
        'Hedef Listesi',
      ),
    );
  }
}
