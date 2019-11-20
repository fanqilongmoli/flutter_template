import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List _tabs = ["Message", "Contacts", "Settings"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: false,
        elevation: 10,
        // appbar 打开drawer
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        // appbar 上的tab
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          tabs: _tabs.map((e) => Tab(text: e)).toList(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          // 隐藏的菜单
          new PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              this.SelectView(Icons.message, '发起群聊', 'A'),
              this.SelectView(Icons.group_add, '添加服务', 'B'),
              this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case 'A': break;
                case 'B': break;
                case 'C': break;
              }
            },
          ),
        ],
      ),

      /// 侧边栏 drawer
      drawer: DrawerWidget(),
      endDrawer: DrawerWidget(),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 3),
          );
        }).toList(),
      ),

      /// 底部的NavigationBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text("Message")),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text("Contacts")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings"))
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          _tabController.animateTo(index);
        },
      ),
    );
  }

  // 返回每个隐藏的菜单项
  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        )
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar.jpg",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "fltter",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Location'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.mouse),
                    title: const Text('Mouse'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.perm_device_information),
                    title: const Text('Device'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


