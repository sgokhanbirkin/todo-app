part of 'todos_homepage_view.dart';

class AddTodoView extends StatelessWidget {
  const AddTodoView({Key? key}) : super(key: key);
  final String data = 'Add Todo';

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return BlocProvider(
      create: (context) => TodoCrudCubit(),
      child: BlocConsumer<TodoCrudCubit, TodoCrudState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(data),
            ),
            body: Column(
              children: [
                Center(
                  child: Padding(
                    padding: context.paddingLow,
                    child: Form(
                      child: TodoAddTextFormFieldWidget(
                        textController: textController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<TodoCrudCubit>(context).addTodo(textController.text);
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => const TodosHomePageView()), (route) => false);
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
