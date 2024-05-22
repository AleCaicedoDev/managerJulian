import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:managerapp/Widgets/textSeparator.dart';
import 'package:provider/provider.dart';

import '../routes/router.dart';
import '../services/navigationService.dart';
import '../services/sideMenuProvide.dart';
import 'menuItems.dart';
import 'menuItemsSgv.dart';

class Siderbar extends StatelessWidget {
  const Siderbar({super.key});
  void _navigateTo(String rutename) {
    NavigationService.replaceTo(rutename);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 5,
      child: Container(
          width: 230,
          height: size.height,
          decoration: const BoxDecoration(color: Color(0xff1B4F72), boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
            ),
          ]),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                height: 100,
              ),
              const TextSeparator(text: 'Administrativo'),
              MenuItems(
                text: 'Usuario',
                icon: Icons.face,
                onPressd: () => _navigateTo(Flurorouter.usuarioRoute),
                isActive:
                    sideMenuProvider.currentPage == Flurorouter.usuarioRoute,
              ),
              MenuItems(
                text: 'Pacientes',
                icon: Icons.group_outlined,
                onPressd: () => _navigateTo(Flurorouter.clientesRoute),
                isActive:
                    sideMenuProvider.currentPage == Flurorouter.clientesRoute,
              ),
              const TextSeparator(text: 'Procedimientos'),
              MenuItemsSgv(
                text: 'Procedimientos',
                icon: SvgPicture.asset(
                  'img/bisturi.svg',
                ),
                onPressd: () => _navigateTo(Flurorouter.procedimientosRoute),
                isActive: sideMenuProvider.currentPage ==
                    Flurorouter.procedimientosRoute,
              ),
              MenuItems(
                text: 'Pedidos',
                icon: Icons.newspaper_outlined,
                onPressd: () => _navigateTo(Flurorouter.pedidosRoute),
                isActive:
                    sideMenuProvider.currentPage == Flurorouter.pedidosRoute,
              ),
            ],
          )),
    );
  }
}
