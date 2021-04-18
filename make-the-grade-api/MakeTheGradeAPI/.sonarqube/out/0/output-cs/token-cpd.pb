Œ$
ùD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\EssayTestsController.cs
	namespace		 	
MakeTheGradeAPI		
 
.		 
Controllers		 %
{

 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class  
EssayTestsController %
:& '
ControllerBase( 6
{ 
private 
readonly 
DataContext $
_context% -
;- .
public  
EssayTestsController #
(# $
DataContext$ /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
	EssayTest( 1
>1 2
>2 3
GetEssayTests4 A
(A B
)B C
{ 	
return 
_context 
. 
	EssayTest %
.% &
ToList& ,
(, -
)- .
;. /
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
< 
	EssayTest %
>% &
GetRandomTest' 4
(4 5
)5 6
{ 	
return 
_context 
. 
	EssayTest %
.% &
Find& *
(* +
$num+ ,
), -
;- .
}   	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
ActionResult## 
<## 
	EssayTest## %
>##% &
GetEssayTestById##' 7
(##7 8
int##8 ;
Id##< >
)##> ?
{$$ 	
return%% 
_context%% 
.%% 
	EssayTest%% %
.%%% &
Find%%& *
(%%* +
Id%%+ -
)%%- .
;%%. /
}&& 	
[(( 	
HttpPut((	 
((( 
$str(( 
)(( 
](( 
public)) 
async)) 
Task)) 
<)) 
ActionResult)) &
<))& '
string))' -
>))- .
>)). /
setEssayTestText))0 @
())@ A
[))A B
FromBody))B J
]))J K
EssayTestAnswer))L [
essayTestAnswer))\ k
,))k l
int))m p
Id))q s
)))s t
{** 	
	EssayTest++ 
EssayTestToUpdate++ '
=++( )
_context++* 2
.++2 3
	EssayTest++3 <
.++< =
Find++= A
(++A B
essayTestAnswer++B Q
.++Q R
Id++R T
)++T U
;++U V
EssayTestToUpdate,, 
.,, 
	EssayText,, '
=,,( )
essayTestAnswer,,* 9
.,,9 :
EssayTestText,,: G
;,,G H
_context-- 
.-- 
Entry-- 
(-- 
EssayTestToUpdate-- ,
)--, -
.--- .
State--. 3
=--4 5
EntityState--6 A
.--A B
Modified--B J
;--J K
await.. 
_context.. 
... 
SaveChangesAsync.. +
(..+ ,
).., -
;..- .
return// 
$str// &
;//& '
}00 	
[22 	
HttpPost22	 
]22 
public33 
async33 
Task33 
<33 
ActionResult33 &
<33& '
	EssayTest33' 0
>330 1
>331 2
AddEssayTest333 ?
(33? @
[33@ A
FromBody33A I
]33I J
	EssayTest33K T
	essayTest33U ^
)33^ _
{44 	
_context55 
.55 
	EssayTest55 
.55 
Add55 "
(55" #
	essayTest55# ,
)55, -
;55- .
await66 
_context66 
.66 
SaveChangesAsync66 +
(66+ ,
)66, -
;66- .
return88 
CreatedAtAction88 "
(88" #
$str88# 5
,885 6
new887 :
{88; <
id88= ?
=88@ A
	essayTest88B K
.88K L
Id88L N
}88O P
,88P Q
	essayTest88R [
)88[ \
;88\ ]
}99 	
}:: 
};; ò>
òD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\ExamsController.cs
	namespace

 	
