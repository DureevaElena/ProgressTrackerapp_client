import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/api/note/stagenode_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';

class EtapNoteScreen extends StatefulWidget {
  final int noteId;

  const EtapNoteScreen({super.key, required this.noteId});

  @override
  State<EtapNoteScreen> createState() => _EtapNoteScreenState();
}

class _EtapNoteScreenState extends State<EtapNoteScreen> {
  late User user;
  
  @override
  void initState() {
    user = context.read<UserCubit>().state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = context.read<UserCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Etap Note"),
      ),
      body: FutureBuilder<List<StageNote>>(
        future: getStageNotes(user, widget.noteId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<StageNote> notestages = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Exit",
                    style: TextStyle(color: const Color.fromARGB(255, 230, 10, 10)),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: notestages.length,
                  itemBuilder: (context, index) {
                    final notestage = notestages[index];
                    return ListTile(
                      title: Text(notestage.titlestage),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${notestage.id}"),
                          Text(notestage.authorstage.nickname),
                          Text("${notestage.idnote}"),
                          Text(
                            notestage.notestage.length > 20
                                ? notestage.notestage.substring(0, 20) + "..."
                                : notestage.notestage,
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Обработчик нажатия кнопки редактирования
                             
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              bool? result = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Подтвердите удаление"),
                                  content: Text("Вы действительно хотите удалить этот этап?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      child: Text("Отмена"),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(true),
                                      child: Text("Удалить"),
                                    ),
                                  ],
                                ),
                              );
                              if (result == true) {
                                // Обработчик нажатия кнопки удаления
                                var success = await deleteStageNote(user, notestage.id);
                                if (success) {
                                  setState(() {
                                    notestages.removeAt(index);
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
