import 'package:hive/hive.dart';
import 'package:multitask/home_screen_components/dropdown_menu.dart';
import 'package:xml/xml.dart' as xml;
import 'lesson.dart';

class LessonWrite {
  List<Lesson> lessons = [];

  void saveLesson(xml.XmlDocument document) async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(LessonAdapter());
    }
    final box = await Hive.openBox<Lesson>('lesson_box');

    try {
      var group = document.findAllElements('Group')
        .firstWhere((element) => element.getAttribute('Number') == selectedItem);

      if (group == null) {
        print("Группа с номером О721Б не найдена.");
        return;
      }

      for (var element in group.findAllElements('Lesson')) {
        String dayTitle = element.findElements('DayTitle').isNotEmpty
            ? element.findElements('DayTitle').single.text
            : '';
        int weekCode = element.findElements('WeekCode').isNotEmpty
            ? int.parse(element.findElements('WeekCode').single.text)
            : 0;
        String timeString = element.findElements('Time').isNotEmpty
            ? element.findElements('Time').single.text
            : '';
        List<String> timeParts = timeString.split(' ');
        String time = timeParts.isNotEmpty ? timeParts[0] : '00:00';
        String discipline = element.findElements('Discipline').isNotEmpty
            ? element.findElements('Discipline').single.text
            : '';
        String lecturer = element.findElements('Lecturers').isNotEmpty &&
                element.findElements('Lecturers').single.findElements('Lecturer').isNotEmpty &&
                element.findElements('Lecturers').single.findElements('Lecturer').single.findElements('ShortName').isNotEmpty
            ? element.findElements('Lecturers').single.findElements('Lecturer').single.findElements('ShortName').single.text
            : '';
        String classroom = element.findElements('Classroom').isNotEmpty
            ? element.findElements('Classroom').single.text.trim()
            : '';

        lessons.add(Lesson(
          dayTitle: dayTitle,
          weekCode: weekCode,
          time: time,
          discipline: discipline,
          lecturer: lecturer,
          classroom: classroom,
        ));
      }

      // Вывод всех уроков для проверки
      for (var lesson in lessons) {
        print(lesson);
      }

      await box.addAll(lessons);
    } catch (e) {
      print("Ошибка при сохранении уроков: $e");
    }
  }
}