MakeTheGradeAPI


 
.

 
Controllers

 %
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
ExamsController  
:! "
ControllerBase# 1
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
ExamsController 
( 
DataContext *
context+ 2
)2 3
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
Exam( ,
>, -
>- .
GetExams/ 7
(7 8
)8 9
{ 	
return 
_context 
. 
Exam  
.  !
ToList! '
(' (
)( )
;) *
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
< 
Exam  
>  !
GetExamById" -
(- .
int. 1
Id2 4
)4 5
{ 	
return   
_context   
.   
Exam    
.    !
Find  ! %
(  % &
Id  & (
)  ( )
;  ) *
}!! 	
[## 	
HttpPost##	 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
ActionResult$$ &
<$$& '
Exam$$' +
>$$+ ,
>$$, -
AddExam$$. 5
($$5 6
[$$6 7
FromBody$$7 ?
]$$? @
Exam$$A E
exam$$F J
)$$J K
{%% 	
_context&& 
.&& 
Exam&& 
.&& 
Add&& 
(&& 
exam&& "
)&&" #
;&&# $
await'' 
_context'' 
.'' 
SaveChangesAsync'' +
(''+ ,
)'', -
;''- .
return)) 
CreatedAtAction)) "
())" #
$str))# 0
,))0 1
new))2 5
{))6 7
id))8 :
=)); <
exam))= A
.))A B
Id))B D
}))E F
,))F G
exam))H L
)))L M
;))M N
}** 	
[,, 	
HttpPut,,	 
(,, 
$str,, +
),,+ ,
],,, -
public-- 
async-- 
Task-- 
<-- 
ActionResult-- &
<--& '
MultipleChoiceTest--' 9
>--9 :
>--: ;!
AddMultipleChoiceTest--< Q
(--Q R
[--R S
FromBody--S [
]--[ \
AddTestRequest--] k
addTestRequest--l z
,--z {
int--| 
Id
--Ä Ç
)
--Ç É
{.. 	
Exam// 

examToEdit// 
=// 
_context// &
.//& '
Exam//' +
.//+ ,
Find//, 0
(//0 1
Id//1 3
)//3 4
;//4 5
MultipleChoiceTest11 
multipleChoiceTest11 1
=112 3
_context114 <
.11< =
MultipleChoiceTest11= O
.11O P
Find11P T
(11T U
addTestRequest11U c
.11c d
Id11d f
)11f g
;11g h
if33 
(33 
multipleChoiceTest33 "
==33# %
null33& *
)33* +
{44 
return55 
	NoContent55  
(55  !
)55! "
;55" #
}66 
else77 
{88 

examToEdit99 
.99  
MultipleChoiceTestId99 /
=990 1
addTestRequest992 @
.99@ A
Id99A C
;99C D
await:: 
_context:: 
.:: 
SaveChangesAsync:: /
(::/ 0
)::0 1
;::1 2
return<< 
CreatedAtAction<< &
(<<& '
$str<<' 4
,<<4 5
new<<6 9
{<<: ;
id<<< >
=<<? @

examToEdit<<A K
.<<K L
Id<<L N
}<<O P
,<<P Q

examToEdit<<R \
)<<\ ]
;<<] ^
}== 
}>> 	
[@@ 	
HttpPut@@	 
(@@ 
$str@@ (
)@@( )
]@@) *
publicAA 
asyncAA 
TaskAA 
<AA 
ActionResultAA &
<AA& '
ExamAA' +
>AA+ ,
>AA, -
AddShortAnswerTestAA. @
(AA@ A
[AAA B
FromBodyAAB J
]AAJ K
AddTestRequestAAL Z
addTestRequestAA[ i
,AAi j
intAAk n
IdAAo q
)AAq r
{BB 	
ExamCC 

examToEditCC 
=CC 
_contextCC &
.CC& '
ExamCC' +
.CC+ ,
FindCC, 0
(CC0 1
IdCC1 3
)CC3 4
;CC4 5
ConsoleDD 
.DD 
	WriteLineDD 
(DD 

examToEditDD (
.DD( )
IdDD) +
)DD+ ,
;DD, -
ShortAnswerTestFF 
shortAnswerTestFF +
=FF, -
_contextFF. 6
.FF6 7
ShortAnswerTestFF7 F
.FFF G
FindFFG K
(FFK L
addTestRequestFFL Z
.FFZ [
IdFF[ ]
)FF] ^
;FF^ _
ifHH 
(HH 
shortAnswerTestHH 
==HH  "
nullHH# '
)HH' (
{II 
returnJJ 
	NoContentJJ  
(JJ  !
)JJ! "
;JJ" #
}KK 
elseLL 
{MM 

examToEditNN 
.NN 
ShortAnswerTestIdNN ,
=NN- .
addTestRequestNN/ =
.NN= >
IdNN> @
;NN@ A
awaitOO 
_contextOO 
.OO 
SaveChangesAsyncOO /
(OO/ 0
)OO0 1
;OO1 2
returnQQ 
CreatedAtActionQQ &
(QQ& '
$strQQ' 4
,QQ4 5
newQQ6 9
{QQ: ;
idQQ< >
=QQ? @

examToEditQQA K
.QQK L
IdQQL N
}QQO P
,QQP Q

examToEditQQR \
)QQ\ ]
;QQ] ^
}RR 
}SS 	
[UU 	
HttpPutUU	 
(UU 
$strUU !
)UU! "
]UU" #
publicVV 
asyncVV 
TaskVV 
<VV 
ActionResultVV &
<VV& '
ExamVV' +
>VV+ ,
>VV, -
AddEssayTestVV. :
(VV: ;
[VV; <
FromBodyVV< D
]VVD E
AddTestRequestVVF T
addTestRequestVVU c
,VVc d
intVVe h
IdVVi k
)VVk l
{WW 	
ExamXX 

examToEditXX 
=XX 
_contextXX &
.XX& '
ExamXX' +
.XX+ ,
FindXX, 0
(XX0 1
IdXX1 3
)XX3 4
;XX4 5

examToEditYY 
.YY 
EssayTestIdYY "
=YY# $
addTestRequestYY% 3
.YY3 4
IdYY4 6
;YY6 7
awaitZZ 
_contextZZ 
.ZZ 
SaveChangesAsyncZZ +
(ZZ+ ,
)ZZ, -
;ZZ- .
return\\ 
CreatedAtAction\\ "
(\\" #
$str\\# 0
,\\0 1
new\\2 5
{\\6 7
id\\8 :
=\\; <

examToEdit\\= G
.\\G H
Id\\H J
}\\K L
,\\L M

examToEdit\\N X
)\\X Y
;\\Y Z
}]] 	
}^^ 
}__ ÏM
¶D:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\MultipleChoiceTestsController.cs
	namespace

 	
MakeTheGradeAPI


 
.

 
Controllers

 %
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str '
)' (
]( )
public 

