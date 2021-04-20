˝
öD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\CatalogController.cs
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
$str 
) 
] 
public 

class 
CatalogController "
:# $
ControllerBase% 3
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
CatalogController  
(  !
DataContext! ,
context- 4
)4 5
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
<' (
Catalog( /
>/ 0
>0 1

GetCatalog2 <
(< =
)= >
{ 	
return 
_context 
. 
Catalog #
.# $
ToList$ *
(* +
)+ ,
;, -
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
< 
Catalog #
># $
GetCatalogById% 3
(3 4
int4 7
Id8 :
): ;
{ 	
return   
_context   
.   
Catalog   #
.  # $
Find  $ (
(  ( )
Id  ) +
)  + ,
;  , -
}!! 	
[## 	
HttpPost##	 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
ActionResult$$ &
<$$& '
Catalog$$' .
>$$. /
>$$/ 0

AddCatalog$$1 ;
($$; <
[$$< =
FromBody$$= E
]$$E F
Catalog$$G N
catalog$$O V
)$$V W
{%% 	
_context&& 
.&& 
Catalog&& 
.&& 
Add&&  
(&&  !
catalog&&! (
)&&( )
;&&) *
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
$str))# 3
,))3 4
new))5 8
{))9 :
id)); =
=))> ?
catalog))@ G
.))G H
Id))H J
}))K L
,))L M
catalog))N U
)))U V
;))V W
}** 	
}++ 
},, Œ$
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
};; Œ
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
}++ 
},, ÏM
¶D:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\MultipleChoiceTestsController.cs
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
$str '
)' (
]( )
public 

