import 'package:flutter/material.dart';
import 'package:managerapp/Provider/Clientes/ClientesProvider.dart';

import 'package:managerapp/modelo/Usuarios/UsuariosModels.dart';



class ClienteDTS extends DataTableSource {
  final List<Usuario> usuarios;
  final BuildContext context;
  final ClienteProvider provider;

  ClienteDTS(this.usuarios, this.context, this.provider);

  @override
  DataRow getRow(int index) {
    final usuario = usuarios[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${usuario.nombres!} ${usuario.apellidos}')),
      DataCell(Text(usuario.documento!)),
      DataCell(Text(usuario.correo!)),
      DataCell(Text(usuario.celular!)),
      DataCell(Text(usuario.rolname!)),
      DataCell(Container(
        width: 80,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Color(int.parse("0x50${usuario.colorEstado}"))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xff${usuario.colorEstado}")),
                  borderRadius: BorderRadius.circular(150)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(usuario.esta!,
                style: TextStyle(
                    fontSize: 13,
                    color: Color(int.parse("0xff${usuario.colorEstado}"))))
          ],
        ),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => usuarios.length;

  @override
  int get selectedRowCount => 0;
}