class )
MultipleChoiceTestsController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
DataContext $
_context% -
;- .
public )
MultipleChoiceTestsController ,
(, -
DataContext- 8
context9 @
)@ A
{ 	
_context 
= 
context 
; 
} 	
private 
bool $
MultipleChoiceTestExists -
(- .
int. 1
id2 4
)4 5
{ 	
return 
_context 
. 
MultipleChoiceTest .
.. /
Any/ 2
(2 3
e3 4
=>5 7
e8 9
.9 :
Id: <
=== ?
id@ B
)B C
;C D
} 	
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
MultipleChoiceTest( :
>: ;
>; <"
GetMultipleChoiceTests= S
(S T
)T U
{ 	
return 
_context 
. 
MultipleChoiceTest .
.. /
ToList/ 5
(5 6
)6 7
;7 8
}   	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
ActionResult## 
<## 
MultipleChoiceTest## .
>##. /%
GetMultipleChoiceTestById##0 I
(##I J
int##J M
Id##N P
)##P Q
{$$ 	
return%% 
_context%% 
.%% 
MultipleChoiceTest%% .
.%%. /
Find%%/ 3
(%%3 4
Id%%4 6
)%%6 7
;%%7 8
}&& 	
[(( 	
HttpPost((	 
](( 
public)) 
async)) 
Task)) 
<)) 
ActionResult)) &
<))& '
MultipleChoiceTest))' 9
>))9 :
>)): ;!
AddMultipleChoiceTest))< Q
())Q R
[))R S
FromBody))S [
]))[ \
MultipleChoiceTest))] o
multipleChoiceTest	))p Ç
)
))Ç É
{** 	
_context++ 
.++ 
MultipleChoiceTest++ '
.++' (
Add++( +
(+++ ,
multipleChoiceTest++, >
)++> ?
;++? @
await,, 
_context,, 
.,, 
SaveChangesAsync,, +
(,,+ ,
),,, -
;,,- .
return.. 
CreatedAtAction.. "
(.." #
$str..# >
,..> ?
new..@ C
{..D E
id..F H
=..I J
multipleChoiceTest..K ]
...] ^
Id..^ `
}..a b
,..b c
multipleChoiceTest..d v
)..v w
;..w x
}// 	
[11 	
HttpPut11	 
(11 
$str11 
)11 
]11 
public22 
async22 
Task22 
<22 
ActionResult22 &
<22& '
MultipleChoiceTest22' 9
>229 :
>22: ;"
EditMultipleChoiceTest22< R
(22R S
[22S T
FromBody22T \
]22\ ]
MultipleChoiceTest22^ p
multipleChoiceTest	22q É
,
22É Ñ
int
22Ö à
Id
22â ã
)
22ã å
{33 	
if44 
(44 
Id44 
!=44 
multipleChoiceTest44 (
.44( )
Id44) +
)44+ ,
{55 
return66 

BadRequest66 !
(66! "
)66" #
;66# $
}77 
_context99 
.99 
Entry99 
(99 
multipleChoiceTest99 -
)99- .
.99. /
State99/ 4
=995 6
EntityState997 B
.99B C
Modified99C K
;99K L
try;; 
{<< 
await== 
_context== 
.== 
SaveChangesAsync== /
(==/ 0
)==0 1
;==1 2
return>> 
CreatedAtAction>> &
(>>& '
$str>>' B
,>>B C
new>>D G
{>>H I
id>>J L
=>>M N
multipleChoiceTest>>O a
.>>a b
Id>>b d
}>>e f
,>>f g
multipleChoiceTest>>h z
)>>z {
;>>{ |
}?? 
catch@@ 
(@@ (
DbUpdateConcurrencyException@@ /
)@@/ 0
{AA 
ifBB 
(BB 
!BB $
MultipleChoiceTestExistsBB -
(BB- .
IdBB. 0
)BB0 1
)BB1 2
{CC 
returnDD 
NotFoundDD #
(DD# $
)DD$ %
;DD% &
}EE 
elseFF 
{GG 
throwHH 
;HH 
}II 
}JJ 
}KK 	
[MM 	
HttpPostMM	 
(MM 
$strMM 
)MM 
]MM 
publicNN 
ActionResultNN 
<NN 
ListNN  
<NN  !
QuestionValidationNN! 3
>NN3 4
>NN4 5
validateUserAnswerNN6 H
(NNH I
[NNI J
FromBodyNNJ R
]NNR S
ListNNT X
<NNX Y$
MultipleChoiceTestAnswerNNY q
>NNq r&
multipleChoiceTestAnswers	NNs å
)
NNå ç
{OO 	
ListPP 
<PP 
QuestionValidationPP #
>PP# $ 
QuestionsValidationsPP% 9
=PP: ;
newPP< ?
ListPP@ D
<PPD E
QuestionValidationPPE W
>PPW X
(PPX Y
)PPY Z
;PPZ [
foreachQQ 
(QQ $
MultipleChoiceTestAnswerQQ -
answerQQ. 4
inQQ5 7%
multipleChoiceTestAnswersQQ8 Q
)QQQ R
{RR 
intSS 

QuestionIdSS 
=SS  
answerSS! '
.SS' (

QuestionIdSS( 2
;SS2 3
ListTT 
<TT 
stringTT 
>TT 
UserAnswersTT (
=TT) *
answerTT+ 1
.TT1 2
UserAnswersTT2 =
;TT= >
ListUU 
<UU 
stringUU 
>UU 
CorrectAnswersUU +
;UU+ ,
ListVV 
<VV 
stringVV 
>VV 
WrongAnswersVV )
=VV* +
newVV, /
ListVV0 4
<VV4 5
stringVV5 ;
>VV; <
(VV< =
)VV= >
;VV> ?
ListWW 
<WW 
stringWW 
>WW '
CorrectButNotCheckedAnswersWW 8
=WW9 :
newWW; >
ListWW? C
<WWC D
stringWWD J
>WWJ K
(WWK L
)WWL M
;WWM N
MultipleChoiceTestYY "(
MultipleChoiceTestToValidateYY# ?
=YY@ A
_contextYYB J
.YYJ K
MultipleChoiceTestYYK ]
.YY] ^
FindYY^ b
(YYb c

QuestionIdYYc m
)YYm n
;YYn o
if[[ 
([[ (
MultipleChoiceTestToValidate[[ 0
!=[[1 3
null[[4 8
)[[8 9
{\\ 
List]] 
<]] 
string]] 
>]]  
TestCorrectAnswers]]! 3
=]]4 5(
MultipleChoiceTestToValidate]]6 R
.]]R S
CorrectAnswers]]S a
.]]a b
Split]]b g
(]]g h
$char]]h k
)]]k l
.]]l m
ToList]]m s
(]]s t
)]]t u
;]]u v
if__ 
(__ 
TestCorrectAnswers__ *
==__+ -
UserAnswers__. 9
)__9 :
{`` 
CorrectAnswersaa &
=aa' (
UserAnswersaa) 4
;aa4 5 
QuestionsValidationsbb ,
.bb, -
Addbb- 0
(bb0 1
newbb1 4
QuestionValidationbb5 G
(bbG H

QuestionIdbbH R
,bbR S
CorrectAnswersbbT b
,bbb c'
CorrectButNotCheckedAnswersbbd 
,	bb Ä
WrongAnswers
bbÅ ç
)
bbç é
)
bbé è
;
bbè ê
}cc 
elsedd 
{ee 
CorrectAnswersff &
=ff' (
TestCorrectAnswersff) ;
.ff; <
	Intersectff< E
(ffE F
UserAnswersffF Q
)ffQ R
.ffR S
ToListffS Y
(ffY Z
)ffZ [
;ff[ \'
CorrectButNotCheckedAnswersgg 3
=gg4 5
TestCorrectAnswersgg6 H
.ggH I
ExceptggI O
(ggO P
UserAnswersggP [
)gg[ \
.gg\ ]
ToListgg] c
(ggc d
)ggd e
;gge f
WrongAnswershh $
=hh% &
UserAnswershh' 2
.hh2 3
Excepthh3 9
(hh9 :
TestCorrectAnswershh: L
)hhL M
.hhM N
ToListhhN T
(hhT U
)hhU V
;hhV W
}ii  
QuestionsValidationsjj (
.jj( )
Addjj) ,
(jj, -
newjj- 0
QuestionValidationjj1 C
(jjC D

QuestionIdjjD N
,jjN O
CorrectAnswersjjP ^
,jj^ _'
CorrectButNotCheckedAnswersjj` {
,jj{ |
WrongAnswers	jj} â
)
jjâ ä
)
jjä ã
;
jjã å
}kk 
}ll 
returnmm  
QuestionsValidationsmm '
;mm' (
}nn 	
}oo 
}pp ∞-
£D:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\ShortAnswerTestsController.cs
	namespace 	
MakeTheGradeAPI
 
. 
Controllers %
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str $
)$ %
]% &
public 