class )
MultipleChoiceTestsController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
DataContext $
_context% -
;- .
public )
MultipleChoiceTestsController ,
(, -
DataContext- 8
context9 @
)@ A
{ 	
_context 
= 
context 
; 
} 	
private 
bool $
MultipleChoiceTestExists -
(- .
int. 1
id2 4
)4 5
{ 	
return 
_context 
. 
MultipleChoiceTest .
.. /
Any/ 2
(2 3
e3 4
=>5 7
e8 9
.9 :
Id: <
=== ?
id@ B
)B C
;C D
} 	
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
MultipleChoiceTest( :
>: ;
>; <"
GetMultipleChoiceTests= S
(S T
)T U
{ 	
return 
_context 
. 
MultipleChoiceTest .
.. /
ToList/ 5
(5 6
)6 7
;7 8
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
ActionResult"" 
<"" 
MultipleChoiceTest"" .
>"". /%
GetMultipleChoiceTestById""0 I
(""I J
int""J M
Id""N P
)""P Q
{## 	
return$$ 
_context$$ 
.$$ 
MultipleChoiceTest$$ .
.$$. /
Find$$/ 3
($$3 4
Id$$4 6
)$$6 7
;$$7 8
}%% 	
['' 	
HttpPost''	 
]'' 
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
<((& '
MultipleChoiceTest((' 9
>((9 :
>((: ;!
AddMultipleChoiceTest((< Q
(((Q R
[((R S
FromBody((S [
](([ \
MultipleChoiceTest((] o
multipleChoiceTest	((p Ç
)
((Ç É
{)) 	
_context** 
.** 
MultipleChoiceTest** '
.**' (
Add**( +
(**+ ,
multipleChoiceTest**, >
)**> ?
;**? @
await++ 
_context++ 
.++ 
SaveChangesAsync++ +
(+++ ,
)++, -
;++- .
return-- 
CreatedAtAction-- "
(--" #
$str--# >
,--> ?
new--@ C
{--D E
id--F H
=--I J
multipleChoiceTest--K ]
.--] ^
Id--^ `
}--a b
,--b c
multipleChoiceTest--d v
)--v w
;--w x
}.. 	
[00 	
HttpPut00	 
(00 
$str00 
)00 
]00 
public11 
async11 
Task11 
<11 
ActionResult11 &
<11& '
MultipleChoiceTest11' 9
>119 :
>11: ;"
EditMultipleChoiceTest11< R
(11R S
[11S T
FromBody11T \
]11\ ]
MultipleChoiceTest11^ p
multipleChoiceTest	11q É
,
11É Ñ
int
11Ö à
Id
11â ã
)
11ã å
{22 	
if33 
(33 
Id33 
!=33 
multipleChoiceTest33 (
.33( )
Id33) +
)33+ ,
{44 
return55 

BadRequest55 !
(55! "
)55" #
;55# $
}66 
_context88 
.88 
Entry88 
(88 
multipleChoiceTest88 -
)88- .
.88. /
State88/ 4
=885 6
EntityState887 B
.88B C
Modified88C K
;88K L
try:: 
{;; 
await<< 
_context<< 
.<< 
SaveChangesAsync<< /
(<</ 0
)<<0 1
;<<1 2
return== 
CreatedAtAction== &
(==& '
$str==' B
,==B C
new==D G
{==H I
id==J L
===M N
multipleChoiceTest==O a
.==a b
Id==b d
}==e f
,==f g
multipleChoiceTest==h z
)==z {
;=={ |
}>> 
catch?? 
(?? (
DbUpdateConcurrencyException?? /
)??/ 0
{@@ 
ifAA 
(AA 
!AA $
MultipleChoiceTestExistsAA -
(AA- .
IdAA. 0
)AA0 1
)AA1 2
{BB 
returnCC 
NotFoundCC #
(CC# $
)CC$ %
;CC% &
}DD 
elseEE 
{FF 
throwGG 
;GG 
}HH 
}II 
}JJ 	
[LL 	
HttpPostLL	 
(LL 
$strLL 
)LL 
]LL 
publicMM 
ActionResultMM 
<MM 
ListMM  
<MM  !
QuestionValidationMM! 3
>MM3 4
>MM4 5
validateUserAnswerMM6 H
(MMH I
[MMI J
FromBodyMMJ R
]MMR S
ListMMT X
<MMX Y$
MultipleChoiceTestAnswerMMY q
>MMq r&
multipleChoiceTestAnswers	MMs å
)
MMå ç
{NN 	
ListOO 
<OO 
QuestionValidationOO #
>OO# $ 
QuestionsValidationsOO% 9
=OO: ;
newOO< ?
ListOO@ D
<OOD E
QuestionValidationOOE W
>OOW X
(OOX Y
)OOY Z
;OOZ [
foreachPP 
(PP $
MultipleChoiceTestAnswerPP -
answerPP. 4
inPP5 7%
multipleChoiceTestAnswersPP8 Q
)PPQ R
{QQ 
intRR 

QuestionIdRR 
=RR  
answerRR! '
.RR' (

QuestionIdRR( 2
;RR2 3
ListSS 
<SS 
stringSS 
>SS 
UserAnswersSS (
=SS) *
answerSS+ 1
.SS1 2
UserAnswersSS2 =
;SS= >
ListTT 
<TT 
stringTT 
>TT 
CorrectAnswersTT +
;TT+ ,
ListUU 
<UU 
stringUU 
>UU 
WrongAnswersUU )
=UU* +
newUU, /
ListUU0 4
<UU4 5
stringUU5 ;
>UU; <
(UU< =
)UU= >
;UU> ?
ListVV 
<VV 
stringVV 
>VV '
CorrectButNotCheckedAnswersVV 8
=VV9 :
newVV; >
ListVV? C
<VVC D
stringVVD J
>VVJ K
(VVK L
)VVL M
;VVM N
MultipleChoiceTestXX "(
MultipleChoiceTestToValidateXX# ?
=XX@ A
_contextXXB J
.XXJ K
MultipleChoiceTestXXK ]
.XX] ^
FindXX^ b
(XXb c

QuestionIdXXc m
)XXm n
;XXn o
ifZZ 
(ZZ (
MultipleChoiceTestToValidateZZ 0
!=ZZ1 3
nullZZ4 8
)ZZ8 9
{[[ 
List\\ 
<\\ 
string\\ 
>\\  
TestCorrectAnswers\\! 3
=\\4 5(
MultipleChoiceTestToValidate\\6 R
.\\R S
CorrectAnswers\\S a
.\\a b
Split\\b g
(\\g h
$char\\h k
)\\k l
.\\l m
ToList\\m s
(\\s t
)\\t u
;\\u v
if^^ 
(^^ 
TestCorrectAnswers^^ *
==^^+ -
UserAnswers^^. 9
)^^9 :
{__ 
CorrectAnswers`` &
=``' (
UserAnswers``) 4
;``4 5 
QuestionsValidationsaa ,
.aa, -
Addaa- 0
(aa0 1
newaa1 4
QuestionValidationaa5 G
(aaG H

QuestionIdaaH R
,aaR S
CorrectAnswersaaT b
,aab c'
CorrectButNotCheckedAnswersaad 
,	aa Ä
WrongAnswers
aaÅ ç
)
aaç é
)
aaé è
;
aaè ê
}bb 
elsecc 
{dd 
CorrectAnswersee &
=ee' (
TestCorrectAnswersee) ;
.ee; <
	Intersectee< E
(eeE F
UserAnswerseeF Q
)eeQ R
.eeR S
ToListeeS Y
(eeY Z
)eeZ [
;ee[ \'
CorrectButNotCheckedAnswersff 3
=ff4 5
TestCorrectAnswersff6 H
.ffH I
ExceptffI O
(ffO P
UserAnswersffP [
)ff[ \
.ff\ ]
ToListff] c
(ffc d
)ffd e
;ffe f
WrongAnswersgg $
=gg% &
UserAnswersgg' 2
.gg2 3
Exceptgg3 9
(gg9 :
TestCorrectAnswersgg: L
)ggL M
.ggM N
ToListggN T
(ggT U
)ggU V
;ggV W
}hh  
QuestionsValidationsii (
.ii( )
Addii) ,
(ii, -
newii- 0
QuestionValidationii1 C
(iiC D

QuestionIdiiD N
,iiN O
CorrectAnswersiiP ^
,ii^ _'
CorrectButNotCheckedAnswersii` {
,ii{ |
WrongAnswers	ii} â
)
iiâ ä
)
iiä ã
;
iiã å
}jj 
}kk 
returnll  
QuestionsValidationsll '
;ll' (
}mm 	
}nn 
}oo Ï<
£D:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\ShortAnswerTestsController.cs
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
$str $
)$ %
]% &
public 

class &
ShortAnswerTestsController +
:, -
ControllerBase. <
{ 
private 
readonly 
DataContext $
_context% -
;- .
public &
ShortAnswerTestsController )
() *
DataContext* 5
context6 =
)= >
{ 	
_context 
= 
context 
; 
} 	
[ 	
HttpGet	 
( 
$str -
)- .
]. /
public 
ActionResult 
< 
List  
<  !
ShortAnswerTest! 0
>0 1
>1 2
GetRandomTest3 @
(@ A
intA D
numberOfQuestionsE V
)V W
{ 	
List 
< 
ShortAnswerTest  
>  !
ShortAnswerTests" 2
=3 4
_context5 =
.= >
ShortAnswerTest> M
.M N
ToListN T
(T U
)U V
;V W
return 
ShortAnswerTestUtil &
.& '
getRandomTestsList' 9
(9 :
numberOfQuestions: K
,K L
ShortAnswerTestsM ]
)] ^
;^ _
} 	
[ 	
HttpPost	 
( 
$str )
)) *
]* +
public 
void 
RegisterUserAnswers '
(' (
List( ,
<, -%
ShortAnswerTestUserAnswer- F
>F G
UserAnswersH S
)S T
{   	
string!! 
modified!! 
=!! 
$str!!  
;!!  !
foreach"" 
("" %
ShortAnswerTestUserAnswer"" .
answer""/ 5
in""6 8
UserAnswers""9 D
)""D E
{## 
ShortAnswerTest$$ !
ShortAnswerTestToEdit$$  5
=$$6 7
_context$$8 @
.$$@ A
ShortAnswerTest$$A P
.$$P Q
Find$$Q U
($$U V
answer$$V \
.$$\ ]

QuestionId$$] g
)$$g h
;$$h i
string%% 
result%% 
=%% !
ShortAnswerTestToEdit%%  5
.%%5 6
Question%%6 >
;%%> ?
foreach&& 
(&& 
string&& 
_answer&&  '
in&&( *
answer&&+ 1
.&&1 2
UserAnswers&&2 =
)&&= >
{'' 
int(( 
Place(( 
=(( 
result((  &
.((& '
IndexOf((' .
(((. /
$str((/ 2
)((2 3
;((3 4
result)) 
=)) 
result)) #
.))# $
Remove))$ *
())* +
Place))+ 0
,))0 1
$str))2 5
.))5 6
Length))6 <
)))< =
.))= >
Insert))> D
())D E
Place))E J
,))J K
_answer))L S
)))S T
;))T U
}** !
ShortAnswerTestToEdit++ %
.++% &
Answer++& ,
=++- .
result++/ 5
;++5 6
_context,, 
.,, 
SaveChangesAsync,, )
(,,) *
),,* +
;,,+ ,
}-- 
}.. 	
[00 	
HttpGet00	 
]00 
public11 
ActionResult11 
<11 
IEnumerable11 '
<11' (
ShortAnswerTest11( 7
>117 8
>118 9
GetShortAnswerTests11: M
(11M N
)11N O
{22 	
return33 
_context33 
.33 
ShortAnswerTest33 +
.33+ ,
ToList33, 2
(332 3
)333 4
;334 5
}44 	
[66 	
HttpGet66	 
(66 
$str66 
)66 
]66 
public77 
ActionResult77 
<77 
ShortAnswerTest77 +
>77+ ,"
GetShortAnswerTestById77- C
(77C D
int77D G
Id77H J
)77J K
{88 	
return99 
_context99 
.99 
ShortAnswerTest99 +
.99+ ,
Find99, 0
(990 1
Id991 3
)993 4
;994 5
}:: 	
[<< 	
HttpPost<<	 
]<< 
public== 
async== 
Task== 
<== 
ActionResult== &
<==& '
ShortAnswerTest==' 6
>==6 7
>==7 8
AddShortAnswerTest==9 K
(==K L
[==L M
FromBody==M U
]==U V
ShortAnswerTest==W f
shortAnswerTest==g v
)==v w
{>> 	
System?? 
.?? 
Console?? 
.?? 
	WriteLine?? $
(??$ %
shortAnswerTest??% 4
.??4 5
Answer??5 ;
+??< =
shortAnswerTest??> M
.??M N
Question??N V
)??V W
;??W X
_context@@ 
.@@ 
ShortAnswerTest@@ $
.@@$ %
Add@@% (
(@@( )
shortAnswerTest@@) 8
)@@8 9
;@@9 :
awaitAA 
_contextAA 
.AA 
SaveChangesAsyncAA +
(AA+ ,
)AA, -
;AA- .
returnCC 
CreatedAtActionCC "
(CC" #
$strCC# ;
,CC; <
newCC= @
{CCA B
idCCC E
=CCF G
shortAnswerTestCCH W
.CCW X
IdCCX Z
}CC[ \
,CC\ ]
shortAnswerTestCC^ m
)CCm n
;CCn o
}DD 	
[FF 	
HttpPutFF	 
]FF 
publicGG 
asyncGG 
TaskGG 
<GG 
ActionResultGG &
<GG& '
stringGG' -
>GG- .
>GG. /
EditShortAnswerTestGG0 C
(GGC D
[GGD E
FromBodyGGE M
]GGM N
ListGGO S
<GGS T
ShortAnswerGGT _
>GG_ `
shortAnswerTestsGGa q
)GGq r
{HH 	
foreachII 
(II 
ShortAnswerII  
shortAnswerII! ,
inII- /
shortAnswerTestsII0 @
)II@ A
{JJ 
SystemKK 
.KK 
ConsoleKK 
.KK 
	WriteLineKK (
(KK( )
shortAnswerKK) 4
.KK4 5
IdKK5 7
)KK7 8
;KK8 9
ShortAnswerTestLL 
shortAnswerTestLL  /
=LL0 1
_contextLL2 :
.LL: ;
ShortAnswerTestLL; J
.LLJ K
FindLLK O
(LLO P
shortAnswerLLP [
.LL[ \
IdLL\ ^
)LL^ _
;LL_ `
shortAnswerTestMM 
.MM  
AnswerMM  &
=MM' (
shortAnswerMM) 4
.MM4 5
ShortAnswerTextMM5 D
;MMD E
_contextNN 
.NN 
EntryNN 
(NN 
shortAnswerTestNN .
)NN. /
.NN/ 0
StateNN0 5
=NN6 7
EntityStateNN8 C
.NNC D
ModifiedNND L
;NNL M
awaitOO 
_contextOO 
.OO 
SaveChangesAsyncOO /
(OO/ 0
)OO0 1
;OO1 2
}PP 
returnQQ 
$strQQ +
;QQ+ ,
}RR 	
}SS 
}VV †I
õD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\StudentsController.cs
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
$str 
) 
] 
public 

