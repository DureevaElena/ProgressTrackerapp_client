import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/api/note/stagenode_api.dart';
import 'package:simpleengineering/model/note_model.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/etap/create_stagenote.dart';
import 'package:simpleengineering/pages/home/etap/update_stagenote.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/home/note/view_note.dart';

class EtapNoteScreen extends StatefulWidget {
  final int noteId;
  final Note note;

  const EtapNoteScreen({super.key, required this.noteId, required this.note});

  @override
  State<EtapNoteScreen> createState() => _EtapNoteScreenState();
}

class _EtapNoteScreenState extends State<EtapNoteScreen> {
  late User user;
  List<StageNote> notestages = []; // Список этапов

  int totalNotes = 0;
  int totalDone1 = 0;
  int totalDone2 = 0;

  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().state;
    // Вызываем загрузку данных и вычисление общего количества этапов
    loadDataAndCalculateTotals();
  }

  Future<void> loadDataAndCalculateTotals() async {
    notestages = await getStageNotes(user, widget.noteId);
    calculateTotals();
    setState(() {}); // Перерисовываем виджет после загрузки данных
  }

 
  void calculateTotals() {
    totalNotes = notestages.length;
    totalDone1 = notestages.where((stagenote) => stagenote.done == 1).length;
    totalDone2 = notestages.where((stagenote) => stagenote.done == 2).length;

    // Логика для обновления статуса note в зависимости от этапов и даты завершения
    if (totalNotes == totalDone1) {
      widget.note.status = 3;
      updateNoteStatus(); // Вызываем метод для обновления статуса заметки
    } else if (totalNotes >= 0) {
      DateTime currentDate = DateTime.now();
      DateTime endDate = widget.note.dataend is DateTime
        ? widget.note.dataend as DateTime
        : currentDate;

      if (endDate.isAfter(currentDate)) {
        widget.note.status = 1; // Устанавливаем статус "Не завершено, но есть время"
      } else {
        widget.note.status = 2; // Устанавливаем статус "Не завершено, время истекло"
      }
      updateNoteStatus(); // Вызываем метод для обновления статуса заметки
    }
  }
  // Метод для обновления статуса заметки
  Future<void> updateNoteStatus() async {
    var success = await updateNote(
      user,
      widget.note
    );
    if (success) {
      setState(() {}); // Перерисовываем виджет после успешного обновления
    }
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.noteId;
    Note noteforcreatstage = widget.note;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),

        title: Text("Статус: ${noteforcreatstage.status}"),
        
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ViewNoteScreen(note: widget.note, user: user),
                        ),
                      );
                    },
                    child: const Text(
                      'Описание',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Этапы',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black,
                height: 2.0,
              ),
            ],
          ),
        ),
      ),
      body: notestages.isEmpty
          ? Center(
            child: Text(
              'Нет созданных этапов',
              style: TextStyle(fontSize: 20),
            ),
          )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Общее количество этапов: $totalNotes',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Этапы со статусом "done = 1": $totalDone1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Этапы со статусом "done = 2": $totalDone2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Статус note: ${noteforcreatstage.status}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),


                Expanded(
                  child: ListView.builder(
                    itemCount: notestages.length,
                    itemBuilder: (context, index) {
                      final notestage = notestages[index];
                      return ListTile(
                        leading: IconButton(
                          icon: Icon(
                            notestage.done == 1
                                ? Icons.check_circle_outline
                                : Icons.radio_button_unchecked,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (notestage.done == 1) {
                              notestage.done = 2;
                            } else {
                              notestage.done = 1;
                            }
                            var success =
                                await updateStageNote(user, notestage);
                            if (success) {
                              setState(() {});
                            }
                          },
                        ),
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
                            Text("${notestage.done}"),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateStageNoteScreen(
                                      noteId: id,
                                      note: noteforcreatstage,
                                      stageNote: notestage,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                bool? result = await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Подтвердите удаление"),
                                    content: Text(
                                        "Вы действительно хотите удалить этот этап?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text("Отмена"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: Text("Удалить"),
                                      ),
                                    ],
                                  ),
                                );
                                if (result == true) {
                                  var success =
                                      await deleteStageNote(user, notestage.id);
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
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  CreateStageNoteScreen(noteId: id, note: noteforcreatstage),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 25, 25, 230),
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

