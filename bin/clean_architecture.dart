import 'dart:io';
import 'package:path/path.dart' as path;

Future main(List<String> args) {
  try {
    switch (args[0]) {
      case 'generate':
        {
          var projectFolder = args[1];
          generateCleanArchitecture(projectFolder);
        }
        break;

      case 'module':
        {
          if (args[1] == null) {
            print('You must pass a module name.');
            exit(0);
          }
          else if (args[2] == null) {
            print('You must pass a folder of the project');
            exit(0);
          }
          var moduleName = args[1];
          var projectFolder = args[2];
          generateModule(projectFolder,moduleName);
        }
        break;
    }
  } catch (e) {
    print("You must pass args:\n -gen  to generate clean architecture\n -module name  to create a module");
  }
}

void generateCleanArchitecture(String projectFolder) async {

  File file = new File('pubspec.yaml');

  List<String> lines = file.readAsLinesSync();

  for(int i=0; i<lines.length; i++)
    if(lines[i].contains('sdk: flutter') == true)
    {
      lines.insert(i,"  flutter_core:");
    }

  Directory.current = Directory('$projectFolder/lib');

  await Directory("data").create().then((data) async {
    await Directory('${data.path}/data_sources')
        .create()
        .then((file) => File('${file.path}/.gitkeep').create());
    await Directory('${data.path}/environments')
        .create()
        .then((file) => File('${file.path}/.gitkeep').create());
    await Directory('${data.path}/repositories')
        .create()
        .then((file) => File('${file.path}/.gitkeep').create());
  });

  await Directory("domain").create().then((data) async {
    await Directory('${data.path}/repositories')
        .create()
        .then((file) => File('${file.path}/.gitkeep').create());
  });

  await Directory("shared").create().then((data) async {
    await Directory('${data.path}/utils')
        .create()
        .then((file) => File('${file.path}/.gitkeep').create());
    await Directory('${data.path}/widgets')
        .create()
        .then((file) => File('${file.path}/.gitkeep').create());
  });

}

void generateModule(String projectFolder, String moduleName) async {
  Directory.current = Directory('$projectFolder/lib');

  await Directory('$moduleName').create().then((data) async {
    await Directory('${data.path}/domain').create().then((sub) async {
      await Directory('${sub.path}/use_cases').create().then((file) async {
        File('${file.path}/.gitkeep').create();
      });
    });

    await Directory('${data.path}/presentation').create().then((sub) async {
      await Directory('${sub.path}/pages').create().then((file) async {
        File('${file.path}/.gitkeep').create();
      });
      await Directory('${sub.path}/providers').create().then((file) async {
        File('${file.path}/.gitkeep').create();
      });
      await Directory('${sub.path}/widgets').create().then((file) async {
        File('${file.path}/.gitkeep').create();
      });
    });
  });
}