class &
ShortAnswerTestsController +
:, -
ControllerBase. <
{ 
private 
readonly 
DataContext $
_context% -
;- .
public &
ShortAnswerTestsController )
() *
DataContext* 5
context6 =
)= >
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
( 
$str -
)- .
]. /
public 
ActionResult 
< 
List  
<  !
ShortAnswerTest! 0
>0 1
>1 2
GetRandomTest3 @
(@ A
intA D
numberOfQuestionsE V
)V W
{ 	
List 
< 
ShortAnswerTest  
>  !
ShortAnswerTests" 2
=3 4
_context5 =
.= >
ShortAnswerTest> M
.M N
ToListN T
(T U
)U V
;V W
return 
ShortAnswerTestUtil &
.& '
getRandomTestsList' 9
(9 :
numberOfQuestions: K
,K L
ShortAnswerTestsM ]
)] ^
;^ _
} 	
[ 	
HttpGet	 
] 
public   
ActionResult   
<   
IEnumerable   '
<  ' (
ShortAnswerTest  ( 7
>  7 8
>  8 9
GetShortAnswerTests  : M
(  M N
)  N O
{!! 	
return"" 
_context"" 
."" 
ShortAnswerTest"" +
.""+ ,
ToList"", 2
(""2 3
)""3 4
;""4 5
}## 	
[%% 	
HttpGet%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
ActionResult&& 
<&& 
ShortAnswerTest&& +
>&&+ ,"
GetShortAnswerTestById&&- C
(&&C D
int&&D G
Id&&H J
)&&J K
{'' 	
return(( 
_context(( 
.(( 
ShortAnswerTest(( +
.((+ ,
Find((, 0
(((0 1
Id((1 3
)((3 4
;((4 5
})) 	
[++ 	
HttpPost++	 
]++ 
public,, 
async,, 
Task,, 
<,, 
ActionResult,, &
<,,& '
ShortAnswerTest,,' 6
>,,6 7
>,,7 8
AddShortAnswerTest,,9 K
(,,K L
[,,L M
FromBody,,M U
],,U V
ShortAnswerTest,,W f
shortAnswerTest,,g v
),,v w
{-- 	
System.. 
... 
Console.. 
... 
	WriteLine.. $
(..$ %
shortAnswerTest..% 4
...4 5
Answer..5 ;
+..< =
shortAnswerTest..> M
...M N
Question..N V
)..V W
;..W X
_context// 
.// 
ShortAnswerTest// $
.//$ %
Add//% (
(//( )
shortAnswerTest//) 8
)//8 9
;//9 :
await00 
_context00 
.00 
SaveChangesAsync00 +
(00+ ,
)00, -
;00- .
return22 
CreatedAtAction22 "
(22" #
$str22# ;
,22; <
new22= @
{22A B
id22C E
=22F G
shortAnswerTest22H W
.22W X
Id22X Z
}22[ \
,22\ ]
shortAnswerTest22^ m
)22m n
;22n o
}33 	
[55 	
HttpPut55	 
]55 
public66 
async66 
Task66 
<66 
ActionResult66 &
<66& '
string66' -
>66- .
>66. /
EditShortAnswerTest660 C
(66C D
[66D E
FromBody66E M
]66M N
List66O S
<66S T
ShortAnswer66T _
>66_ `
shortAnswerTests66a q
)66q r
{77 	
foreach88 
(88 
ShortAnswer88  
shortAnswer88! ,
in88- /
shortAnswerTests880 @
)88@ A
{99 
System:: 
.:: 
Console:: 
.:: 
	WriteLine:: (
(::( )
shortAnswer::) 4
.::4 5
Id::5 7
)::7 8
;::8 9
ShortAnswerTest;; 
shortAnswerTest;;  /
=;;0 1
_context;;2 :
.;;: ;
ShortAnswerTest;;; J
.;;J K
Find;;K O
(;;O P
shortAnswer;;P [
.;;[ \
Id;;\ ^
);;^ _
;;;_ `
shortAnswerTest<< 
.<<  
Answer<<  &
=<<' (
shortAnswer<<) 4
.<<4 5
ShortAnswerText<<5 D
;<<D E
_context== 
.== 
Entry== 
(== 
shortAnswerTest== .
)==. /
.==/ 0
State==0 5
===6 7
EntityState==8 C
.==C D
Modified==D L
;==L M
await>> 
_context>> 
.>> 
SaveChangesAsync>> /
(>>/ 0
)>>0 1
;>>1 2
}?? 
return@@ 
$str@@ +
;@@+ ,
}AA 	
}BB 
}EE á&
õD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\StudentsController.cs
	namespace		 	
MakeTheGradeAPI		
 
.		 
Controllers		 %
{

 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
StudentsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
StudentsController !
(! "
DataContext" -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
Student( /
>/ 0
>0 1
FindStudents2 >
(> ?
)? @
{ 	
return 
_context 
. 
Student #
.# $
ToList$ *
(* +
)+ ,
;, -
} 	
[ 	
HttpPost	 
( 
$str  
)  !
]! "
public 
ActionResult 
< 
int 
>  
Authenticate! -
(- .
[. /
FromBody/ 7
]7 8
List9 =
<= >
string> D
>D E
studentDataF Q
)Q R
{ 	
List 
< 
Student 
> 
Students "
=# $
_context% -
.- .
Student. 5
.5 6
ToList6 <
(< =
)= >
;> ?
foreach!! 
(!! 
Student!! 
student!! $
in!!% '
Students!!( 0
)!!0 1
{"" 
if## 
(## 
student## 
.## 
Username## $
==##% '
studentData##( 3
[##3 4
$num##4 5
]##5 6
&&##7 9
student##: A
.##A B
Password##B J
==##K M
Hash##N R
.##R S
hashPassword##S _
(##_ `
studentData##` k
[##k l
$num##l m
]##m n
)##n o
)##o p
{$$ 
return%% 
student%% "
.%%" #
Id%%# %
;%%% &
}&& 
}'' 
return(( 
-(( 
$num(( 
;(( 
})) 	
[++ 	
HttpPost++	 
(++ 
)++ 
]++ 
public,, 
async,, 
Task,, 
<,, 
ActionResult,, &
<,,& '
string,,' -
>,,- .
>,,. /

AddStudent,,0 :
(,,: ;
[,,; <
FromBody,,< D
],,D E
List,,F J
<,,J K
string,,K Q
>,,Q R
studentData,,S ^
),,^ _
{-- 	
Student.. 
studentToAdd..  
=..! "
new..# &
Student..' .
(... /
studentData../ :
[..: ;
$num..; <
]..< =
,..= >
Hash..? C
...C D
hashPassword..D P
(..P Q
studentData..Q \
[..\ ]
$num..] ^
]..^ _
).._ `
,..` a
studentData..b m
[..m n
$num..n o
]..o p
,..p q
$str..r t
,..t u
studentData	..v Å
[
..Å Ç
$num
..Ç É
]
..É Ñ
,
..Ñ Ö
$str
..Ü à
)
..à â
;
..â ä
_context00 
.00 
Student00 
.00 
Add00  
(00  !
studentToAdd00! -
)00- .
;00. /
await11 
_context11 
.11 
SaveChangesAsync11 +
(11+ ,
)11, -
;11- .
if33 
(33 
_context33 
.33 
Student33  
.33  !
Find33! %
(33% &
studentToAdd33& 2
.332 3
Id333 5
)335 6
!=337 9
null33: >
)33> ?
{44 
return55 
Ok55 
(55 
$str55 ,
+55- .
studentToAdd55/ ;
.55; <
Id55< >
+55? @
$str55A S
)55S T
;55T U
}66 
else66 
{77 
return88 
Ok88 
(88 
$str88 .
)88. /
;88/ 0
}99 
}:: 	
};; 
}<< ¿c
ßD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Data\Migrations\20210417145512_SixthCreate.cs
	namespace 	
MakeTheGradeAPI
 
. 
Data 
. 

Migrations )
{ 
public 

partial 
class 
SixthCreate $
:% &
	Migration' 0
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
CreateTable		 (
(		( )
name

 
:

 
$str

 !
,

! "
columns 
: 
table 
=> !
new" %
{ 
id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
question 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: B
,B C
nullableD L
:L M
trueN R
)R S
,S T
assigner_id 
=  !
table" '
.' (
Column( .
<. /
int/ 2
>2 3
(3 4
type4 8
:8 9
$str: ?
,? @
nullableA I
:I J
falseK P
)P Q
,Q R

essay_text 
=  
table! &
.& '
Column' -
<- .
string. 4
>4 5
(5 6
type6 :
:: ;
$str< D
,D E
nullableF N
:N O
trueP T
)T U
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 3
,3 4
x5 6
=>7 9
x: ;
.; <
id< >
)> ?
;? @
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
multiple_choice_id &
=' (
table) .
.. /
Column/ 5
<5 6
int6 9
>9 :
(: ;
type; ?
:? @
$strA F
,F G
nullableH P
:P Q
falseR W
)W X
,X Y
short_answer_id #
=$ %
table& +
.+ ,
Column, 2
<2 3
int3 6
>6 7
(7 8
type8 <
:< =
$str> C
,C D
nullableE M
:M N
falseO T
)T U
,U V
essay_test_id   !
=  " #
table  $ )
.  ) *
Column  * 0
<  0 1
int  1 4
>  4 5
(  5 6
type  6 :
:  : ;
$str  < A
,  A B
nullable  C K
:  K L
false  M R
)  R S
}!! 
,!! 
constraints"" 
:"" 
table"" "
=>""# %
{## 
table$$ 
.$$ 

PrimaryKey$$ $
($$$ %
$str$$% .
,$$. /
x$$0 1
=>$$2 4
x$$5 6
.$$6 7
id$$7 9
)$$9 :
;$$: ;
}%% 
)%% 
;%% 
migrationBuilder'' 
.'' 
CreateTable'' (
(''( )
name(( 
:(( 
$str(( *
,((* +
columns)) 
:)) 
table)) 
=>)) !
new))" %
{** 
id++ 
=++ 
table++ 
.++ 
Column++ %
<++% &
int++& )
>++) *
(++* +
type+++ /
:++/ 0
$str++1 :
,++: ;
nullable++< D
:++D E
false++F K
)++K L
.,, 

Annotation,, #
(,,# $
$str,,$ :
,,,: ;
true,,< @
),,@ A
,,,A B
question-- 
=-- 
table-- $
.--$ %
Column--% +
<--+ ,
string--, 2
>--2 3
(--3 4
type--4 8
:--8 9
$str--: B
,--B C
nullable--D L
:--L M
true--N R
)--R S
,--S T
	grader_id.. 
=.. 
table..  %
...% &
Column..& ,
<.., -
int..- 0
>..0 1
(..1 2
type..2 6
:..6 7
$str..8 =
,..= >
nullable..? G
:..G H
false..I N
)..N O
,..O P
possibleAnswers// #
=//$ %
table//& +
.//+ ,
Column//, 2
<//2 3
string//3 9
>//9 :
(//: ;
type//; ?
://? @
$str//A I
,//I J
nullable//K S
://S T
true//U Y
)//Y Z
,//Z [
correctAnswers00 "
=00# $
table00% *
.00* +
Column00+ 1
<001 2
string002 8
>008 9
(009 :
type00: >
:00> ?
$str00@ H
,00H I
nullable00J R
:00R S
true00T X
)00X Y
}11 
,11 
constraints22 
:22 
table22 "
=>22# %
{33 
table44 
.44 

PrimaryKey44 $
(44$ %
$str44% <
,44< =
x44> ?
=>44@ B
x44C D
.44D E
id44E G
)44G H
;44H I
}55 
)55 
;55 
migrationBuilder77 
.77 
CreateTable77 (
(77( )
name88 
:88 
$str88 '
,88' (
columns99 
:99 
table99 
=>99 !
new99" %
{:: 
id;; 
=;; 
table;; 
.;; 
Column;; %
<;;% &
int;;& )
>;;) *
(;;* +
type;;+ /
:;;/ 0
$str;;1 :
,;;: ;
nullable;;< D
:;;D E
false;;F K
);;K L
.<< 

Annotation<< #
(<<# $
$str<<$ :
,<<: ;
true<<< @
)<<@ A
,<<A B
question== 
=== 
table== $
.==$ %
Column==% +
<==+ ,
string==, 2
>==2 3
(==3 4
type==4 8
:==8 9
$str==: B
,==B C
nullable==D L
:==L M
true==N R
)==R S
,==S T
assigner_id>> 
=>>  !
table>>" '
.>>' (
Column>>( .
<>>. /
int>>/ 2
>>>2 3
(>>3 4
type>>4 8
:>>8 9
$str>>: ?
,>>? @
nullable>>A I
:>>I J
false>>K P
)>>P Q
,>>Q R
answer?? 
=?? 
table?? "
.??" #
Column??# )
<??) *
string??* 0
>??0 1
(??1 2
type??2 6
:??6 7
$str??8 @
,??@ A
nullable??B J
:??J K
true??L P
)??P Q
}@@ 
,@@ 
constraintsAA 
:AA 
tableAA "
=>AA# %
{BB 
tableCC 
.CC 

PrimaryKeyCC $
(CC$ %
$strCC% 9
,CC9 :
xCC; <
=>CC= ?
xCC@ A
.CCA B
idCCB D
)CCD E
;CCE F
}DD 
)DD 
;DD 
migrationBuilderFF 
.FF 
CreateTableFF (
(FF( )
nameGG 
:GG 
$strGG 
,GG  
columnsHH 
:HH 
tableHH 
=>HH !
newHH" %
{II 
idJJ 
=JJ 
tableJJ 
.JJ 
ColumnJJ %
<JJ% &
intJJ& )
>JJ) *
(JJ* +
typeJJ+ /
:JJ/ 0
$strJJ1 :
,JJ: ;
nullableJJ< D
:JJD E
falseJJF K
)JJK L
.KK 

AnnotationKK #
(KK# $
$strKK$ :
,KK: ;
trueKK< @
)KK@ A
,KKA B
usernameLL 
=LL 
tableLL $
.LL$ %
ColumnLL% +
<LL+ ,
stringLL, 2
>LL2 3
(LL3 4
typeLL4 8
:LL8 9
$strLL: B
,LLB C
nullableLLD L
:LLL M
trueLLN R
)LLR S
,LLS T
passwordMM 
=MM 
tableMM $
.MM$ %
ColumnMM% +
<MM+ ,
stringMM, 2
>MM2 3
(MM3 4
typeMM4 8
:MM8 9
$strMM: B
,MMB C
nullableMMD L
:MML M
trueMMN R
)MMR S
,MMS T
emailNN 
=NN 
tableNN !
.NN! "
ColumnNN" (
<NN( )
stringNN) /
>NN/ 0
(NN0 1
typeNN1 5
:NN5 6
$strNN7 ?
,NN? @
nullableNNA I
:NNI J
trueNNK O
)NNO P
,NNP Q
phoneNumberOO 
=OO  !
tableOO" '
.OO' (
ColumnOO( .
<OO. /
stringOO/ 5
>OO5 6
(OO6 7
typeOO7 ;
:OO; <
$strOO= E
,OOE F
nullableOOG O
:OOO P
trueOOQ U
)OOU V
,OOV W
addressPP 
=PP 
tablePP #
.PP# $
ColumnPP$ *
<PP* +
stringPP+ 1
>PP1 2
(PP2 3
typePP3 7
:PP7 8
$strPP9 A
,PPA B
nullablePPC K
:PPK L
truePPM Q
)PPQ R
,PPR S
nr_matricolQQ 
=QQ  !
tableQQ" '
.QQ' (
ColumnQQ( .
<QQ. /
stringQQ/ 5
>QQ5 6
(QQ6 7
typeQQ7 ;
:QQ; <
$strQQ= E
,QQE F
nullableQQG O
:QQO P
trueQQQ U
)QQU V
}RR 
,RR 
constraintsSS 
:SS 
tableSS "
=>SS# %
{TT 
tableUU 
.UU 

PrimaryKeyUU $
(UU$ %
$strUU% 1
,UU1 2
xUU3 4
=>UU5 7
xUU8 9
.UU9 :
idUU: <
)UU< =
;UU= >
}VV 
)VV 
;VV 
}WW 	
	protectedYY 
overrideYY 
voidYY 
DownYY  $
(YY$ %
MigrationBuilderYY% 5
migrationBuilderYY6 F
)YYF G
{ZZ 	
migrationBuilder[[ 
.[[ 
	DropTable[[ &
([[& '
name\\ 
:\\ 
$str\\ !
)\\! "
;\\" #
migrationBuilder^^ 
.^^ 
	DropTable^^ &
(^^& '
name__ 
:__ 
$str__ 
)__ 
;__ 
migrationBuilderaa 
.aa 
	DropTableaa &
(aa& '
namebb 
:bb 
$strbb *
)bb* +
;bb+ ,
migrationBuilderdd 
.dd 
	DropTabledd &
(dd& '
nameee 
:ee 
$stree '
)ee' (
;ee( )
migrationBuildergg 
.gg 
	DropTablegg &
(gg& '
namehh 
:hh 
$strhh 
)hh  
;hh  !
}ii 	
}jj 
}kk Û
ìD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Administrator.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Administrator 
: 
User #
{ 
public 
Administrator 
( 
) 
{ 	
}		 	
}

 
} ˇ
èD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\EssayTest.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
	EssayTest 
{ 
[ 	
Column	 
( 
$str 
, 
TypeName 
=  
$str! *
)* +
]+ ,
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
[ 	
Column	 
( 
$str 
, 
TypeName $
=% &
$str' /
)/ 0
]0 1
public 
string 
Question 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
$str 
, 
TypeName '
=( )
$str* /
)/ 0
]0 1
public 
int 

AssignerId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Column	 
( 
$str 
, 
TypeName &
=' (
$str) 1
)1 2
]2 3
public 
string 
	EssayText 
{  !
get" %
;% &
set' *
;* +
}, -
public 
	EssayTest 
( 
) 
{ 	
} 	
public 
	EssayTest 
( 
int 
id 
,  
string! '
question( 0
,0 1
int2 5

assignerId6 @
)@ A
{ 	
this 
. 
Id 
= 
id 
; 
this 
. 
Question 
= 
question $
;$ %
this 
. 

AssignerId 
= 

assignerId (
;( )
} 	
} 
}   ü
ïD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\EssayTestAnswer.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
EssayTestAnswer  
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
EssayTestText #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ®
äD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Exam.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Exam 
{ 
[ 	
Column	 
( 
$str 
, 
TypeName 
=  
$str! *
)* +
]+ ,
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[

 	
Column

	 
(

 
$str

 $
,

$ %
TypeName

& .
=

/ 0
$str

1 6
)

6 7
]

7 8
public 
int  
MultipleChoiceTestId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
=6 7
-8 9
$num9 :
;: ;
[ 	
Column	 
( 
$str !
,! "
TypeName# +
=, -
$str. 3
)3 4
]4 5
public 
int 
ShortAnswerTestId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
-5 6
$num6 7
;7 8
[ 	
Column	 
( 
$str 
,  
TypeName! )
=* +
$str, 1
)1 2
]2 3
public 
int 
EssayTestId 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
-/ 0
$num0 1
;1 2
} 
} ÷
åD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Grader.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Grader 
: 
User 
{ 
public 
Grader 
( 
) 
{ 	
}

 	
public 
Grader 
( 
int 
id 
, 
string $
username% -
,- .
string/ 5
password6 >
,> ?
string@ F
emailG L
,L M
stringN T
phoneNumberU `
,` a
stringb h
addressi p
)p q
{ 	
this 
. 
Id 
= 
id 
; 
this 
. 
Username 
= 
username $
;$ %
this 
. 
Password 
= 
password $
;$ %
this 
. 
Email 
= 
email 
; 
this 
. 
PhoneNumber 
= 
phoneNumber *
;* +
this 
. 
Address 
= 
address "
;" #
} 	
public 
ICollection 
< 
Test 
>  
GradedTests! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=; <
new= @
ListA E
<E F
TestF J
>J K
(K L
)L M
;M N
} 
} ¿
òD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\MultipleChoiceTest.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
MultipleChoiceTest #
{ 
[ 	
Column	 
( 
$str 
, 
TypeName 
=  
$str! *
)* +
]+ ,
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[

 	
Column

	 
(

 
$str

 
,

 
TypeName

 $
=

% &
$str

' /
)

/ 0
]

0 1
public 
string 
Question 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
$str 
, 
TypeName %
=& '
$str( -
)- .
]. /
public 
int 
Grader 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Column	 
( 
$str !
,! "
TypeName# +
=, -
$str. 6
)6 7
]7 8
public 
string 
PossibleAnswers %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
Column	 
( 
$str  
,  !
TypeName" *
=+ ,
$str- 5
)5 6
]6 7
public 
string 
CorrectAnswers $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
MultipleChoiceTest !
(! "
)" #
{ 	
} 	
public 
MultipleChoiceTest !
(! "
int" %
id& (
,( )
string* 0
question1 9
,9 :
string; A
possibleAnswersB Q
,Q R
stringS Y
correctAnswersZ h
)h i
{ 	
this 
. 
Id 
= 
id 
; 
this 
. 
Question 
= 
question $
;$ %
this 
. 
PossibleAnswers  
=! "
possibleAnswers# 2
;2 3
} 	
}   
}!! Á
ûD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\MultipleChoiceTestAnswer.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class $
MultipleChoiceTestAnswer )
{		 
public

 
int

 

QuestionId

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
List 
< 
string 
> 
UserAnswers '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} Î
òD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\QuestionValidation.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
QuestionValidation #
{ 
public 
QuestionValidation !
(! "
int" %

questionId& 0
,0 1
List2 6
<6 7
string7 =
>= >
correctAnswers? M
,M N
ListO S
<S T
stringT Z
>Z ['
correctButNotCheckedAnswers\ w
,w x
Listy }
<} ~
string	~ Ñ
>
Ñ Ö
wrongAnswers
Ü í
)
í ì
{ 	

QuestionId		 
=		 

questionId		 #
;		# $
CorrectAnswers

 
=

 
correctAnswers

 +
;

+ ,'
CorrectButNotCheckedAnswers '
=( )'
correctButNotCheckedAnswers* E
;E F
WrongAnswers 
= 
wrongAnswers '
;' (
} 	
public 
int 

QuestionId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
string 
> 
CorrectAnswers *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
List 
< 
string 
> '
CorrectButNotCheckedAnswers 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
List 
< 
string 
> 
WrongAnswers (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ô
ëD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\ShortAnswer.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
ShortAnswer 
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
ShortAnswerText %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ·
ïD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\ShortAnswerTest.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
ShortAnswerTest  
{ 
[ 	
Column	 
( 
$str 
, 
TypeName 
=  
$str! *
)* +
]+ ,
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[

 	
Column

	 
(

 
$str

 
,

 
TypeName

 $
=

% &
$str

' /
)

/ 0
]

0 1
public 
string 
Question 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
$str 
, 
TypeName '
=( )
$str* /
)/ 0
]0 1
public 
int 

AssignerId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Column	 
( 
$str 
, 
TypeName "
=# $
$str% -
)- .
]. /
public 
string 
Answer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ShortAnswerTest 
( 
)  
{ 	
} 	
public 
ShortAnswerTest 
( 
int "
id# %
,% &
string' -
question. 6
,6 7
string8 >
answer? E
)E F
{ 	
this 
. 
Id 
= 
id 
; 
this 
. 
Question 
= 
question $
;$ %
this 
. 
Answer 
= 
answer  
;  !
} 	
public 
ShortAnswerTest 
( 
int "
id# %
,% &
string' -
question. 6
,6 7
int8 ;

assignerId< F
,F G
stringH N
answerO U
)U V
{ 	
this 
. 
Id 
= 
id 
; 
this   
.   
Question   
=   
question   $
;  $ %
this!! 
.!! 

AssignerId!! 
=!! 

assignerId!! (
;!!( )
this"" 
."" 
Answer"" 
="" 
answer""  
;""  !
}## 	
}$$ 
}%% “
çD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Student.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Student 
{ 
[ 	
Column	 
( 
$str 
, 
TypeName 
=  
$str! *
)* +
]+ ,
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
[ 	
Column	 
( 
$str 
, 
TypeName $
=% &
$str' /
)/ 0
]0 1
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
$str 
, 
TypeName $
=% &
$str' /
)/ 0
]0 1
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
$str 
, 
TypeName !
=" #
$str$ ,
), -
]- .
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Column	 
( 
$str 
, 
TypeName '
=( )
$str* 2
)2 3
]3 4
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Column	 
( 
$str 
, 
TypeName #
=$ %
$str& .
). /
]/ 0
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Student 
( 
) 
{ 	
} 	
public 
Student 
( 
string 
username &
,& '
string( .
password/ 7
,7 8
string9 ?
email@ E
,E F
stringG M
phoneNumberN Y
,Y Z
string[ a
addressb i
,i j
stringk q
numarMatricolr 
)	 Ä
{ 	
this   
.   
Username   
=   
username   $
;  $ %
this!! 
.!! 
Password!! 
=!! 
password!! $
;!!$ %
this"" 
."" 
Email"" 
="" 
email"" 
;"" 
this## 
.## 
PhoneNumber## 
=## 
phoneNumber## *
;##* +
this$$ 
.$$ 
Address$$ 
=$$ 
address$$ "
;$$" #
this%% 
.%% 
NumarMatricol%% 
=%%  
numarMatricol%%! .
;%%. /
}&& 	
[(( 	
Column((	 
((( 
$str(( 
,(( 
TypeName(( '
=((( )
$str((* 2
)((2 3
]((3 4
public)) 
string)) 
NumarMatricol)) #
{))$ %
get))& )
;))) *
set))+ .
;)). /
}))0 1
}** 
}++ ∏
äD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Test.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Test 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Question 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
float		 
Score		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public 
Grader 
Assigner 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Û	
äD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\User.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
User 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} œ
éD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Model\DataContext.cs
	namespace 	
MakeTheGradeAPI
 
. 
Model 
{ 
public 

class 
DataContext 
: 
	DbContext (
{ 
public		 
DataContext		 
(		 
DbContextOptions		 +
<		+ ,
DataContext		, 7
>		7 8
options		9 @
)		@ A
:		B C
base		D H
(		H I
options		I P
)		P Q
{

 	
} 	
public 
DbSet 
< 
Exam 
> 
Exam 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DbSet 
< 
MultipleChoiceTest '
>' (
MultipleChoiceTest) ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
DbSet 
< 
ShortAnswerTest $
>$ %
ShortAnswerTest& 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
DbSet 
< 
	EssayTest 
> 
	EssayTest  )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
Student 
> 
Student %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ˆ

ÑD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Program.cs
	namespace

 	
MakeTheGradeAPI


 
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} § 
ÑD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Startup.cs
	namespace 	
MakeTheGradeAPI
 
{ 
public 

class 
Startup 
{ 
readonly 
string "
MyAllowSpecificOrigins .
=/ 0
$str1 J
;J K
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services!! 
.!! 
AddDbContext!! !
<!!! "
DataContext!!" -
>!!- .
(!!. /
options!!/ 6
=>!!7 9
options!!: A
.!!A B
	UseSqlite!!B K
(!!K L
Configuration!!L Y
.!!Y Z
GetConnectionString!!Z m
(!!m n
$str	!!n Å
)
!!Å Ç
)
!!Ç É
)
!!É Ñ
;
!!Ñ Ö
services"" 
."" 
AddCors"" 
("" 
options"" $
=>""% '
options## 
.## 
	AddPolicy## !
(##! ""
MyAllowSpecificOrigins##" 8
,##8 9
builder##: A
=>##B D
{$$ 
builder%% 
.%% 
AllowAnyHeader%% *
(%%* +
)%%+ ,
.&& 
AllowAnyMethod&& #
(&&# $
)&&$ %
.'' 
AllowAnyOrigin'' #
(''# $
)''$ %
;''% &
}(( 
))) 
))) 
;)) 
services++ 
.++ 
AddControllers++ #
(++# $
)++$ %
;++% &
services,, 
.,, 
AddSwaggerGen,, "
(,," #
c,,# $
=>,,% '
{-- 
c.. 
... 

SwaggerDoc.. 
(.. 
$str.. !
,..! "
new..# &
OpenApiInfo..' 2
{..3 4
Title..5 :
=..; <
$str..= N
,..N O
Version..P W
=..X Y
$str..Z ^
}.._ `
)..` a
;..a b
}// 
)// 
;// 
}00 	
public33 
void33 
	Configure33 
