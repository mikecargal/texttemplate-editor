lexer grammar TextTemplateLexer;

TEXT: ~[{}]+ ;
LBRACE: '{' -> pushMode(BRACED);
E_RBRACE: '}' -> type(RBRACE);

mode BRACED;
IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]* ;
DOT: '.';
RBRACE: '}' -> popMode;
WS: [ \t\r\n]+ ->skip; // allow white space in braced
LP: '(' -> pushMode(PARENED);
E_RP: ')';
E_COMMA: ',' ->type(COMMA);
COLON : ':';
LBRACKET: '[' ->pushMode(BRACKETED);
E_QUOTE: '"' ->type(QUOTE);
E_ILLEGAL_BRACED: [!@#$%^&*-={;<>?/\\+]+;

mode PARENED;
ARGLBRACKET: '[' ->type(LBRACKET),pushMode(BRACKETED);	
ARGUMENTTEXT: ~[(),{}'" \t\r\n\u005b]+; // u005b left bracket
RP: ')' -> popMode;
QUOTE: '"' -> pushMode(QUOTED);
APOSTROPHE: '\'' -> pushMode(APOSTROPHED);
ARGLBRACE: '{' -> type(LBRACE),pushMode(BRACED);

COMMA: ',';
E_PAREN: [}(];

mode QUOTED;
RQUOTE: '"' ->type(QUOTE),popMode;
QUOTEDTEXT: ~["]* ->type(ARGUMENTTEXT);

mode APOSTROPHED;
RAPOSTROPHE: '\'' ->type(APOSTROPHE),popMode;
APOSTROPHEDTEXT: ~[']* ->type(ARGUMENTTEXT);

mode BRACKETED;
RBRACKET: ']' -> popMode;
BRACKETEDTEXT: ~[{}\u005d]+ ->type(TEXT); // u005d right bracket
BRACKETEDLBRACE: '{' -> type(LBRACE),pushMode(BRACED);
EE_RBRACE: '}' -> type(RBRACE);




