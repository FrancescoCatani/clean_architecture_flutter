# clean_architecture

clean_architecture package allows to initialize clean architecture in your project.

## Install:

```bash
$ pub global activate clean_architecture
```

## Usage

Type in terminal:

```bash
clean_architecture param project_path
```

## Params:

\* - required

- `generate` * - allows you to generate clean architecture in your project.

- `module` * - allows you to create a module in your project.

    - `name` * - is the name of the module

- `project_path` * - is the path of your project.

## Example

Initialize the clean architecture in in the project path /Users/user/Desktop/project_example

```bash
flutter pub global run clean_architecture generate /Users/user/Desktop/project_example
```
Create module in the project path /Users/user/Desktop/project_example

```bash
flutter pub global run clean_architecture module employee /Users/user/Desktop/project_example
```

Generates:
```
lib
└───data
│   └─── data_sources
│   └─── environments
│   └─── repositories
│───domain
│   └─── repositories
│
└───shared
    └─── utils
    └─── widgets
```

Core module is generated under the class Core instantiable with method initialize(). See more in https://github.com/PalaTeam/flutter_core.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
