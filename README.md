
- A great flutter and efficacious package for an aesthetic text hover effect


## Usage

To use this package, add `text_hover` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Demo
![](assets/demo.gif)

## Example

- Import the library

```dart
import 'package:text_hover/text_hover.dart';
```

- In order to use this package, we just need to give the `TextHover` widget a text with a config.
- `Config` is used to configure the hover effect and has `duration`,`letterWidth`, `hoverColor`, `textColor`, `duration`, `expand` properties

```dart
TextHover(
  text: 'Aesthetic',
  config: Config(
   hoverColor: Colors.orangeAccent
),
)
```

## Documentation

### `TextHover` properties

| Name              | Type                     |  Default | Description |
|-------------------|--------------------------|---|--|
| text              | `String`                   | required|the text to apply the hover effect on |
| config            | `Config`                 | required | configuration of the hover effect |


Now enjoy!

**Refer to [example folder](example/lib/main.dart) and the source code for more information.**

## Acknowledgement

- I would like to thank David Philips [Philip Davis](https://twitter.com/philipcdavis) for the inspiration for this library, which I think will be useful for Flutter community.
