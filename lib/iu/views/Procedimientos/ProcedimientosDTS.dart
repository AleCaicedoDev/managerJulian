import 'package:flutter/material.dart';
import 'package:managerapp/Provider/Procedimientos/ProcedimientosProvider.dart';
import 'package:managerapp/modelo/Procedimientos/ProcedimientosModels.dart';

class ProcedimientosDTS extends DataTableSource {
  final List<Procedimiento> procedimiento;
  final BuildContext context;
  final ProcedimientosProvider provider;

  ProcedimientosDTS(
    this.procedimiento,
    this.context,
    this.provider,
  );

  @override
  DataRow getRow(int index) {
    final procedimientos = procedimiento[index];
    // final size = MediaQuery.of(context).size;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(procedimientos.procedimiento!)),
      // DataCell(Expanded(
      //   child: Container(
      //       width: size.width * 0.4,
      //       child: Text(
      //           maxLines: 2,
      //           overflow: TextOverflow.ellipsis,
      //           procedimientos.descripcion!)),
      // )),
      DataCell(Text(procedimientos.cuerpo!)),
      DataCell(Text(procedimientos.tipo!)),
      DataCell(Container(
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Color(int.parse("0x50${procedimientos.colorEstado}"))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xff${procedimientos.colorEstado}")),
                  borderRadius: BorderRadius.circular(150)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(procedimientos.estado!,
                style: TextStyle(
                    fontSize: 13,
                    color:
                        Color(int.parse("0xff${procedimientos.colorEstado}"))))
          ],
        ),
      )),
      const DataCell(Row(
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.delete_outline_rounded,
            color: Colors.red,
          )
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => procedimiento.length;

  @override
  int get selectedRowCount => 0;
}
