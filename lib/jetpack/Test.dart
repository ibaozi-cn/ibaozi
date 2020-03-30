class Html {
  Body body;
  Future<Body> body1({String width}) async => this.body = Body()..width = width;
}

class Body {
  String width;
}

void fun() {

}
