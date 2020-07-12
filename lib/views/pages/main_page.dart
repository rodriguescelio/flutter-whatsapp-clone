import 'package:flutter/material.dart';
import 'package:whatsapp/models/objs/tab_item.dart';
import 'package:whatsapp/views/pages/add_contact_page.dart';
import 'package:whatsapp/views/pages/calls_page.dart';
import 'package:whatsapp/views/pages/conversations_page.dart';
import 'package:whatsapp/views/pages/status_page.dart';

class MainPage extends StatefulWidget {
  final List<TabItem> _items = [
    TabItem(Tab(text: 'Conversas'), ConversationsPage(), Icon(Icons.message)),
    TabItem(Tab(text: 'Status'), StatusPage(), Icon(Icons.camera_alt)),
    TabItem(Tab(text: 'Chamadas'), CallsPage(), Icon(Icons.add_call)),
  ];

  @override
  _MainPageState createState() => _MainPageState(_items);
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  List<TabItem> _items;

  _MainPageState(this._items);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _items.length, vsync: this);
    _tabController.addListener(_onTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentIndex = _tabController.index;
      });
    }
  }

  void _addUser(rootContext) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Adicionar Contato'),
        content: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'nickname',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () => null,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text('Adicionar'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddContactPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _items.map((it) => it.bar).toList(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            onPressed: () => _addUser(context),
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () => null,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: _items.map((it) => it.view).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: _items[_currentIndex].fabIcon,
      ),
    );
  }
}
