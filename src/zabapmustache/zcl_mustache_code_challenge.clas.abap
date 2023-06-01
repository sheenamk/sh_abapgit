CLASS zcl_mustache_code_challenge DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

     INTERFACES if_oo_adt_classrun.

     TYPES:BEGIN OF ty_score,
       subject   TYPE string,
       marks(15) TYPE p DECIMALS 2,
       END OF ty_score,

     ty_score_tt TYPE STANDARD TABLE OF ty_score WITH DEFAULT KEY,

     BEGIN OF ty_student,
       name TYPE string,
       score TYPE ty_score_tt,
     END OF ty_student.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mustache_code_challenge IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

DATA lo_mustache TYPE REF TO zcl_mustache.
DATA lt_student_data TYPE STANDARD TABLE OF ty_student WITH DEFAULT KEY.
DATA lr_student TYPE REF TO ty_student.

APPEND INITIAL LINE TO lt_student_data REFERENCE INTO lr_student.
lr_student->name = 'Sheena'.
lr_student->score = VALUE ty_score_tt( ( subject = 'Mathematics' marks = '98')
                                       ( subject = 'Science'     marks = '97')
                                       ( subject = 'History'     marks = '92' ) ).

APPEND INITIAL LINE TO lt_student_data REFERENCE INTO lr_student.
lr_student->name = 'Deepthi'.
lr_student->score = VALUE ty_score_tt( ( subject = 'Mathematics' marks = '99')
                                       ( subject = 'Science'     marks = '98')
                                       ( subject = 'History'     marks = '95' ) ).

lo_mustache = zcl_mustache=>create(
     'Term II Results for {{name}}' && cl_abap_char_utilities=>newline &&
     '{{#score}}'                   && cl_abap_char_utilities=>newline &&
     '* {{subject}}  - {{marks}}'   && cl_abap_char_utilities=>newline &&
     '{{/score}}').

 out->write( lo_mustache->render( lt_student_data  ) ).

ENDMETHOD.

ENDCLASS.
