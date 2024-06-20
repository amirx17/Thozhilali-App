import 'dart:async';

class Carouselmodel {
  String id;
  String image;
  Carouselmodel(this.id,this.image);
}
class Categorymodel {
  String id;
  String image;
  String text;
  Categorymodel(this.id,this.image,this.text);
}
class Signupmodel {
  String id;
  String Name;
  String Address;
  String Phone;
  Signupmodel(this.id,this.Name,this.Address,this.Phone);
}
class Subcategorymodel{
  String id;
  String text;
  bool changecolor;
  Subcategorymodel(this.id,this.text,this.changecolor);
}
class Registrationmodel{
  String id;
  String name;
  String Age;
  String Experience;
  String Phonenmbr;
  String Whatsappnmbr;
  String Location;
  String  Image;
  String Jobtype;
 List  WorkerImage;
  Registrationmodel(this.id,this.name,this.Age,this.Experience,this.Phonenmbr,this.Whatsappnmbr,this.Location,this.Image,this.Jobtype,this.WorkerImage);
}































