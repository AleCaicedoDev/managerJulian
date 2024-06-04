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
              SizedBox(
                height: 10,
              ),
              const TextSeparator(text: 'Procedimientos'),
              MenuItemsSgv(
                text: 'Procedimientos',
                icon: SvgPicture.asset(
                  'img/bisturi.svg',
                  color: Colors.white.withOpacity(0.2),
                ),
                onPressd: () => _navigateTo(Flurorouter.procedimientosRoute),
                isActive: sideMenuProvider.currentPage ==
                    Flurorouter.procedimientosRoute,
              ),
              MenuItems(
                text: 'Recomendaciones',
                icon: Icons.fact_check_outlined,
                onPressd: () => _navigateTo(Flurorouter.recomendacionesRoute),
                isActive: sideMenuProvider.currentPage ==
                    Flurorouter.recomendacionesRoute,
              ),
              SizedBox(
                height: 10,
              ),
              const TextSeparator(text: 'Social'),
              MenuItems(
                text: 'Foros',
                icon: Icons.forum_outlined,
                onPressd: () => _navigateTo(Flurorouter.forosRoute),
                isActive:
                    sideMenuProvider.currentPage == Flurorouter.forosRoute,
              ),
              SizedBox(
                height: 10,
              ),
              const TextSeparator(text: 'Configuraciónes'),
              MenuItems(
                text: 'Centros',
                icon: Icons.forum_outlined,
                onPressd: () => _navigateTo(Flurorouter.centrosRoute),
                isActive:
                    sideMenuProvider.currentPage == Flurorouter.centrosRoute,
              ),
              MenuItems(
                text: 'Ubicaciones',
                icon: Icons.forum_outlined,
                onPressd: () => _navigateTo(Flurorouter.ubicacionesRoute),
                isActive: sideMenuProvider.currentPage ==
                    Flurorouter.ubicacionesRoute,
              ),
              Expanded(child: Container()),
              MenuItems(
                text: 'Ubicaciones',
                icon: Icons.forum_outlined,
                onPressd: () => _navigateTo(Flurorouter.ubicacionesRoute),
                isActive: sideMenuProvider.currentPage ==
                    Flurorouter.ubicacionesRoute,
              ),
            ],
          )),
    );
  }
}
