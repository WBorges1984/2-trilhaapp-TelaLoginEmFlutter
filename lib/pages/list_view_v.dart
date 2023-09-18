import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class listViewVPage extends StatefulWidget {
  const listViewVPage({super.key});

  @override
  State<listViewVPage> createState() => _listViewVPageState();
}

class _listViewVPageState extends State<listViewVPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: Text("Usuario 2"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá mundo"),
              Text("15:19"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Opcão 1"),
                ),
                PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Opcão 2"),
                ),
                PopupMenuItem<String>(
                  value: "opcao1",
                  child: Text("Opcão 3"),
                ),
              ];
            },
          ),
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
