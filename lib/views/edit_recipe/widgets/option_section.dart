import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_recipe/bloc/edit_recipe_bloc.dart';

class OptionSection extends StatelessWidget {
  const OptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    // var optionNameValue = '';
    // final optionNameController = TextEditingController(text: optionNameValue);
    // context.select((EditRecipeBloc bloc) {
    //   log('[$optionNameValue] [${bloc.state.optionName}]');
    //   if (optionNameValue != bloc.state.optionName) {
    //     optionNameController.text = bloc.state.optionName;
    //   }
    // });

    final state = context.watch<EditRecipeBloc>().state;
    // log(state.optionName);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          TextFormField(
            initialValue: state.optionName,
            // controller: optionNameController,
            onChanged: (value) {
              // optionNameValue = value;
              context.read<EditRecipeBloc>().add(OptionNameOnChange(value));
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ชื่อตัวเลือก',
              floatingLabelStyle: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