(33 
IApplicationBuilder33 1
app332 5
,335 6
IWebHostEnvironment337 J
env33K N
)33N O
{44 	
if55 
(55 
env55 
.55 
IsDevelopment55 !
(55! "
)55" #
)55# $
{66 
app77 
.77 %
UseDeveloperExceptionPage77 -
(77- .
)77. /
;77/ 0
app88 
.88 

UseSwagger88 
(88 
)88  
;88  !
app99 
.99 
UseSwaggerUI99  
(99  !
c99! "
=>99# %
c99& '
.99' (
SwaggerEndpoint99( 7
(997 8
$str998 R
,99R S
$str99T h
)99h i
)99i j
;99j k
}:: 
app<< 
.<< 
UseCors<< 
(<< "
MyAllowSpecificOrigins<< .
)<<. /
;<</ 0
app>> 
.>> 

UseRouting>> 
(>> 
)>> 
;>> 
app@@ 
.@@ 
UseAuthorization@@  
(@@  !
)@@! "
;@@" #
appBB 
.BB 
UseEndpointsBB 
(BB 
	endpointsBB &
=>BB' )
{CC 
	endpointsDD 
.DD 
MapControllersDD (
(DD( )
)DD) *
;DD* +
}EE 
)EE 
;EE 
}FF 	
}GG 
}HH Œ
ëD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Utils\AddTestRequest.cs
	namespace 	
