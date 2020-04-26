---
layout: doc
menu_item: doc
title: Dependency Injection
docprev: Groups
docnext: Importing-libraries

---
Redstone.dart uses the [di package](http://pub.dartlang.org/packages/di) to provide dependency injection.

To register a module, use the `addModule()` method:

{% include code.func code="di.dart" %}

For methods annotated with `@Route`, you can inject objects using the `@Inject` annotation:

```dart
@app.Route('/service')
service(@app.Inject() ClassA objA) {
 ...
}
```

Groups can require objects using a constructor:

```dart
@app.Group('/group')
class Group {
  ClassA objA;
  
  Group(ClassA this.objA);
  
  @app.Route('/service')
  service() {
    // ...
  }
}
```

Interceptors and error handlers can also require dependencies:

```dart
@app.Interceptor(r'/services/.+')
interceptor(ClassA objA, ClassB objB) {
  // ...
}


@app.ErrorHandler(404)
notFound(ClassB objB) {
  // ...
}
```
