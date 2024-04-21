var p = Point(2, 2);

// Get the value of y.
assert(p.y == 2);

// Invoke distanceTo() on p.
double distance = p.distanceTo(Point(4, 4));
// If p is non-null, set a variable equal to its y value.
var a = p?.y;
var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});
var p1 = new Point(2, 2);
var p2 = new Point.fromJson({'x': 1, 'y': 2});
var p = const ImmutablePoint(2, 2);
var a = const ImmutablePoint(1, 1);
var b = const ImmutablePoint(1, 1);

assert(identical(a, b)); // They are the same instance!
// Lots of const keywords here.
const pointAndLine = const {
'point': const [const ImmutablePoint(0, 0)],
'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};
// Only one const, which establishes the constant context.
const pointAndLine = {
'point': [ImmutablePoint(0, 0)],
'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
};
var a = const ImmutablePoint(1, 1); // Creates a constant
var b = ImmutablePoint(1, 1); // Does NOT create a constant

assert(!identical(a, b)); // NOT the same instance!
print('The type of a is ${a.runtimeType}');
class Point {
double? x; // Declare instance variable x, initially null.
double? y; // Declare y, initially null.
double z = 0; // Declare z, initially 0.
}
class Point {
double? x; // Declare instance variable x, initially null.
double? y; // Declare y, initially null.
}

void main() {
var point = Point();
point.x = 4; // Use the setter method for x.
assert(point.x == 4); // Use the getter method for x.
assert(point.y == null); // Values default to null.
}
double initialX = 1.5;

class Point {
// OK, can access declarations that do not depend on `this`:
double? x = initialX;

// ERROR, can't access `this` in non-`late` initializer:
double? y = this.x;

// OK, can access `this` in `late` initializer:
late double? z = this.x;

// OK, `this.fieldName` is a parameter declaration, not an expression:
Point(this.x, this.y);
}
class ProfileMark {
final String name;
final DateTime start = DateTime.now();

ProfileMark(this.name);
ProfileMark.unnamed() : name = '';
}
// A person. The implicit interface contains greet().
class Person {
// In the interface, but visible only in this library.
final String _name;

// Not in the interface, since this is a constructor.
Person(this._name);

// In the interface.
String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
String get _name => '';

String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
print(greetBob(Person('Kathy')));
print(greetBob(Impostor()));
}
class Point implements Comparable, Location {...}
class Queue {
static const initialCapacity = 16;
// ···
}

void main() {
assert(Queue.initialCapacity == 16);
}
import 'dart:math';

class Point {
double x, y;
Point(this.x, this.y);

static double distanceBetween(Point a, Point b) {
var dx = a.x - b.x;
var dy = a.y - b.y;
return sqrt(dx * dx + dy * dy);
}
}

void main() {
var a = Point(2, 2);
var b = Point(4, 4);
var distance = Point.distanceBetween(a, b);
assert(2.8 < distance && distance < 2.9);
print(distance);
}
class Point {
double x = 0;
double y = 0;

// Generative constructor with initializing formal parameters:
Point(this.x, this.y);
}
class Point {
final double x;
final double y;

// Sets the x and y instance variables
// before the constructor body runs.
Point(this.x, this.y);
}
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
final double x;
final double y;

// Sets the x and y instance variables
// before the constructor body runs.
Point(this.x, this.y);

// Named constructor
Point.origin()
    : x = xOrigin,
y = yOrigin;
}
class Employee extends Person {
Employee() : super.fromJson(fetchDefaultData());
// ···
}
class Vector2d {
final double x;
final double y;

Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
final double z;

// Forward the x and y parameters to the default super constructor like:
// Vector3d(final double x, final double y, this.z) : super(x, y);
Vector3d(super.x, super.y, this.z);
}
class Vector2d {
// ...

Vector2d.named({required this.x, required this.y});
}

class Vector3d extends Vector2d {
// ...

// Forward the y parameter to the named super constructor like:
// Vector3d.yzPlane({required double y, required this.z})
//       : super.named(x: 0, y: y);
Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}
// Initializer list sets instance variables before
// the constructor body runs.
Point.fromJson(Map<String, double> json)
    : x = json['x']!,
