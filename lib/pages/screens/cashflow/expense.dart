import 'package:cocreator/pages/screens/cashflow/widgets/card_total_expense.dart';
import 'package:cocreator/pages/screens/cashflow/widgets/dropdown_buttons.dart';
import 'package:cocreator/pages/screens/cashflow/widgets/list_tile_expense.dart';
import 'package:flutter/cupertino.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CardTotaExpense(),
        SizedBox(
          height: 20,
        ),
        DropButtons(),
        ListtileExpense()
      ],
    );
  }
}