class 
StudentsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
StudentsController !
(! "
DataContext" -
context. 5
)5 6
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
<' (
Student( /
>/ 0
>0 1
GetStudents2 =
(= >
)> ?
{ 	
return 
_context 
. 
Student #
.# $
ToList$ *
(* +
)+ ,
;, -
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
< 
Student #
># $
GetStudentById% 3
(3 4
int4 7
id8 :
): ;
{ 	
return   
_context   
.   
Student   #
.  # $
Find  $ (
(  ( )
id  ) +
)  + ,
;  , -
}!! 	
[## 	
HttpGet##	 
(## 
$str## 
)## 
]## 
public$$ 
List$$ 
<$$ 
Student$$ 
>$$ 
filterUnGradedNotes$$ 0
($$0 1
)$$1 2
{%% 	
List&& 
<&& 
Student&& 
>&& 
studentList&& %
=&&& '
new&&( +
List&&, 0
<&&0 1
Student&&1 8
>&&8 9
(&&9 :
)&&: ;
;&&; <
foreach'' 
('' 
Catalog'' 
catalog'' $
in''% '
_context''( 0
.''0 1
Catalog''1 8
)''8 9
{(( 
if)) 
()) 
catalog)) 
.)) 
Grade)) !
<))" #
$num))$ %
)))% &
{** 
studentList++ 
.++  
Add++  #
(++# $
_context++$ ,
.++, -
Student++- 4
.++4 5
Find++5 9
(++9 :
catalog++: A
.++A B
	StudentId++B K
)++K L
)++L M
;++M N
},, 
}-- 
return.. 
studentList.. 
;.. 
}// 	
[11 	
HttpGet11	 
(11 
$str11 
)11 
]11 
public22 
List22 
<22 
Student22 
>22 
FilterGradedNotes22 .
(22. /
)22/ 0
{33 	
List44 
<44 
Student44 
>44 
studentList44 %
=44& '
new44( +
List44, 0
<440 1
Student441 8
>448 9
(449 :
)44: ;
;44; <
foreach55 
(55 
Catalog55 
catalog55 $
in55% '
_context55( 0
.550 1
Catalog551 8
)558 9
{66 
if77 
(77 
catalog77 
.77 
Grade77 !
>77" #
$num77$ %
)77% &
{88 
studentList99 
.99  
Add99  #
(99# $
_context99$ ,
.99, -
Student99- 4
.994 5
Find995 9
(999 :
catalog99: A
.99A B
	StudentId99B K
)99K L
)99L M
;99M N
}:: 
};; 
return<< 
studentList<< 
;<< 
}== 	
[?? 	
HttpPost??	 
(?? 
$str?? 
)?? 
]?? 
public@@ 
async@@ 
void@@ 

BulkInsert@@ $
(@@$ %
)@@% &
{AA 	

BulkInsertBB 

bulkInsertBB !
=BB" #
newBB$ '

BulkInsertBB( 2
(BB2 3
)BB3 4
;BB4 5
forDD 
(DD 
intDD 
iDD 
=DD 
$numDD 
;DD 
iDD 
<DD 
$numDD "
;DD" #
iDD$ %
++DD% '
)DD' (
{EE 
ifFF 
(FF 
iFF 
%FF 
$numFF 
==FF 
$numFF  
)FF  !
{GG 
SystemHH 
.HH 
ConsoleHH "
.HH" #
	WriteLineHH# ,
(HH, -
iHH- .
)HH. /
;HH/ 0
}II 
StudentJJ 
student1JJ  
=JJ! "
newJJ# &
StudentJJ' .
(JJ. /
$strJJ/ 9
,JJ9 :
$strJJ; F
,JJF G
$strJJH U
,JJU V
$strJJW c
,JJc d
$strJJe o
,JJo p
$strJJq {
)JJ{ |
;JJ| }

bulkInsertKK 
.KK 
insertKK !
(KK! "
student1KK" *
,KK* +
_contextKK, 4
)KK4 5
;KK5 6
}LL 
awaitMM 
_contextMM 
.MM 
SaveChangesAsyncMM +
(MM+ ,
)MM, -
;MM- .
}NN 	
[PP 	
HttpPostPP	 
(PP 
$strPP  
)PP  !
]PP! "
publicQQ 
ActionResultQQ 
<QQ 
intQQ 
>QQ  
AuthenticateQQ! -
(QQ- .
[QQ. /
FromBodyQQ/ 7
]QQ7 8
ListQQ9 =
<QQ= >
stringQQ> D
>QQD E
studentDataQQF Q
)QQQ R
{RR 	
ListSS 
<SS 
StudentSS 
>SS 
StudentsSS "
=SS# $
_contextSS% -
.SS- .
StudentSS. 5
.SS5 6
ToListSS6 <
(SS< =
)SS= >
;SS> ?
foreachUU 
(UU 
StudentUU 
studentUU $
inUU% '
StudentsUU( 0
)UU0 1
{VV 
ifWW 
(WW 
studentWW 
.WW 
UsernameWW $
==WW% '
studentDataWW( 3
[WW3 4
$numWW4 5
]WW5 6
&&WW7 9
studentWW: A
.WWA B
PasswordWWB J
==WWK M
HashWWN R
.WWR S
hashPasswordWWS _
(WW_ `
studentDataWW` k
[WWk l
$numWWl m
]WWm n
)WWn o
)WWo p
{XX 
returnYY 
studentYY "
.YY" #
IdYY# %
;YY% &
}ZZ 
}[[ 
return\\ 
-\\ 
$num\\ 
;\\ 
}]] 	
[__ 	
HttpPost__	 
(__ 
)__ 
]__ 
public`` 
async`` 
Task`` 
<`` 
ActionResult`` &
<``& '
string``' -
>``- .
>``. /

AddStudent``0 :
(``: ;
[``; <
FromBody``< D
]``D E
List``F J
<``J K
string``K Q
>``Q R
studentData``S ^
)``^ _
{aa 	
Studentbb 
studentToAddbb  
=bb! "
newbb# &
Studentbb' .
(bb. /
studentDatabb/ :
[bb: ;
$numbb; <
]bb< =
,bb= >
Hashbb? C
.bbC D
hashPasswordbbD P
(bbP Q
studentDatabbQ \
[bb\ ]
$numbb] ^
]bb^ _
)bb_ `
,bb` a
studentDatabbb m
[bbm n
$numbbn o
]bbo p
,bbp q
$strbbr t
,bbt u
studentData	bbv Å
[
bbÅ Ç
$num
bbÇ É
]
bbÉ Ñ
,
bbÑ Ö
$str
bbÜ à
)
bbà â
;
bbâ ä
_contextdd 
.dd 
Studentdd 
.dd 
Adddd  
(dd  !
studentToAdddd! -
)dd- .
;dd. /
awaitee 
_contextee 
.ee 
SaveChangesAsyncee +
(ee+ ,
)ee, -
;ee- .
ifgg 
(gg 
_contextgg 
.gg 
Studentgg  
.gg  !
Findgg! %
(gg% &
studentToAddgg& 2
.gg2 3
Idgg3 5
)gg5 6
!=gg7 9
nullgg: >
)gg> ?
{hh 
returnii 
Okii 
(ii 
$strii ,
+ii- .
studentToAddii/ ;
.ii; <
Idii< >
+ii? @
$striiA S
)iiS T
;iiT U
}jj 
elsejj 
{kk 
returnll 
Okll 
(ll 
$strll .
)ll. /
;ll/ 0
}mm 
}nn 	
}oo 
}pp ¥;
õD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Controllers\TeachersController.cs
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
TeachersController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 
TeachersController !
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
Teacher( /
>/ 0
>0 1
GetTeachers2 =
(= >
)> ?
{ 	
return 
_context 
. 
Teacher #
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
>D E
teachersDataF R
)R S
{ 	
List 
< 
Teacher 
> 
Teachers "
=# $
_context% -
.- .
Teacher. 5
.5 6
ToList6 <
(< =
)= >
;> ?
foreach!! 
(!! 
Teacher!! 
teacher!! $
in!!% '
Teachers!!( 0
)!!0 1
{"" 
if## 
(## 
teacher## 
.## 
Username## $
==##% '
teachersData##( 4
[##4 5
$num##5 6
]##6 7
&&##8 :
teacher##; B
.##B C
Password##C K
==##L N
Hash##O S
.##S T
hashPassword##T `
(##` a
teachersData##a m
[##m n
$num##n o
]##o p
)##p q
)##q r
{$$ 
return%% 
teacher%% "
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

AddTeacher,,0 :
(,,: ;
[,,; <
FromBody,,< D
],,D E
List,,F J
<,,J K
string,,K Q
>,,Q R
teachersData,,S _
),,_ `
{-- 	
Teacher.. 
teacherToAdd..  
=..! "
new..# &
Teacher..' .
(... /
teachersData../ ;
[..; <
$num..< =
]..= >
,..> ?
Hash..@ D
...D E
hashPassword..E Q
(..Q R
teachersData..R ^
[..^ _
$num.._ `
]..` a
)..a b
,..b c
teachersData..d p
[..p q
$num..q r
]..r s
,..s t
$str..u w
,..w x
teachersData	..y Ö
[
..Ö Ü
$num
..Ü á
]
..á à
,
..à â
$str
..ä å
)
..å ç
;
..ç é
_context00 
.00 
Teacher00 
.00 
Add00  
(00  !
teacherToAdd00! -
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
Teacher33  
.33  !
Find33! %
(33% &
teacherToAdd33& 2
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
teacherToAdd55/ ;
.55; <
Id55< >
+55? @
$str55A S
)55S T
;55T U
}66 
else77 
{88 
return99 
Ok99 
(99 
$str99 .
)99. /
;99/ 0
}:: 
};; 	
[== 	
HttpGet==	 
(== 
$str==  
)==  !
]==! "
public>> 
List>> 
<>> 
Student>> 
>>> 
FilterUnGradedNotes>> 0
(>>0 1
int>>1 4
id>>5 7
)>>7 8
{?? 	
List@@ 
<@@ 
Student@@ 
>@@ 
studentList@@ %
=@@& '
new@@( +
List@@, 0
<@@0 1
Student@@1 8
>@@8 9
(@@9 :
)@@: ;
;@@; <
foreachAA 
(AA 
CatalogAA 
catalogAA $
inAA% '
_contextAA( 0
.AA0 1
CatalogAA1 8
)AA8 9
{BB 
ifCC 
(CC 
catalogCC 
.CC 
GradeCC !
<CC" #
$numCC$ %
&&CC& (
catalogCC) 0
.CC0 1
	TeacherIdCC1 :
==CC; =
idCC> @
)CC@ A
{DD 
studentListEE 
.EE  
AddEE  #
(EE# $
_contextEE$ ,
.EE, -
StudentEE- 4
.EE4 5
FindEE5 9
(EE9 :
catalogEE: A
.EEA B
	StudentIdEEB K
)EEK L
)EEL M
;EEM N
}FF 
}GG 
returnHH 
studentListHH 
;HH 
}II 	
[KK 	
HttpGetKK	 
(KK 
$strKK 
)KK 
]KK  
publicLL 
ListLL 
<LL 
StudentLL 
>LL 
FilterGradedNotesLL .
(LL. /
intLL/ 2
idLL3 5
)LL5 6
{MM 	
ListNN 
<NN 
StudentNN 
>NN 
studentListNN %
=NN& '
newNN( +
ListNN, 0
<NN0 1
StudentNN1 8
>NN8 9
(NN9 :
)NN: ;
;NN; <
foreachOO 
(OO 
CatalogOO 
catalogOO $
inOO% '
_contextOO( 0
.OO0 1
CatalogOO1 8
)OO8 9
{PP 
ifQQ 
(QQ 
catalogQQ 
.QQ 
GradeQQ !
>QQ" #
$numQQ$ %
&&QQ& (
catalogQQ) 0
.QQ0 1
	TeacherIdQQ1 :
==QQ; =
idQQ> @
)QQ@ A
{RR 
studentListSS 
.SS  
AddSS  #
(SS# $
_contextSS$ ,
.SS, -
StudentSS- 4
.SS4 5
FindSS5 9
(SS9 :
catalogSS: A
.SSA B
	StudentIdSSB K
)SSK L
)SSL M
;SSM N
}TT 
}UU 
returnVV 
studentListVV 
;VV 
}WW 	
}XX 
}YY œ
çD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Catalog.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Catalog 
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
$str 
, 
TypeName &
=' (
$str) 2
)2 3
]3 4
public 
int 
	StudentId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Column	 
( 
$str 
, 
TypeName &
=' (
$str) 2
)2 3
]3 4
public 
int 
	TeacherId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Column	 
( 
$str 
, 
TypeName #
=$ %
$str& /
)/ 0
]0 1
public 
int 
ExamId 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Column	 
( 
$str 
, 
TypeName !
=" #
$str$ -
)- .
]. /
public 
int 
Grade 
{ 
get 
; 
set  #
;# $
}% &
public 
Catalog 
( 
) 
{ 	
} 	
public 
Catalog 
( 
int 

student_id %
,% &
int' *

teacher_id+ 5
,5 6
int7 :
exam_id; B
,B C
intD G
gradeH M
)M N
{ 	
	StudentId 
= 

student_id "
;" #
	TeacherId 
= 

teacher_id "
;" #
ExamId 
= 
exam_id 
; 
Grade 
= 
grade 
; 
}   	
}!! 
}"" û
åD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Course.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Course 
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
$str 
, 
TypeName !
=" #
$str$ ,
), -
]- .
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Column	 
( 
$str 
, 
TypeName #
=$ %
$str& +
)+ ,
], -
public 
string 
Credits 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
Student 
> 
enrolled_students .
=/ 0
new1 4
List5 9
<9 :
Student: A
>A B
(B C
)C D
;D E
public 
List 
< 
Teacher 
> 
course_authors +
=, -
new. 1
List2 6
<6 7
Teacher7 >
>> ?
(? @
)@ A
;A B
public 
Course 
( 
) 
{ 	
} 	
public 
Course 
( 
string 
title "
," #
string$ *
credits+ 2
)2 3
{ 	
this 
. 
Title 
= 
title 
; 
this 
. 
Credits 
= 
credits "
;" #
} 	
} 
} ‘
èD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\EssayTest.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
	EssayTest 
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
$str 
, 
TypeName #
=$ %
$str& +
)+ ,
], -
public 
int 
ExamId 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Column	 
( 
$str 
, 
TypeName &
=' (
$str) 1
)1 2
]2 3
public 
string 
	EssayText 
{  !
get" %
;% &
set' *
;* +
}, -
public 
	EssayTest 
( 
) 
{ 	
} 	
public 
	EssayTest 
( 
int 
id 
,  
string! '
question( 0
)0 1
{ 	
this 
. 
Id 
= 
id 
; 
this 
. 
Question 
= 
question $
;$ %
} 	
} 
} ü
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
} ê
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
 
,

 
TypeName

 %
=

& '
$str

( -
)

- .
]

. /
public 
int 
CourseId 
{ 
get !
;! "
set# &
;& '
}( )
=* +
-, -
$num- .
;. /
} 
} ÷
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
$str 
, 
TypeName #
=$ %
$str& +
)+ ,
], -
public 
int 
ExamId 
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
[ 	
Column	 
( 
$str  
,  !
TypeName" *
=+ ,
$str- 5
)5 6
]6 7
public 
string 
CorrectAnswers $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
MultipleChoiceTest !
(! "
)" #
{ 	
} 	
public 
MultipleChoiceTest !
(! "
int" %
id& (
,( )
string* 0
question1 9
,9 :
string; A
possibleAnswersB Q
,Q R
stringS Y
correctAnswersZ h
)h i
{ 	
this 
. 
Id 
= 
id 
; 
this 
. 
Question 
= 
question $
;$ %
this 
. 
PossibleAnswers  
=! "
possibleAnswers# 2
;2 3
} 	
}!! 
}"" ê	
ûD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\MultipleChoiceTestAnswer.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class $
MultipleChoiceTestAnswer )
{ 
public 
int 

QuestionId 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
List		 
<		 
string		 
>		 
UserAnswers		 '
{		( )
get		* -
;		- .
set		/ 2
;		2 3
}		4 5
public $
MultipleChoiceTestAnswer '
(' (
int( +

questionId, 6
,6 7
List8 <
<< =
string= C
>C D
userAnswersE P
)P Q
{ 	

QuestionId 
= 

questionId #
;# $
UserAnswers 
= 
userAnswers %
;% &
} 	
} 
} Î
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
} ∂
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
[ 	
Column	 
( 
$str 
, 
TypeName #
=$ %
$str& +
)+ ,
], -
public 
int 
ExamId 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Column	 
( 
$str 
, 
TypeName "
=# $
$str% -
)- .
]. /
public 
string 
Answer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ShortAnswerTest 
( 
)  
{ 	
} 	
public 
ShortAnswerTest 
( 
int "
id# %
,% &
string' -
question. 6
,6 7
string8 >
answer? E
)E F
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
. 
Answer 
= 
answer  
;  !
} 	
public 
ShortAnswerTest 
( 
int "
id# %
,% &
string' -
question. 6
,6 7
string8 >
answer? E
)E F
{   	
this!! 
.!! 
Id!! 
=!! 
id!! 
;!! 
this"" 
."" 
Question"" 
="" 
question"" $
;""$ %
this## 
.## 
Answer## 
=## 
answer##  
;##  !
}$$ 	
}%% 
}&& ì	
üD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\ShortAnswerTestUserAnswer.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class %
ShortAnswerTestUserAnswer *
{ 
public 
int 

QuestionId 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
List		 
<		 
string		 
>		 
UserAnswers		 '
{		( )
get		* -
;		- .
set		/ 2
;		2 3
}		4 5
public %
ShortAnswerTestUserAnswer (
(( )
int) ,

questionId- 7
,7 8
List9 =
<= >
string> D
>D E
userAnswersF Q
)Q R
{ 	

QuestionId 
= 

questionId #
;# $
UserAnswers 
= 
userAnswers %
;% &
} 	
} 
} “
çD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Student.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Student 
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
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
$str 
, 
TypeName $
=% &
$str' /
)/ 0
]0 1
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
$str 
, 
TypeName !
=" #
$str$ ,
), -
]- .
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Column	 
( 
$str 
, 
TypeName '
=( )
$str* 2
)2 3
]3 4
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Column	 
( 
$str 
, 
TypeName #
=$ %
$str& .
). /
]/ 0
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Column	 
( 
$str 
, 
TypeName '
=( )
$str* 2
)2 3
]3 4
public 
string 
NumarMatricol #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
Student 
( 
) 
{ 	
} 	
public   
Student   
(   
string   
username   &
,  & '
string  ( .
password  / 7
,  7 8
string  9 ?
email  @ E
,  E F
string  G M
phoneNumber  N Y
,  Y Z
string  [ a
address  b i
,  i j
string  k q
numarMatricol  r 
)	   Ä
{!! 	
this"" 
."" 
Username"" 
="" 
username"" $
;""$ %
this## 
.## 
Password## 
=## 
password## $
;##$ %
this$$ 
.$$ 
Email$$ 
=$$ 
email$$ 
;$$ 
this%% 
.%% 
PhoneNumber%% 
=%% 
phoneNumber%% *
;%%* +
this&& 
.&& 
Address&& 
=&& 
address&& "
;&&" #
this'' 
.'' 
NumarMatricol'' 
=''  
numarMatricol''! .
;''. /
}(( 	
}++ 
},, É
çD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Entities\Teacher.cs
	namespace 	
MakeTheGradeAPI
 
. 
Entities "
{ 
public 

class 
Teacher 
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
}* +
List 
< 
Course 
> 
courses_list !
=" #
new$ '
List( ,
<, -
Course- 3
>3 4
(4 5
)5 6
;6 7
public 
Teacher 
( 
) 
{ 	
} 	
public 
Teacher 
( 
string 
username &
,& '
string( .
password/ 7
,7 8
string9 ?
email@ E
,E F
stringG M
phoneNumberN Y
,Y Z
string[ a
addressb i
,i j
stringk q
numarMatricolr 
)	 Ä
{   	
this!! 
.!! 
Username!! 
=!! 
username!! $
;!!$ %
this"" 
."" 
Password"" 
="" 
password"" $
;""$ %
this## 
.## 
Email## 
=## 
email## 
;## 
this$$ 
.$$ 
PhoneNumber$$ 
=$$ 
phoneNumber$$ *
;$$* +
this%% 
.%% 
Address%% 
=%% 
address%% "
;%%" #
}&& 	
}'' 
}(( ∏
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
} ¥
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
public 
DataContext 
( 
DbContextOptions +
<+ ,
DataContext, 7
>7 8
options9 @
)@ A
:B C
baseD H
(H I
optionsI P
)P Q
{		 	
}

 	
public 
DbSet 
< 
Exam 
> 
Exam 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DbSet 
< 
MultipleChoiceTest '
>' (
MultipleChoiceTest) ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
DbSet 
< 
ShortAnswerTest $
>$ %
ShortAnswerTest& 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
DbSet 
< 
	EssayTest 
> 
	EssayTest  )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DbSet 
< 
Student 
> 
Student %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DbSet 
< 
Teacher 
> 
Teacher %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DbSet 
< 
Course 
> 
Course #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
DbSet 
< 
Catalog 
> 
Catalog %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ˆ

ÑD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Program.cs
	namespace 	
MakeTheGradeAPI
 
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} § 
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
} È
òD:\Facultate\Anul III\Semestrul II\[TSPN] Tehnici speciale programare .NET\MakeTheGrade\MakeTheGradeAPIV2\MakeTheGradeAPI\Utils\BulkInsert\BulkInsert.cs
	namespace 	
MakeTheGradeAPI
 
. 
Utils 
.  

BulkInsert  *
{		 
public

 

class

 

BulkInsert

 
{ 
private 
readonly 
DataContext $
_context% -
;- .
public 

BulkInsert 
( 
) 
{ 	
} 	
public 
async 
void 
insert  
(  !
Student! (
student) 0
,0 1
DataContext2 =
context> E
)E F
{ 	
context 
. 
Student 
. 
Add 
(  
student  '
)' (
;( )
} 	
} 
} ˘
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