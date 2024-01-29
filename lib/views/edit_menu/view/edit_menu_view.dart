import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_book/views/edit_menu/bloc/edit_menu_bloc.dart';
import 'package:recipes_book/views/edit_menu/widgets/widgets.dart';
import 'package:recipes_repository/recipes_repository.dart';

class EditMenuPage extends StatelessWidget {
  const EditMenuPage({required this.menu, super.key});

  final Menu menu;

  static Route<void> route({required Menu menu}) {
    return MaterialPageRoute(
      builder: (context) => EditMenuPage(menu: menu),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditMenuBloc(
        recipesRepository: context.read<RecipesRepository>(),
        menu: menu,
      ),
      child: BlocListener<EditMenuBloc, EditMenuState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) async {
          if (state.status == EditMenuStatus.success) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('บันทึกข้อมูลแล้ว'),
                ),
              );
            Navigator.of(context).pop();
          } else if (state.status == EditMenuStatus.failure) {
            await showDialog<void>(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('บันทึกล้มเหลว'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!state.validateName) const Text('* กรุณาตั้งชื่อเมนู'),
                    if (!state.validateRecipeList)
                      const Text('* ต้องเพิ่มสูตรอย่างน้อย 1 รายการ'),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      context.read<EditMenuBloc>().add(
                            const UpdateEditMenuStatus(EditMenuStatus.initial),
                          );
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('ตกลง'),
                  ),
                ],
              ),
            );
          }
        },
        child: const EditMenuView(),
      ),
    );
  }
}

class EditMenuView extends StatelessWidget {
  const EditMenuView({super.key});

  final title = 'เพิ่มเมนูใหม่';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<EditMenuBloc>().add(
                const EditMenuSubmitted(),
              );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.done),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          final state = context.read<EditMenuBloc>().state;
          final newMenu = Menu(
            image: state.imagePath,
            category: state.category,
            name: state.name,
            recipeList: [
              ...state.recipeHotList,
              ...state.recipeIceList,
              ...state.recipeFrappeList,
            ],
            id: state.menu.id,
          );
          if (state.menu == newMenu) {
            Navigator.pop(context);
          } else {
            await showDialog<bool>(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('ละทิ้งการเปลี่ยนแปลง?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('ยกเลิก'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      Navigator.pop(context);
                    },
                    child: const Text('ตกลง'),
                  ),
                ],
              ),
            );
          }
        },
        child: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            // Image(
            //     image: FileImage(File(
            //         '/data/user/0/com.example.verygoodcore.recipes_book.dev/app_flutter/image1.jpg'))),
            MenuSection(),
            OptionsSection(),
          ],
        ),
      ),
    );
  }
}