MakeTheGradeAPI
 
. 
Utils 
{ 
public 

class 
AddTestRequest 
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
AddTestRequest 
( 
) 
{ 	
} 	
public 
AddTestRequest 
( 
int !
Id" $
)$ %
{ 	
this 
. 
Id 
= 
Id 
; 
} 	
} 
} ˘
áD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Utils\Hash.cs
	namespace 	
MakeTheGradeAPI
 
. 
Utils 
{		 
public

 

static

 
class

 
Hash

 
{ 
public 
static 
string 
hashPassword )
() *
string* 0
password1 9
)9 :
{ 	
using 
( 
SHA256 

sha256Hash $
=% &
SHA256' -
.- .
Create. 4
(4 5
)5 6
)6 7
{ 
byte 
[ 
] 
bytes 
= 

sha256Hash )
.) *
ComputeHash* 5
(5 6
Encoding6 >
.> ?
UTF8? C
.C D
GetBytesD L
(L M
passwordM U
)U V
)V W
;W X
StringBuilder 
builder %
=& '
new( +
StringBuilder, 9
(9 :
): ;
;; <
for 
( 
int 
i 
= 
$num 
; 
i  !
<" #
bytes$ )
.) *
Length* 0
;0 1
i2 3
++3 5
)5 6
{ 
builder 
. 
Append "
(" #
bytes# (
[( )
i) *
]* +
.+ ,
ToString, 4
(4 5
$str5 9
)9 :
): ;
;; <
} 
return 
builder 
. 
ToString '
(' (
)( )
;) *
} 
} 	
} 
} â
¶D:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Utils\ShortAnswerTest\ShortAnswerTestUtil.cs
	namespace 	