y = json['y']! {
print('In Point.fromJson(): ($x, $y)');
}
Point.withAssert(this.x, this.y) : assert(x >= 0) {
print('In Point.withAssert(): ($x, $y)');
}
class Point {
double x, y;

// The main constructor for this class.
Point(this.x, this.y);

// Delegates to the main constructor.
Point.alongXAxis(double x) : this(x, 0);
}
class ImmutablePoint {
static const ImmutablePoint origin = ImmutablePoint(0, 0);

final double x, y;

const ImmutablePoint(this.x, this.y);
}
class Logger {
final String name;
bool mute = false;

// _cache is library-private, thanks to
// the _ in front of its name.
static final Map<String, Logger> _cache = <String, Logger>{};

factory Logger(String name) {
return _cache.putIfAbsent(name, () => Logger._internal(name));
}

factory Logger.fromJson(Map<String, Object> json) {
return Logger(json['name'].toString());
}

Logger._internal(this.name);

void log(String msg) {
if (!mute) print(msg);
}
}
var logger = Logger('UI');
logger.log('Button clicked');

var logMap = {'name': 'UI'};
var loggerJson = Logger.fromJson(logMap);
import 'dart:math';

class Point {
final double x;
final double y;

// Sets the x and y instance variables
// before the constructor body runs.
Point(this.x, this.y);

double distanceTo(Point other) {
var dx = x - other.x;
var dy = y - other.y;
return sqrt(dx * dx + dy * dy);
}
}
class Vector {
final int x, y;

Vector(this.x, this.y);

Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

@override
bool operator ==(Object other) =>
other is Vector && x == other.x && y == other.y;

@override
int get hashCode => Object.hash(x, y);
}

void main() {
final v = Vector(2, 3);
final w = Vector(2, 2);

assert(v + w == Vector(4, 5));
assert(v - w == Vector(0, 1));
}
class Rectangle {
double left, top, width, height;

Rectangle(this.left, this.top, this.width, this.height);

// Define two calculated properties: right and bottom.
double get right => left + width;
set right(double value) => left = value - width;
double get bottom => top + height;
set bottom(double value) => top = value - height;
}

void main() {
var rect = Rectangle(3, 4, 20, 15);
assert(rect.left == 3);
rect.right = 12;
assert(rect.left == -8);
}
abstract class Doer {
// Define instance variables and methods...

void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
void doSomething() {
// Provide an implementation, so the method is not abstract here...
}
}
class Television {
void turnOn() {
_illuminateDisplay();
_activateIrSensor();
}
// ···
}

class SmartTelevision extends Television {
void turnOn() {
super.turnOn();
_bootNetworkInterface();
_initializeMemory();
_upgradeApps();
}
// ···
}
class Television {
// ···
set contrast(int value) {...}
}

class SmartTelevision extends Television {
@override
set contrast(num value) {...}
// ···
}
class A {
// Unless you override noSuchMethod, using a
// non-existent member results in a NoSuchMethodError.
@override
void noSuchMethod(Invocation invocation) {
print('You tried to use a non-existent member: '
'${invocation.memberName}');
}
}
class Musician extends Performer with Musical {
// ···
}

class Maestro extends Person with Musical, Aggressive, Demented {
Maestro(String maestroName) {
name = maestroName;
canConduct = true;
}
}
mixin Musical {
bool canPlayPiano = false;
bool canCompose = false;
bool canConduct = false;

void entertainMe() {
if (canPlayPiano) {
print('Playing piano');
} else if (canConduct) {
print('Waving hands');
} else {
print('Humming to self');
}
}
}
class Musician {
// ...
}
mixin MusicalPerformer on Musician {
// ...
}
class SingerDancer extends Musician with MusicalPerformer {
// ...
}
abstract mixin class Musician {
// No 'on' clause, but an abstract method that other types must define if
// they want to use (mix in or extend) Musician:
void playInstrument(String instrumentName);

void playPiano() {
playInstrument('Piano');
}
void playFlute() {
playInstrument('Flute');
}
}

class Virtuoso with Musician { // Use Musician as a mixin
void playInstrument(String instrumentName) {
print('Plays the $instrumentName beautifully');
}
}

