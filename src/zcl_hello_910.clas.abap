CLASS zcl_hello_910 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES IF_OO_ADT_CLASSRUN.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_910 IMPLEMENTATION.

METHOD IF_OO_ADT_CLASSRUN~main.
 out->write( |Hello World!| ).
ENDMETHOD.

ENDCLASS.
