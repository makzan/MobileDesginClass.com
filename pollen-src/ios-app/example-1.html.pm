#lang pollen

◊headline{Label and Input}

We take a look at the text input and display in this example.



◊(ioscode
◊objc{
  NSString *value = [label text];
  NSLog(value);
}
◊swift{
  var value:string = label.text
  NSLog(value);
}
)