class Novice extends Musician { // Use Musician as a class
void playInstrument(String instrumentName) {
print('Plays the $instrumentName poorly');
}
}
enum Color { red, green, blue }
enum Vehicle implements Comparable<Vehicle> {
car(tires: 4, passengers: 5, carbonPerKilometer: 400),
bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

const Vehicle({
required this.tires,
required this.passengers,
required this.carbonPerKilometer,
});

final int tires;
final int passengers;
final int carbonPerKilometer;

int get carbonFootprint => (carbonPerKilometer / passengers).round();

bool get isTwoWheeled => this == Vehicle.bicycle;

@override
int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
final favoriteColor = Color.blue;
if (favoriteColor == Color.blue) {
print('Your favorite color is blue!');
}
assert(Color.red.index == 0);
assert(Color.green.index == 1);
assert(Color.blue.index == 2);
List<Color> colors = Color.values;
assert(colors[2] == Color.blue);
var aColor = Color.blue;

switch (aColor) {
case Color.red:
print('Red as roses!');
case Color.green:
print('Green as grass!');
default: // Without this, you see a WARNING.
print(aColor); // 'Color.blue'
}
print(Color.blue.name); // 'blue'
print(Vehicle.car.carbonFootprint);
int.parse('42')
'42'.parseInt()
import 'string_apis.dart';
// ···
print('42'.parseInt()); // Use an extension method.
extension NumberParsing on String {
int parseInt() {
return int.parse(this);
}
// ···
}
// Import a library that contains an extension on String.
import 'string_apis.dart';
// ···
print('42'.padLeft(5)); // Use a String method.
print('42'.parseInt()); // Use an extension method.
dynamic d = '2';
print(d.parseInt()); // Runtime exception: NoSuchMethodError
var v = '2';
print(v.parseInt()); // Output: 2
// Defines the String extension method parseInt().
import 'string_apis.dart';

// Also defines parseInt(), but hiding NumberParsing2
// hides that extension method.
import 'string_apis_2.dart' hide NumberParsing2;

// ···
// Uses the parseInt() defined in 'string_apis.dart'.
print('42'.parseInt());
// Both libraries define extensions on String that contain parseInt(),
// and the extensions have different names.
import 'string_apis.dart'; // Contains NumberParsing extension.
import 'string_apis_2.dart'; // Contains NumberParsing2 extension.

// ···
// print('42'.parseInt()); // Doesn't work.
print(NumberParsing('42').parseInt());
print(NumberParsing2('42').parseInt());
// Both libraries define extensions named NumberParsing
// that contain the extension method parseInt(). One NumberParsing
// extension (in 'string_apis_3.dart') also defines parseNum().
import 'string_apis.dart';
import 'string_apis_3.dart' as rad;

// ···
// print('42'.parseInt()); // Doesn't work.

// Use the ParseNumbers extension from string_apis.dart.
print(NumberParsing('42').parseInt());

// Use the ParseNumbers extension from string_apis_3.dart.
print(rad.NumberParsing('42').parseInt());

// Only string_apis_3.dart has parseNum().
print('42'.parseNum());
extension <extension name>? on <type> {
(<member definition>)*
}
extension NumberParsing on String {
int parseInt() {
return int.parse(this);
}

double parseDouble() {
return double.parse(this);
}
}
extension on String {
bool get isBlank => trim().isEmpty;
}
extension MyFancyList<T> on List<T> {
int get doubleLength => length * 2;
List<T> operator -() => reversed.toList();
List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
extension type IdNumber(int id) {
// Wraps the 'int' type's '<' operator:
operator <(IdNumber other) => id < other.id;
// Doesn't declare the '+' operator, for example,
// because addition does not make sense for ID numbers.
}

void main() {
// Without the discipline of an extension type,
// 'int' exposes ID numbers to unsafe operations:
int myUnsafeId = 42424242;
myUnsafeId = myUnsafeId + 10; // This works, but shouldn't be allowed for IDs.

var safeId = IdNumber(42424242);
safeId + 10; // Compile-time error: No '+' operator.
myUnsafeId = safeId; // Compile-time error: Wrong type.
myUnsafeId = safeId as int; // OK: Run-time cast to representation type.
safeId < IdNumber(42424241); // OK: Uses wrapped '<' operator.
}
extension type E(int i) {
// Define set of operations.
}
extension type E<T>(List<T> elements) {
// ...
}
extension type E(int i) {
E.n(this.i);
E.m(int j, String foo) : i = j + foo.length;
}

void main() {
E(4); // Implicit unnamed constructor.
E.n(3); // Named constructor.
E.m(5, "Hello!"); // Named constructor with additional parameters.
}
extension type const E._(int it) {
E(): this._(42);
E.otherName(this.it);
}

void main2() {
E();
const E._(2);
E.otherName(3);
}
extension type E._(int i) {
E.fromString(String foo) : i = int.parse(foo);
}
extension type NumberE(int value) {
// Operator:
NumberE operator +(NumberE other) =>
NumberE(value + other.value);
// Getter:
NumberE get myNum => this;
// Method:
bool isValid() => !value.isNegative;
}
extension type NumberI(int i)
implements int{
// 'NumberI' can invoke all members of 'int',
// plus anything else it declares here.
}
extension type Sequence<T>(List<T> _) implements Iterable<T> {
// Better operations than List.
}

extension type Id(int _id) implements Object {
// Makes the extension type non-nullable.
static Id? tryParse(String source) => int.tryParse(source) as Id?;
}
extension type const Opt<T>._(({T value})? _) {
const factory Opt(T value) = Val<T>;
const factory Opt.none() = Non<T>;
}
extension type const Val<T>._(({T value}) _) implements Opt<T> {
const Val(T value) : this._((value: value));
T get value => _.value;
}
extension type const Non<T>._(Null _) implements Opt<Never> {
const Non() : this._(null);
}
extension type MyString(String _) implements String {
// Replaces 'String.operator[]'
@redeclare
int operator [](int index) => codeUnitAt(index);
}
extension type NumberE(int value) {
NumberE operator +(NumberE other) =>
NumberE(value + other.value);

NumberE get next => NumberE(value + 1);
bool isValid() => !value.isNegative;
}

void testE() {
var num = NumberE(1);
}
extension type NumberT(int value)
implements int {
// Doesn't explicitly declare any members of 'int'.
NumberT get i => this;
}

void main () {
// All OK: Transparency allows invoking `int` members on the extension type:
var v1 = NumberT(1); // v1 type: NumberT
int v2 = NumberT(2); // v2 type: int
var v3 = v1.i - v1;  // v3 type: int
var v4 = v2 + v1; // v4 type: int
var v5 = 2 + v1; // v5 type: int
// Error: Extension type interface is not available to representation type
v2.i;
}
void testE() {
var num1 = NumberE(1);
int num2 = NumberE(2); // Error: Can't assign 'NumberE' to 'int'.

num1.isValid(); // OK: Extension member invocation.
num1.isNegative(); // Error: 'NumberE' does not define 'int' member 'isNegative'.

var sum1 = num1 + num1; // OK: 'NumberE' defines '+'.
var diff1 = num1 - num1; // Error: 'NumberE' does not define 'int' member '-'.
var diff2 = num1.value - 2; // OK: Can access representation object with reference.
var sum2 = num1 + 2; // Error: Can't assign 'int' to parameter type 'NumberE'.

List<NumberE> numbers = [
NumberE(1),
num1.next, // OK: 'next' getter returns type 'NumberE'.
1, // Error: Can't assign 'int' element to list type 'NumberE'.
];
}
void main() {
var n = NumberE(1);

// Run-time type of 'n' is representation type 'int'.
if (n is int) print(n.value); // Prints 1.

// Can use 'int' methods on 'n' at run time.
if (n case int x) print(x.toRadixString(10)); // Prints 1.
switch (n) {
case int(:var isEven): print("$n (${isEven ? "even" : "odd"})"); // Prints 1 (odd).
}
}
void main() {
int i = 2;
if (i is NumberE) print("It is"); // Prints 'It is'.
if (i case NumberE v) print("value: ${v.value}"); // Prints 'value: 2'.
switch (i) {
case NumberE(:var value): print("value: $value"); // Prints 'value: 2'.
}
}