MakeTheGradeAPI
 
. 
Utils 
.  
ShortAnswerTests  0
{ 
public 

static 
class 
ShortAnswerTestUtil +
{		 
public

 
static

 
List

 
<

 
ShortAnswerTest

 *
>

* +
getRandomTestsList

, >
(

> ?
int

? B
numberOfQuestions

C T
,

T U
List

V Z
<

Z [
ShortAnswerTest

[ j
>

j k
shortAnswerTests

l |
)

| }
{ 	
List 
< 
ShortAnswerTest  
>  ! 
shortAnswerTestsCopy" 6
=7 8
shortAnswerTests9 I
;I J
List 
< 
ShortAnswerTest  
>  !
result" (
=) *
new+ .
List/ 3
<3 4
ShortAnswerTest4 C
>C D
(D E
)E F
;F G
while 
( 
result 
. 
Count 
<  !
numberOfQuestions" 3
)3 4
{ 
ShortAnswerTest 

RandomTest  *
=+ , 
shortAnswerTestsCopy- A
[A B!
RandomNumberGeneratorB W
.W X
GetInt32X `
(` a 
shortAnswerTestsCopya u
.u v
Countv {
){ |
]| }
;} ~
result 
. 
Add 
( 

RandomTest %
)% &
;& ' 
shortAnswerTestsCopy $
.$ %
Remove% +
(+ ,

RandomTest, 6
)6 7
;7 8
} 
return 
result 
; 
} 	
} 
} 