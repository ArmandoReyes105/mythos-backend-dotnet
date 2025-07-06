‹6
ÅC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\UnitOfWork\UnitOfWork.cs
	namespace 	!
mythos_backend_dotnet
 
.  

UnitOfWork  *
{ 
public 

class 

UnitOfWork 
: 
IUnitOfWork )
{		 
private

 
readonly

 
MythosDbContext

 (
_context

) 1
;

1 2
private !
IDbContextTransaction %
?% &
_transaction' 3
;3 4
public '
ISubscriptionPlanRepository *
Subscriptions+ 8
{9 :
get; >
;> ?
}@ A
public *
IAccountSubscriptionRepository - 
AccountSubscriptions. B
{C D
getE H
;H I
}J K
public "
ITransactionRepository %
Transactions& 2
{3 4
get5 8
;8 9
}: ;
public #
IMythosWalletRepository &
MythosWallet' 3
{4 5
get6 9
;9 :
}; <
public 
IAccountRepository !
Accounts" *
{+ ,
get- 0
;0 1
}2 3
public 
IPersonRepository  
People! '
{( )
get* -
;- .
}/ 0
public 
IPurchaseRepository "
	Purchases# ,
{- .
get/ 2
;2 3
}4 5
public (
IMythosTransactionRepository +
MythosTransactions, >
{? @
getA D
;D E
}F G
public 

UnitOfWork 
( 
MythosDbContext 
context #
,# $'
ISubscriptionPlanRepository '"
subscriptionRepository( >
,> ?*
IAccountSubscriptionRepository *)
accountSubscriptionRepository+ H
,H I"
ITransactionRepository "!
transactionRepository# 8
,8 9#
IMythosWalletRepository #"
mythosWalletRepository$ :
,: ;
IAccountRepository 
accountRepository 0
,0 1
IPersonRepository 
personRepository .
,. /
IPurchaseRepository 
purchaseRepository  2
,2 3(
IMythosTransactionRepository ('
mythosTransactionRepository) D
)D E
{   	
this!! 
.!! 
_context!! 
=!! 
context!! #
;!!# $
this"" 
."" 
Subscriptions"" 
=""  "
subscriptionRepository""! 7
;""7 8
this## 
.##  
AccountSubscriptions## %
=##& ')
accountSubscriptionRepository##( E
;##E F
this$$ 
.$$ 
Transactions$$ 
=$$ !
transactionRepository$$  5
;$$5 6
this%% 
.%% 
MythosWallet%% 
=%% "
mythosWalletRepository%%  6
;%%6 7
this&& 
.&& 
Accounts&& 
=&& 
accountRepository&& -
;&&- .
this'' 
.'' 
People'' 
='' 
personRepository'' *
;''* +
this(( 
.(( 
	Purchases(( 
=(( 
purchaseRepository(( /
;((/ 0
this)) 
.)) 
MythosTransactions)) #
=))$ %'
mythosTransactionRepository))& A
;))A B
}** 	
public,, 
async,, 
Task,, !
BeginTransactionAsync,, /
(,,/ 0
),,0 1
{-- 	
_transaction.. 
??=.. 
await.. "
_context..# +
...+ ,
Database.., 4
...4 5!
BeginTransactionAsync..5 J
(..J K
)..K L
;..L M
}// 	
public11 
async11 
Task11 "
CommitTransactionAsync11 0
(110 1
)111 2
{22 	
if33 
(33 
_transaction33 
is33 
null33  $
)33$ %
throw44 
new44 %
InvalidOperationException44 3
(443 4
$str444 K
)44K L
;44L M
await66 
_transaction66 
.66 
CommitAsync66 *
(66* +
)66+ ,
;66, -
await77 
_transaction77 
.77 
DisposeAsync77 +
(77+ ,
)77, -
;77- .
_transaction88 
=88 
null88 
;88  
}99 	
public;; 
async;; 
Task;; $
RollbackTransactionAsync;; 2
(;;2 3
);;3 4
{<< 	
if== 
(== 
_transaction== 
is== 
null==  $
)==$ %
throw>> 
new>> %
InvalidOperationException>> 3
(>>3 4
$str>>4 K
)>>K L
;>>L M
await@@ 
_transaction@@ 
.@@ 
RollbackAsync@@ ,
(@@, -
)@@- .
;@@. /
awaitAA 
_transactionAA 
.AA 
DisposeAsyncAA +
(AA+ ,
)AA, -
;AA- .
_transactionBB 
=BB 
nullBB 
;BB  
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
intEE 
>EE 
	SaveAsyncEE (
(EE( )
)EE) *
{FF 	
returnGG 
awaitGG 
_contextGG !
.GG! "
SaveChangesAsyncGG" 2
(GG2 3
)GG3 4
;GG4 5
}HH 	
publicJJ 
asyncJJ 
TaskJJ %
ExecuteInTransactionAsyncJJ 3
(JJ3 4
FuncJJ4 8
<JJ8 9
TaskJJ9 =
>JJ= >
actionJJ? E
)JJE F
{KK 	
awaitLL !
BeginTransactionAsyncLL '
(LL' (
)LL( )
;LL) *
tryNN 
{OO 
awaitPP 
actionPP 
(PP 
)PP 
;PP 
awaitQQ "
CommitTransactionAsyncQQ ,
(QQ, -
)QQ- .
;QQ. /
}RR 
catchSS 
{TT 
awaitUU $
RollbackTransactionAsyncUU .
(UU. /
)UU/ 0
;UU0 1
throwVV 
;VV 
}WW 
}XX 	
publicZZ 
voidZZ 
DisposeZZ 
(ZZ 
)ZZ 
{[[ 	
_context\\ 
.\\ 
Dispose\\ 
(\\ 
)\\ 
;\\ 
GC]] 
.]] 
SuppressFinalize]] 
(]]  
this]]  $
)]]$ %
;]]% &
}^^ 	
}__ 
}`` ›
ÇC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\UnitOfWork\IUnitOfWork.cs
	namespace 	!
mythos_backend_dotnet
 
.  

UnitOfWork  *
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ '
ISubscriptionPlanRepository #
Subscriptions$ 1
{2 3
get4 7
;7 8
}9 :*
IAccountSubscriptionRepository & 
AccountSubscriptions' ;
{< =
get> A
;A B
}C D"
ITransactionRepository		 
Transactions		 +
{		, -
get		. 1
;		1 2
}		3 4#
IMythosWalletRepository

 
MythosWallet

  ,
{

- .
get

/ 2
;

2 3
}

4 5
IAccountRepository 
Accounts #
{$ %
get& )
;) *
}+ ,
IPersonRepository 
People  
{! "
get# &
;& '
}( )
IPurchaseRepository 
	Purchases %
{& '
get( +
;+ ,
}- .(
IMythosTransactionRepository $
MythosTransactions% 7
{8 9
get: =
;= >
}? @
Task !
BeginTransactionAsync "
(" #
)# $
;$ %
Task "
CommitTransactionAsync #
(# $
)$ %
;% &
Task $
RollbackTransactionAsync %
(% &
)& '
;' (
Task 
< 
int 
> 
	SaveAsync 
( 
) 
; 
Task %
ExecuteInTransactionAsync &
(& '
Func' +
<+ ,
Task, 0
>0 1
action2 8
)8 9
;9 :
} 
} ˛S
ÜC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\WithdrawalService.cs
public 
class 
WithdrawalService 
:  
IWithdrawalService! 3
{ 
private 
readonly 
MythosDbContext $
_context% -
;- .
private		 
const		 
decimal		 
ConversionRate		 (
=		) *
$num		+ /
;		/ 0
public 

WithdrawalService 
( 
MythosDbContext ,
context- 4
)4 5
{ 
_context 
= 
context 
; 
} 
public 

async 
Task 
< !
WithdrawalResponseDto +
>+ ,"
RequestWithdrawalAsync- C
(C D
GuidD H
userIdI O
,O P&
CreateWithdrawalRequestDtoQ k
dtol o
)o p
{ 
var 
user 
= 
await 
_context !
.! "
Accounts" *
.* +
	FindAsync+ 4
(4 5
userId5 ;
); <
;< =
if 

( 
user 
== 
null 
) 
return 
BuildResponse  
(  !
$str! L
,L M
$numN O
,O P
$numQ R
,R S
$strT _
)_ `
;` a
var 
wallet 
= 
await 
_context #
.# $
MythosWallets$ 1
.1 2
FirstOrDefaultAsync2 E
(E F
wF G
=>H J
wK L
.L M
UserIdM S
==T V
userIdW ]
)] ^
;^ _
if 

( 
wallet 
== 
null 
|| 
wallet $
.$ %
IsLocked% -
)- .
return 
BuildResponse  
(  !
$str! L
,L M
$numN O
,O P
$numQ R
,R S
$strT _
)_ `
;` a
if 

( 
dto 
. 
Amount 
<= 
$num 
) 
return 
BuildResponse  
(  !
$str! O
,O P
$numQ R
,R S
$numT U
,U V
$strW b
)b c
;c d
if 

( 
wallet 
. 
MythrasBalance !
<" #
dto$ '
.' (
Amount( .
). /
return 
BuildResponse  
(  !
$str! E
,E F
$numG H
,H I
$numJ K
,K L
$strM X
)X Y
;Y Z
if   

(   
!   
ValidateCardNumber   
(    
dto    #
.  # $

CardNumber  $ .
,  . /
out  0 3
string  4 :
	cardError  ; D
)  D E
)  E F
return!! 
BuildResponse!!  
(!!  !
	cardError!!! *
,!!* +
$num!!, -
,!!- .
$num!!/ 0
,!!0 1
$str!!2 =
)!!= >
;!!> ?
if## 

(## 
string## 
.## 
IsNullOrWhiteSpace## %
(##% &
dto##& )
.##) *

CardHolder##* 4
)##4 5
||##6 8
dto##9 <
.##< =

CardHolder##= G
.##G H
Length##H N
<##O P
$num##Q R
)##R S
return$$ 
BuildResponse$$  
($$  !
$str$$! k
,$$k l
$num$$m n
,$$n o
$num$$p q
,$$q r
$str$$s ~
)$$~ 
;	$$ Ä
if&& 

(&& 
string&& 
.&& 
IsNullOrWhiteSpace&& %
(&&% &
dto&&& )
.&&) *
Bank&&* .
)&&. /
)&&/ 0
return'' 
BuildResponse''  
(''  !
$str''! ;
,''; <
$num''= >
,''> ?
$num''@ A
,''A B
$str''C N
)''N O
;''O P
using)) 
var)) 
tx)) 
=)) 
await)) 
_context)) %
.))% &
Database))& .
.)). /!
BeginTransactionAsync))/ D
())D E
)))E F
;))F G
try** 
{++ 	
wallet,, 
.,, 
MythrasBalance,, !
-=,," $
dto,,% (
.,,( )
Amount,,) /
;,,/ 0
wallet-- 
.-- 
LastUpdated-- 
=--  
DateTime--! )
.--) *
UtcNow--* 0
;--0 1
var.. 

withdrawal.. 
=.. 
new..  

Withdrawal..! +
{// 
WriterUserId00 
=00 
userId00 %
,00% &
SubtractedMythras11 !
=11" #
dto11$ '
.11' (
Amount11( .
,11. /
AmountRealMoney22 
=22  !
dto22" %
.22% &
Amount22& ,
*22- .
ConversionRate22/ =
,22= >
RequestedDate33 
=33 
DateTime33  (
.33( )
UtcNow33) /
,33/ 0
Status44 
=44 
$str44 #
}55 
;55 
await77 
_context77 
.77 
Withdrawals77 &
.77& '
AddAsync77' /
(77/ 0

withdrawal770 :
)77: ;
;77; <
await88 
_context88 
.88 
SaveChangesAsync88 +
(88+ ,
)88, -
;88- .
await99 
tx99 
.99 
CommitAsync99  
(99  !
)99! "
;99" #
return;; 
BuildResponse;;  
(;;  !
$str;;! B
,;;B C
dto;;D G
.;;G H
Amount;;H N
,;;N O

withdrawal;;P Z
.;;Z [
AmountRealMoney;;[ j
,;;j k

withdrawal;;l v
.;;v w
Status;;w }
,;;} ~

withdrawal	;; â
.
;;â ä
RequestedDate
;;ä ó
)
;;ó ò
;
;;ò ô
}<< 	
catch== 
{>> 	
await?? 
tx?? 
.?? 
RollbackAsync?? "
(??" #
)??# $
;??$ %
return@@ 
BuildResponse@@  
(@@  !
$str@@! Q
,@@Q R
$num@@S T
,@@T U
$num@@V W
,@@W X
$str@@Y d
)@@d e
;@@e f
}AA 	
}BB 
privateDD !
WithdrawalResponseDtoDD !
BuildResponseDD" /
(DD/ 0
stringDD0 6
messageDD7 >
,DD> ?
intDD@ C
mythrasDDD K
,DDK L
decimalDDM T
pesosDDU Z
,DDZ [
stringDD\ b
statusDDc i
,DDi j
DateTimeDDk s
?DDs t
dateDDu y
=DDz {
null	DD| Ä
)
DDÄ Å
{EE 
returnFF 
newFF !
WithdrawalResponseDtoFF (
{GG 	
MessageHH 
=HH 
messageHH 
,HH 
WithdrawnMythrasII 
=II 
mythrasII &
,II& '
AmountInPesosJJ 
=JJ 
pesosJJ !
,JJ! "
StatusKK 
=KK 
statusKK 
,KK 
RequestedDateLL 
=LL 
dateLL  
??LL! #
DateTimeLL$ ,
.LL, -
UtcNowLL- 3
}MM 	
;MM	 

}NN 
privatePP 
boolPP 
ValidateCardNumberPP #
(PP# $
stringPP$ *

cardNumberPP+ 5
,PP5 6
outPP7 :
stringPP; A
errorPPB G
)PPG H
{QQ 
errorRR 
=RR 
$strRR 
;RR 
ifSS 

(SS 
stringSS 
.SS 
IsNullOrWhiteSpaceSS %
(SS% &

cardNumberSS& 0
)SS0 1
||SS2 4

cardNumberSS5 ?
.SS? @
LengthSS@ F
!=SSG I
$numSSJ L
||SSM O
!SSP Q

cardNumberSSQ [
.SS[ \
AllSS\ _
(SS_ `
charSS` d
.SSd e
IsDigitSSe l
)SSl m
)SSm n
{TT 	
errorUU 
=UU 
$strUU A
;UUA B
returnVV 
falseVV 
;VV 
}WW 	
ifXX 

(XX 
!XX 
	LuhnCheckXX 
(XX 

cardNumberXX !
)XX! "
)XX" #
{YY 	
errorZZ 
=ZZ 
$strZZ S
;ZZS T
return[[ 
false[[ 
;[[ 
}\\ 	
return]] 
true]] 
;]] 
}^^ 
private`` 
bool`` 
	LuhnCheck`` 
(`` 
string`` !
number``" (
)``( )
{aa 
intbb 
sumbb 
=bb 
$numbb 
;bb 
boolcc 
	alternatecc 
=cc 
falsecc 
;cc 
fordd 
(dd 
intdd 
idd 
=dd 
numberdd 
.dd 
Lengthdd "
-dd# $
$numdd% &
;dd& '
idd( )
>=dd* ,
$numdd- .
;dd. /
idd0 1
--dd1 3
)dd3 4
{ee 	
intff 
nff 
=ff 
intff 
.ff 
Parseff 
(ff 
numberff $
[ff$ %
iff% &
]ff& '
.ff' (
ToStringff( 0
(ff0 1
)ff1 2
)ff2 3
;ff3 4
ifgg 
(gg 
	alternategg 
)gg 
{hh 
nii 
*=ii 
$numii 
;ii 
ifjj 
(jj 
njj 
>jj 
$numjj 
)jj 
nkk 
-=kk 
$numkk 
;kk 
}ll 
summm 
+=mm 
nmm 
;mm 
	alternatenn 
=nn 
!nn 
	alternatenn "
;nn" #
}oo 	
returnpp 
sumpp 
%pp 
$numpp 
==pp 
$numpp 
;pp 
}qq 
}rr òÆ
ãC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\MythrasPurchaseService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

class "
MythrasPurchaseService '
:( )#
IMythrasPurchaseService* A
{		 
private

 
readonly

 
MythosDbContext

 (
_context

) 1
;

1 2
public "
MythrasPurchaseService %
(% &
MythosDbContext& 5
context6 =
)= >
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
( 
bool 
,  
string! '
,' (&
PurchaseMythrasResponseDto) C
?C D
)D E
>E F 
PurchaseMythrasAsyncG [
([ \
Guid\ `
userIda g
,g h&
PurchaseMythrasRequestDto	i Ç
dto
É Ü
)
Ü á
{ 	
var 
mythrasPackage 
=  
await! &#
GetActiveMythrasPackage' >
(> ?
dto? B
.B C
MythrasPackageIdC S
)S T
;T U
if 
( 
mythrasPackage 
== !
null" &
)& '
return 
( 
false 
, 
$str M
,M N
nullO S
)S T
;T U
if 
( 
! 
ValidateCard 
( 
dto !
,! "
out# &
var' *
errorMsg+ 3
)3 4
)4 5
return 
( 
false 
, 
errorMsg '
,' (
null) -
)- .
;. /
var 
wallet 
= 
await 
GetOrCreateWallet 0
(0 1
userId1 7
)7 8
;8 9
if 
( 
wallet 
. 
IsLocked 
)  
return 
( 
false 
, 
$str R
,R S
nullT X
)X Y
;Y Z
return 
await "
ProcessMythrasPurchase /
(/ 0
wallet0 6
,6 7
mythrasPackage8 F
,F G
dtoH K
)K L
;L M
} 	
private!! 
async!! 
Task!! 
<!! 
MythrasPackage!! )
?!!) *
>!!* +#
GetActiveMythrasPackage!!, C
(!!C D
int!!D G
	packageId!!H Q
)!!Q R
{"" 	
return## 
await## 
_context## !
.##! "
MythrasPackages##" 1
.$$ 
FirstOrDefaultAsync$$ $
($$$ %
mp$$% '
=>$$( *
mp$$+ -
.$$- .
MythrasPackageId$$. >
==$$? A
	packageId$$B K
&&$$L N
mp$$O Q
.$$Q R
IsActive$$R Z
)$$Z [
;$$[ \
}%% 	
private'' 
async'' 
Task'' 
<'' 
MythosWallet'' '
>''' (
GetOrCreateWallet'') :
('': ;
Guid''; ?
userId''@ F
)''F G
{(( 	
var)) 
wallet)) 
=)) 
await)) 
_context)) '
.))' (
MythosWallets))( 5
.))5 6
FirstOrDefaultAsync))6 I
())I J
w))J K
=>))L N
w))O P
.))P Q
UserId))Q W
==))X Z
userId))[ a
)))a b
;))b c
if** 
(** 
wallet** 
==** 
null** 
)** 
{++ 
wallet,, 
=,, 
new,, 
MythosWallet,, )
{-- 
UserId.. 
=.. 
userId.. #
,..# $
MythrasBalance// "
=//# $
$num//% &
,//& '
IsLocked00 
=00 
false00 $
,00$ %
LastUpdated11 
=11  !
DateTime11" *
.11* +
UtcNow11+ 1
}22 
;22 
await33 
_context33 
.33 
MythosWallets33 ,
.33, -
AddAsync33- 5
(335 6
wallet336 <
)33< =
;33= >
await44 
_context44 
.44 
SaveChangesAsync44 /
(44/ 0
)440 1
;441 2
}55 
return66 
wallet66 
;66 
}77 	
private99 
async99 
Task99 
<99 
(99 
bool99  
,99  !
string99" (
,99( )&
PurchaseMythrasResponseDto99* D
?99D E
)99E F
>99F G"
ProcessMythrasPurchase99H ^
(99^ _
MythosWallet:: 
wallet:: 
,::  
MythrasPackage::! /
mythrasPackage::0 >
,::> ?%
PurchaseMythrasRequestDto::@ Y
dto::Z ]
)::] ^
{;; 	
using<< 
var<< 
transaction<< !
=<<" #
await<<$ )
_context<<* 2
.<<2 3
Database<<3 ;
.<<; <!
BeginTransactionAsync<<< Q
(<<Q R
)<<R S
;<<S T
try== 
{>> 
var?? 
totalMythras??  
=??! "
mythrasPackage??# 1
.??1 2
MythrasAmount??2 ?
+??@ A
mythrasPackage??B P
.??P Q
BonusMythras??Q ]
;??] ^
wallet@@ 
.@@ 
MythrasBalance@@ %
+=@@& (
totalMythras@@) 5
;@@5 6
walletAA 
.AA 
LastUpdatedAA "
=AA# $
DateTimeAA% -
.AA- .
UtcNowAA. 4
;AA4 5
varCC 
txCC 
=CC 
newCC 
TransactionCC (
{DD 
	AccountIdEE 
=EE 
walletEE  &
.EE& '
UserIdEE' -
,EE- .
MythrasPackageIdFF $
=FF% &
mythrasPackageFF' 5
.FF5 6
MythrasPackageIdFF6 F
,FFF G
SuscriptionPlanIdGG %
=GG& '
nullGG( ,
,GG, -
TypeHH 
=HH 
$strHH *
,HH* +
AmountRealMoneyII #
=II$ %
mythrasPackageII& 4
.II4 5
PriceII5 :
.II: ;
ToStringII; C
(IIC D
$strIID H
)IIH I
,III J
PaymentMethodJJ !
=JJ" #
dtoJJ$ '
.JJ' (
CardTypeJJ( 0
,JJ0 1
StatusKK 
=KK 
$strKK )
,KK) *
	CreatedAtLL 
=LL 
DateTimeLL  (
.LL( )
UtcNowLL) /
}MM 
;MM 
awaitOO 
_contextOO 
.OO 
TransactionsOO +
.OO+ ,
AddAsyncOO, 4
(OO4 5
txOO5 7
)OO7 8
;OO8 9
awaitPP 
_contextPP 
.PP 
SaveChangesAsyncPP /
(PP/ 0
)PP0 1
;PP1 2
awaitQQ 
transactionQQ !
.QQ! "
CommitAsyncQQ" -
(QQ- .
)QQ. /
;QQ/ 0
varSS 
responseSS 
=SS 
newSS "&
PurchaseMythrasResponseDtoSS# =
{TT 
MessageUU 
=UU 
$strUU ?
,UU? @
MythrasBalanceVV "
=VV# $
walletVV% +
.VV+ ,
MythrasBalanceVV, :
,VV: ;
WalletLastUpdatedWW %
=WW& '
walletWW( .
.WW. /
LastUpdatedWW/ :
}XX 
;XX 
returnYY 
(YY 
trueYY 
,YY 
$strYY .
,YY. /
responseYY0 8
)YY8 9
;YY9 :
}ZZ 
catch[[ 
([[ 
	Exception[[ 
ex[[ 
)[[  
{\\ 
await]] 
transaction]] !
.]]! "
RollbackAsync]]" /
(]]/ 0
)]]0 1
;]]1 2
return^^ 
(^^ 
false^^ 
,^^ 
$str^^ >
+^^? @
ex^^A C
.^^C D
Message^^D K
,^^K L
null^^M Q
)^^Q R
;^^R S
}__ 
}`` 	
privatebb 
boolbb 
ValidateCardbb !
(bb! "%
PurchaseMythrasRequestDtobb" ;
dtobb< ?
,bb? @
outbbA D
stringbbE K
errorbbL Q
)bbQ R
{cc 	
ifdd 
(dd 
!dd 
ValidateCardNumberdd #
(dd# $
dtodd$ '
.dd' (

CardNumberdd( 2
,dd2 3
outdd4 7
errordd8 =
)dd= >
)dd> ?
returnee 
falseee 
;ee 
ifgg 
(gg 
!gg 
ValidateCardHoldergg #
(gg# $
dtogg$ '
.gg' (

CardHoldergg( 2
,gg2 3
outgg4 7
errorgg8 =
)gg= >
)gg> ?
returnhh 
falsehh 
;hh 
ifjj 
(jj 
!jj 
ValidateExpiryDatejj #
(jj# $
dtojj$ '
.jj' (

ExpiryDatejj( 2
,jj2 3
outjj4 7
errorjj8 =
)jj= >
)jj> ?
returnkk 
falsekk 
;kk 
ifmm 
(mm 
!mm 
ValidateCvcmm 
(mm 
dtomm  
.mm  !
Cvcmm! $
,mm$ %
outmm& )
errormm* /
)mm/ 0
)mm0 1
returnnn 
falsenn 
;nn 
ifpp 
(pp 
!pp 
ValidateCardTypepp !
(pp! "
dtopp" %
.pp% &

CardNumberpp& 0
,pp0 1
dtopp2 5
.pp5 6
CardTypepp6 >
,pp> ?
outpp@ C
errorppD I
)ppI J
)ppJ K
returnqq 
falseqq 
;qq 
ifss 
(ss 
!ss "
ValidateBillingAddressss '
(ss' (
dtoss( +
.ss+ ,
BillingAddressss, :
,ss: ;
outss< ?
errorss@ E
)ssE F
)ssF G
returntt 
falsett 
;tt 
returnvv 
truevv 
;vv 
}ww 	
privateyy 
boolyy 
ValidateCardNumberyy '
(yy' (
stringyy( .

cardNumberyy/ 9
,yy9 :
outyy; >
stringyy? E
erroryyF K
)yyK L
{zz 	
error{{ 
={{ 
$str{{ 
;{{ 
if|| 
(|| 
string|| 
.|| 
IsNullOrWhiteSpace|| )
(||) *

cardNumber||* 4
)||4 5
||||6 8

cardNumber||9 C
.||C D
Length||D J
!=||K M
$num||N P
||||Q S
!||T U

cardNumber||U _
.||_ `
All||` c
(||c d
char||d h
.||h i
IsDigit||i p
)||p q
)||q r
{}} 
error~~ 
=~~ 
$str~~ E
;~~E F
return 
false 
; 
}
ÄÄ 
if
ÅÅ 
(
ÅÅ 
!
ÅÅ 
	LuhnCheck
ÅÅ 
(
ÅÅ 

cardNumber
ÅÅ %
)
ÅÅ% &
)
ÅÅ& '
{
ÇÇ 
error
ÉÉ 
=
ÉÉ 
$str
ÉÉ I
;
ÉÉI J
return
ÑÑ 
false
ÑÑ 
;
ÑÑ 
}
ÖÖ 
return
ÜÜ 
true
ÜÜ 
;
ÜÜ 
}
áá 	
private
ââ 
bool
ââ  
ValidateCardHolder
ââ '
(
ââ' (
string
ââ( .

cardHolder
ââ/ 9
,
ââ9 :
out
ââ; >
string
ââ? E
error
ââF K
)
ââK L
{
ää 	
error
ãã 
=
ãã 
$str
ãã 
;
ãã 
if
åå 
(
åå 
string
åå 
.
åå  
IsNullOrWhiteSpace
åå )
(
åå) *

cardHolder
åå* 4
)
åå4 5
||
åå6 8

cardHolder
åå9 C
.
ååC D
Length
ååD J
<
ååK L
$num
ååM N
||
ååO Q
!
ååR S

cardHolder
ååS ]
.
åå] ^
All
åå^ a
(
ååa b
c
ååb c
=>
ååd f
char
ååg k
.
ååk l
IsLetter
åål t
(
ååt u
c
ååu v
)
ååv w
||
ååx z
char
åå{ 
.åå Ä
IsWhiteSpaceååÄ å
(ååå ç
cååç é
)ååé è
)ååè ê
)ååê ë
{
çç 
error
éé 
=
éé 
$str
éé d
;
ééd e
return
èè 
false
èè 
;
èè 
}
êê 
return
ëë 
true
ëë 
;
ëë 
}
íí 	
private
îî 
bool
îî  
ValidateExpiryDate
îî '
(
îî' (
string
îî( .
expiry
îî/ 5
,
îî5 6
out
îî7 :
string
îî; A
error
îîB G
)
îîG H
{
ïï 	
error
ññ 
=
ññ 
$str
ññ 
;
ññ 
if
óó 
(
óó 
string
óó 
.
óó  
IsNullOrWhiteSpace
óó )
(
óó) *
expiry
óó* 0
)
óó0 1
||
óó2 4
expiry
óó5 ;
.
óó; <
Length
óó< B
!=
óóC E
$num
óóF G
||
óóH J
expiry
óóK Q
[
óóQ R
$num
óóR S
]
óóS T
!=
óóU W
$char
óóX [
)
óó[ \
{
òò 
error
ôô 
=
ôô 
$str
ôô M
;
ôôM N
return
öö 
false
öö 
;
öö 
}
õõ 
var
úú 
parts
úú 
=
úú 
expiry
úú 
.
úú 
Split
úú $
(
úú$ %
$char
úú% (
)
úú( )
;
úú) *
if
ùù 
(
ùù 
!
ùù 
int
ùù 
.
ùù 
TryParse
ùù 
(
ùù 
parts
ùù #
[
ùù# $
$num
ùù$ %
]
ùù% &
,
ùù& '
out
ùù( +
int
ùù, /
month
ùù0 5
)
ùù5 6
||
ùù7 9
month
ùù: ?
<
ùù@ A
$num
ùùB C
||
ùùD F
month
ùùG L
>
ùùM N
$num
ùùO Q
)
ùùQ R
{
ûû 
error
üü 
=
üü 
$str
üü ;
;
üü; <
return
†† 
false
†† 
;
†† 
}
°° 
if
¢¢ 
(
¢¢ 
!
¢¢ 
int
¢¢ 
.
¢¢ 
TryParse
¢¢ 
(
¢¢ 
parts
¢¢ #
[
¢¢# $
$num
¢¢$ %
]
¢¢% &
,
¢¢& '
out
¢¢( +
int
¢¢, /
year
¢¢0 4
)
¢¢4 5
)
¢¢5 6
{
££ 
error
§§ 
=
§§ 
$str
§§ ;
;
§§; <
return
•• 
false
•• 
;
•• 
}
¶¶ 
year
ßß 
+=
ßß 
$num
ßß 
;
ßß 
var
®® 

expiryDate
®® 
=
®® 
new
®®  
DateTime
®®! )
(
®®) *
year
®®* .
,
®®. /
month
®®0 5
,
®®5 6
DateTime
®®7 ?
.
®®? @
DaysInMonth
®®@ K
(
®®K L
year
®®L P
,
®®P Q
month
®®R W
)
®®W X
)
®®X Y
;
®®Y Z
if
©© 
(
©© 

expiryDate
©© 
<
©© 
DateTime
©© %
.
©©% &
UtcNow
©©& ,
.
©©, -
Date
©©- 1
)
©©1 2
{
™™ 
error
´´ 
=
´´ 
$str
´´ 2
;
´´2 3
return
¨¨ 
false
¨¨ 
;
¨¨ 
}
≠≠ 
return
ÆÆ 
true
ÆÆ 
;
ÆÆ 
}
ØØ 	
private
±± 
bool
±± 
ValidateCvc
±±  
(
±±  !
string
±±! '
cvc
±±( +
,
±±+ ,
out
±±- 0
string
±±1 7
error
±±8 =
)
±±= >
{
≤≤ 	
error
≥≥ 
=
≥≥ 
$str
≥≥ 
;
≥≥ 
if
¥¥ 
(
¥¥ 
string
¥¥ 
.
¥¥  
IsNullOrWhiteSpace
¥¥ )
(
¥¥) *
cvc
¥¥* -
)
¥¥- .
||
¥¥/ 1
cvc
¥¥2 5
.
¥¥5 6
Length
¥¥6 <
!=
¥¥= ?
$num
¥¥@ A
||
¥¥B D
!
¥¥E F
cvc
¥¥F I
.
¥¥I J
All
¥¥J M
(
¥¥M N
char
¥¥N R
.
¥¥R S
IsDigit
¥¥S Z
)
¥¥Z [
)
¥¥[ \
{
µµ 
error
∂∂ 
=
∂∂ 
$str
∂∂ V
;
∂∂V W
return
∑∑ 
false
∑∑ 
;
∑∑ 
}
∏∏ 
return
ππ 
true
ππ 
;
ππ 
}
∫∫ 	
private
ºº 
bool
ºº 
ValidateCardType
ºº %
(
ºº% &
string
ºº& ,

cardNumber
ºº- 7
,
ºº7 8
string
ºº9 ?
type
ºº@ D
,
ººD E
out
ººF I
string
ººJ P
error
ººQ V
)
ººV W
{
ΩΩ 	
error
ææ 
=
ææ 
$str
ææ 
;
ææ 
if
øø 
(
øø 
type
øø 
==
øø 
$str
øø 
&&
øø !

cardNumber
øø" ,
.
øø, -

StartsWith
øø- 7
(
øø7 8
$str
øø8 ;
)
øø; <
)
øø< =
return
øø> D
true
øøE I
;
øøI J
if
¿¿ 
(
¿¿ 
type
¿¿ 
==
¿¿ 
$str
¿¿ $
&&
¿¿% '

cardNumber
¿¿( 2
.
¿¿2 3

StartsWith
¿¿3 =
(
¿¿= >
$str
¿¿> A
)
¿¿A B
)
¿¿B C
return
¿¿D J
true
¿¿K O
;
¿¿O P
error
¡¡ 
=
¡¡ 
$str
¡¡ w
;
¡¡w x
return
¬¬ 
false
¬¬ 
;
¬¬ 
}
√√ 	
private
≈≈ 
bool
≈≈ $
ValidateBillingAddress
≈≈ +
(
≈≈+ ,
BillingAddressDto
≈≈, =
?
≈≈= >
address
≈≈? F
,
≈≈F G
out
≈≈H K
string
≈≈L R
error
≈≈S X
)
≈≈X Y
{
∆∆ 	
error
«« 
=
«« 
$str
«« 
;
«« 
if
»» 
(
»» 
address
»» 
==
»» 
null
»» 
||
»»  "
string
»»# )
.
»») * 
IsNullOrWhiteSpace
»»* <
(
»»< =
address
»»= D
.
»»D E
Street
»»E K
)
»»K L
||
»»M O
string
»»P V
.
»»V W 
IsNullOrWhiteSpace
»»W i
(
»»i j
address
»»j q
.
»»q r

PostalCode
»»r |
)
»»| }
||»»~ Ä
string»»Å á
.»»á à"
IsNullOrWhiteSpace»»à ö
(»»ö õ
address»»õ ¢
.»»¢ £
City»»£ ß
)»»ß ®
||»»© ´
string»»¨ ≤
.»»≤ ≥"
IsNullOrWhiteSpace»»≥ ≈
(»»≈ ∆
address»»∆ Õ
.»»Õ Œ
Country»»Œ ’
)»»’ ÷
)»»÷ ◊
{
…… 
error
   
=
   
$str
   X
;
  X Y
return
ÀÀ 
false
ÀÀ 
;
ÀÀ 
}
ÃÃ 
if
ÕÕ 
(
ÕÕ 
address
ÕÕ 
.
ÕÕ 

PostalCode
ÕÕ "
.
ÕÕ" #
Length
ÕÕ# )
<
ÕÕ* +
$num
ÕÕ, -
)
ÕÕ- .
{
ŒŒ 
error
œœ 
=
œœ 
$str
œœ L
;
œœL M
return
–– 
false
–– 
;
–– 
}
—— 
return
““ 
true
““ 
;
““ 
}
”” 	
private
’’ 
bool
’’ 
	LuhnCheck
’’ 
(
’’ 
string
’’ %
number
’’& ,
)
’’, -
{
÷÷ 	
int
◊◊ 
sum
◊◊ 
=
◊◊ 
$num
◊◊ 
;
◊◊ 
bool
ÿÿ 
	alternate
ÿÿ 
=
ÿÿ 
false
ÿÿ "
;
ÿÿ" #
for
ŸŸ 
(
ŸŸ 
int
ŸŸ 
i
ŸŸ 
=
ŸŸ 
number
ŸŸ 
.
ŸŸ  
Length
ŸŸ  &
-
ŸŸ' (
$num
ŸŸ) *
;
ŸŸ* +
i
ŸŸ, -
>=
ŸŸ. 0
$num
ŸŸ1 2
;
ŸŸ2 3
i
ŸŸ4 5
--
ŸŸ5 7
)
ŸŸ7 8
{
⁄⁄ 
int
€€ 
n
€€ 
=
€€ 
int
€€ 
.
€€ 
Parse
€€ !
(
€€! "
number
€€" (
[
€€( )
i
€€) *
]
€€* +
.
€€+ ,
ToString
€€, 4
(
€€4 5
)
€€5 6
)
€€6 7
;
€€7 8
if
‹‹ 
(
‹‹ 
	alternate
‹‹ 
)
‹‹ 
{
›› 
n
ﬁﬁ 
*=
ﬁﬁ 
$num
ﬁﬁ 
;
ﬁﬁ 
if
ﬂﬂ 
(
ﬂﬂ 
n
ﬂﬂ 
>
ﬂﬂ 
$num
ﬂﬂ 
)
ﬂﬂ 
n
‡‡ 
-=
‡‡ 
$num
‡‡ 
;
‡‡ 
}
·· 
sum
‚‚ 
+=
‚‚ 
n
‚‚ 
;
‚‚ 
	alternate
„„ 
=
„„ 
!
„„ 
	alternate
„„ &
;
„„& '
}
‰‰ 
return
ÂÂ 
sum
ÂÂ 
%
ÂÂ 
$num
ÂÂ 
==
ÂÂ 
$num
ÂÂ  
;
ÂÂ  !
}
ÊÊ 	
}
ÁÁ 
}ËË Ÿ
äC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\MythrasPackageService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

class !
MythrasPackageService &
:' ("
IMythrasPackageService) ?
{ 
private		 
readonly		 
MythosDbContext		 (
_context		) 1
;		1 2
public !
MythrasPackageService $
($ %
MythosDbContext% 4
context5 <
)< =
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
List 
< 
MythrasPackage -
>- .
>. /"
GetActivePackagesAsync0 F
(F G
)G H
{ 	
return 
await 
_context !
.! "
MythrasPackages" 1
.1 2
Where2 7
(7 8
p8 9
=>: <
p= >
.> ?
IsActive? G
)G H
.H I
ToListAsyncI T
(T U
)U V
;V W
} 	
public 
async 
Task 
< 
MythrasPackage (
?( )
>) *%
GetActivePackageByIdAsync+ D
(D E
intE H
idI K
)K L
{ 	
return 
await 
_context !
.! "
MythrasPackages" 1
.1 2
FirstOrDefaultAsync2 E
(E F
pF G
=>H J
pK L
.L M
MythrasPackageIdM ]
==^ `
ida c
&&d f
pg h
.h i
IsActivei q
)q r
;r s
} 	
} 
} ±!
àC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\MythosWalletService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

class 
MythosWalletService $
:% & 
IMythosWalletService' ;
{		 
private

 
readonly

 
MythosDbContext

 (
_context

) 1
;

1 2
public 
MythosWalletService "
(" #
MythosDbContext# 2
context3 :
): ;
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
WalletResponseDto +
?+ ,
>, -"
GetWalletByUserIdAsync. D
(D E
GuidE I
userIdJ P
)P Q
{ 	
var 
wallet 
= 
await 
_context '
.' (
MythosWallets( 5
.5 6
FirstOrDefaultAsync6 I
(I J
wJ K
=>L N
wO P
.P Q
UserIdQ W
==X Z
userId[ a
)a b
;b c
if 
( 
wallet 
== 
null 
) 
return 
null 
; 
return 
new 
WalletResponseDto (
{ 
UserId 
= 
wallet 
.  
UserId  &
,& '
MythrasBalance 
=  
wallet! '
.' (
MythrasBalance( 6
,6 7
IsLocked 
= 
wallet !
.! "
IsLocked" *
,* +
LastUpdated 
= 
wallet $
.$ %
LastUpdated% 0
} 
; 
} 	
public 
async 
Task 
< 
bool 
> 
BlockWalletAsync  0
(0 1
Guid1 5
userId6 <
)< =
{   	
var!! 
wallet!! 
=!! 
await!! 
_context!! '
.!!' (
MythosWallets!!( 5
.!!5 6
FirstOrDefaultAsync!!6 I
(!!I J
w!!J K
=>!!L N
w!!O P
.!!P Q
UserId!!Q W
==!!X Z
userId!![ a
)!!a b
;!!b c
if"" 
("" 
wallet"" 
=="" 
null"" 
||"" !
wallet""" (
.""( )
IsLocked"") 1
)""1 2
return## 
false## 
;## 
wallet$$ 
.$$ 
IsLocked$$ 
=$$ 
true$$ "
;$$" #
await%% 
_context%% 
.%% 
SaveChangesAsync%% +
(%%+ ,
)%%, -
;%%- .
return&& 
true&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) 
UnblockWalletAsync))  2
())2 3
Guid))3 7
userId))8 >
)))> ?
{** 	
var++ 
wallet++ 
=++ 
await++ 
_context++ '
.++' (
MythosWallets++( 5
.++5 6
FirstOrDefaultAsync++6 I
(++I J
w++J K
=>++L N
w++O P
.++P Q
UserId++Q W
==++X Z
userId++[ a
)++a b
;++b c
if,, 
(,, 
wallet,, 
==,, 
null,, 
||,, !
!,," #
wallet,,# )
.,,) *
IsLocked,,* 2
),,2 3
return-- 
false-- 
;-- 
wallet.. 
... 
IsLocked.. 
=.. 
false.. #
;..# $
await// 
_context// 
.// 
SaveChangesAsync// +
(//+ ,
)//, -
;//- .
return00 
true00 
;00 
}11 	
}22 
}33 ‹@
çC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\MythosTransactionService.cs
public 
class $
MythosTransactionService %
:& '%
IMythosTransactionService( A
{ 
private		 
readonly		 
MythosDbContext		 $
_context		% -
;		- .
public 
$
MythosTransactionService #
(# $
MythosDbContext$ 3
context4 ;
); <
{ 
_context 
= 
context 
; 
} 
public 

async 
Task 
< 
( 
bool 
, 
string #
,# $
DonationResponseDto% 8
?8 9
)9 :
>: ;
DonateAsync< G
(G H
GuidH L
senderAccountIdM \
,\ ]
CreateDonationDto^ o
dtop s
)s t
{ 
if 

( 
dto 
. 
Amount 
<= 
$num 
) 
return 
( 
false 
, 
$str G
,G H
nullI M
)M N
;N O
if 

( 
senderAccountId 
== 
dto "
." #
ReceiverAccountId# 4
)4 5
return 
( 
false 
, 
$str 8
,8 9
null: >
)> ?
;? @
var 
senderWallet 
= 
await  
GetWalletAsync! /
(/ 0
senderAccountId0 ?
)? @
;@ A
if 

( 
senderWallet 
== 
null  
)  !
return 
( 
false 
, 
$str k
,k l
nullm q
)q r
;r s
var 
receiverWallet 
= 
await "
GetWalletAsync# 1
(1 2
dto2 5
.5 6
ReceiverAccountId6 G
)G H
;H I
if 

( 
receiverWallet 
== 
null "
)" #
return 
( 
false 
, 
$str B
,B C
nullD H
)H I
;I J
if   

(   
senderWallet   
.   
IsLocked   !
)  ! "
return!! 
(!! 
false!! 
,!! 
$str!! G
,!!G H
null!!I M
)!!M N
;!!N O
if"" 

("" 
receiverWallet"" 
."" 
IsLocked"" #
)""# $
return## 
(## 
false## 
,## 
$str## `
,##` a
null##b f
)##f g
;##g h
if%% 

(%% 
senderWallet%% 
.%% 
MythrasBalance%% '
<%%( )
dto%%* -
.%%- .
Amount%%. 4
)%%4 5
return&& 
(&& 
false&& 
,&& 
$str&& ;
,&&; <
null&&= A
)&&A B
;&&B C
using(( 
var(( 
transaction(( 
=(( 
await((  %
_context((& .
.((. /
Database((/ 7
.((7 8!
BeginTransactionAsync((8 M
(((M N
)((N O
;((O P
try)) 
{** 	
senderWallet++ 
.++ 
MythrasBalance++ '
-=++( *
dto+++ .
.++. /
Amount++/ 5
;++5 6
receiverWallet,, 
.,, 
MythrasBalance,, )
+=,,* ,
dto,,- 0
.,,0 1
Amount,,1 7
;,,7 8
senderWallet-- 
.-- 
LastUpdated-- $
=--% &
DateTime--' /
.--/ 0
UtcNow--0 6
;--6 7
receiverWallet.. 
... 
LastUpdated.. &
=..' (
DateTime..) 1
...1 2
UtcNow..2 8
;..8 9
await00 
_context00 
.00 
MythosTransactions00 -
.00- .
AddRangeAsync00. ;
(00; <
BuildTransaction11  
(11  !
senderAccountId11! 0
,110 1
dto112 5
.115 6
ReceiverAccountId116 G
,11G H
-11I J
dto11J M
.11M N
Amount11N T
,11T U
senderWallet11V b
.11b c
MythrasBalance11c q
,11q r"
MythosTransactionType	11s à
.
11à â
DonationSent
11â ï
)
11ï ñ
,
11ñ ó
BuildTransaction22  
(22  !
dto22! $
.22$ %
ReceiverAccountId22% 6
,226 7
senderAccountId228 G
,22G H
dto22I L
.22L M
Amount22M S
,22S T
receiverWallet22U c
.22c d
MythrasBalance22d r
,22r s"
MythosTransactionType	22t â
.
22â ä
DonationReceived
22ä ö
)
22ö õ
)33 
;33 
await55 
_context55 
.55 
SaveChangesAsync55 +
(55+ ,
)55, -
;55- .
await66 
transaction66 
.66 
CommitAsync66 )
(66) *
)66* +
;66+ ,
var88 
response88 
=88 
new88 
DonationResponseDto88 2
{99 
Message:: 
=:: 
$str:: 9
,::9 :
SenderBalance;; 
=;; 
senderWallet;;  ,
.;;, -
MythrasBalance;;- ;
,;;; <
ReceiverBalance<< 
=<<  !
receiverWallet<<" 0
.<<0 1
MythrasBalance<<1 ?
}== 
;== 
return?? 
(?? 
true?? 
,?? 
$str?? ,
,??, -
response??. 6
)??6 7
;??7 8
}@@ 	
catchAA 
(AA 
	ExceptionAA 
exAA 
)AA 
{BB 	
awaitCC 
transactionCC 
.CC 
RollbackAsyncCC +
(CC+ ,
)CC, -
;CC- .
returnDD 
(DD 
falseDD 
,DD 
$"DD 
$strDD <
{DD< =
exDD= ?
.DD? @
MessageDD@ G
}DDG H
"DDH I
,DDI J
nullDDK O
)DDO P
;DDP Q
}EE 	
}FF 
privateHH 
asyncHH 
TaskHH 
<HH 
MythosWalletHH #
?HH# $
>HH$ %
GetWalletAsyncHH& 4
(HH4 5
GuidHH5 9
userIdHH: @
)HH@ A
=>II 

awaitII 
_contextII 
.II 
MythosWalletsII '
.II' (
FirstOrDefaultAsyncII( ;
(II; <
wII< =
=>II> @
wIIA B
.IIB C
UserIdIIC I
==IIJ L
userIdIIM S
)IIS T
;IIT U
privateKK 
MythosTransactionKK 
BuildTransactionKK .
(KK. /
GuidKK/ 3
	accountIdKK4 =
,KK= >
GuidKK? C
counterpartyIdKKD R
,KKR S
intKKT W
amountKKX ^
,KK^ _
intKK` c
balanceAfterKKd p
,KKp q"
MythosTransactionType	KKr á
type
KKà å
)
KKå ç
=>LL 

newLL 
MythosTransactionLL  
{MM 	
TypeNN 
=NN 
typeNN 
,NN 
AmountOO 
=OO 
amountOO 
,OO 
BalanceAfterPP 
=PP 
balanceAfterPP '
,PP' (
	CreatedAtQQ 
=QQ 
DateTimeQQ  
.QQ  !
UtcNowQQ! '
,QQ' (
	AccountIdRR 
=RR 
	accountIdRR !
,RR! "!
CounterpartyAccountIdSS !
=SS" #
counterpartyIdSS$ 2
}TT 	
;TT	 

}UU ¸
áC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\IWithdrawalService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

	interface 
IWithdrawalService '
{ 
Task 
< !
WithdrawalResponseDto "
>" #"
RequestWithdrawalAsync$ :
(: ;
Guid; ?
userId@ F
,F G&
CreateWithdrawalRequestDtoH b
dtoc f
)f g
;g h
} 
} ã
îC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\Interfaces\ISubscriptionService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
.( )

Interfaces) 3
{ 
public 

	interface  
ISubscriptionService )
{ 
Task 
< 
bool 
>  
SubscribeToPlanAsync '
(' (
Guid( ,
userId- 3
,3 4
int5 8
planId9 ?
)? @
;@ A
} 
} –
êC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\Interfaces\IPurchaseService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
.( )

Interfaces) 3
;3 4
public 
	interface 
IPurchaseService !
{ 
Task 
< 	
List	 
< 
string 
> 
> '
GetPurchasedContentIdsAsync 2
(2 3
Guid3 7
	accountId8 A
)A B
;B C
Task 
< 	
(	 

bool
 
Success 
, 
string 
Message &
,& '
int( +
?+ ,

NewBalance- 7
)7 8
>8 9 
PurchaseContentAsync: N
(N O
GuidO S
userIdT Z
,Z [
string\ b
	contentIdc l
,l m
intn q
pricer w
)w x
;x y
}		 ¿
åC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\IMythrasPurchaseService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

	interface #
IMythrasPurchaseService ,
{ 
Task 
< 
( 
bool 
Success 
, 
string "
Message# *
,* +&
PurchaseMythrasResponseDto, F
?F G
ResponseH P
)P Q
>Q R 
PurchaseMythrasAsyncS g
(g h
Guidh l
userIdm s
,s t&
PurchaseMythrasRequestDto	u é
dto
è í
)
í ì
;
ì î
} 
}		 è
ãC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\IMythrasPackageService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

	interface "
IMythrasPackageService +
{ 
Task 
< 
List 
< 
MythrasPackage  
>  !
>! ""
GetActivePackagesAsync# 9
(9 :
): ;
;; <
Task 
< 
MythrasPackage 
? 
> %
GetActivePackageByIdAsync 7
(7 8
int8 ;
id< >
)> ?
;? @
}		 
}

 ´
âC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\IMythosWalletService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

	interface  
IMythosWalletService )
{ 
Task 
< 
WalletResponseDto 
? 
>  "
GetWalletByUserIdAsync! 7
(7 8
Guid8 <
userId= C
)C D
;D E
Task 
< 
bool 
> 
BlockWalletAsync #
(# $
Guid$ (
userId) /
)/ 0
;0 1
Task		 
<		 
bool		 
>		 
UnblockWalletAsync		 %
(		% &
Guid		& *
userId		+ 1
)		1 2
;		2 3
}

 
} ¥
éC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\IMythosTransactionService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

	interface %
IMythosTransactionService .
{ 
Task 
< 
( 
bool 
Success 
, 
string "
Message# *
,* +
DonationResponseDto, ?
?? @
ResponseA I
)I J
>J K
DonateAsyncL W
(W X
GuidX \
senderAccountId] l
,l m
CreateDonationDton 
dto
Ä É
)
É Ñ
;
Ñ Ö
} 
} à"
òC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\Implementations\SubscriptionService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
.( )
Implementations) 8
{ 
public 

class 
SubscriptionService $
($ %
IUnitOfWork% 0
_unitOfWork1 <
)< =
:> ? 
ISubscriptionService@ T
{ 
public		 
async		 
Task		 
<		 
bool		 
>		  
SubscribeToPlanAsync		  4
(		4 5
Guid		5 9
userId		: @
,		@ A
int		B E
planId		F L
)		L M
{

 	
var 
plan 
= 
await 
_unitOfWork (
.( )
Subscriptions) 6
.6 7"
GetActivePlanByIdAsync7 M
(M N
planIdN T
)T U
;U V
if 
( 
plan 
== 
null 
) 
throw 
new %
InvalidOperationException 3
(3 4
$str4 X
)X Y
;Y Z
if 
( 
await 
_unitOfWork !
.! " 
AccountSubscriptions" 6
.6 7!
HasActiveSubscription7 L
(L M
userIdM S
)S T
)T U
throw 
new %
InvalidOperationException 3
(3 4
$str4 W
)W X
;X Y
await 
_unitOfWork 
. !
BeginTransactionAsync 3
(3 4
)4 5
;5 6
try 
{ 
_unitOfWork 
. 
Transactions (
.( )
Add) ,
(, -
new- 0
Transaction1 <
{ 
	AccountId 
= 
userId  &
,& '
SuscriptionPlanId %
=& '
planId( .
,. /
Type 
= 
$str )
,) *
AmountRealMoney #
=$ %
plan& *
.* +
Price+ 0
.0 1
ToString1 9
(9 :
$str: >
)> ?
,? @
PaymentMethod !
=" #
$str$ /
,/ 0
Status 
= 
$str (
,( )
	CreatedAt 
= 
DateTime  (
.( )
UtcNow) /
} 
) 
; 
_unitOfWork!! 
.!!  
AccountSubscriptions!! 0
.!!0 1
Add!!1 4
(!!4 5
new!!5 8"
AccountSuscriptionPlan!!9 O
{"" 
	AccountId## 
=## 
userId##  &
,##& '
SuscriptionPlanId$$ %
=$$& '
planId$$( .
,$$. /
	StartDate%% 
=%% 
DateTime%%  (
.%%( )
UtcNow%%) /
,%%/ 0
EndDate&& 
=&& 
DateTime&& &
.&&& '
UtcNow&&' -
.&&- .
AddDays&&. 5
(&&5 6
plan&&6 :
.&&: ;
DurationDays&&; G
)&&G H
,&&H I
Status'' 
='' 
$str'' %
}(( 
)(( 
;(( 
await** 
_unitOfWork** !
.**! "
MythosWallet**" .
.**. /
AddBonusAsync**/ <
(**< =
userId**= C
,**C D
plan**E I
.**I J
MythrasMonthlyBonus**J ]
)**] ^
;**^ _
await++ 
_unitOfWork++ !
.++! "
	SaveAsync++" +
(+++ ,
)++, -
;++- .
await-- 
_unitOfWork-- !
.--! ""
CommitTransactionAsync--" 8
(--8 9
)--9 :
;--: ;
}.. 
catch// 
{00 
await11 
_unitOfWork11 !
.11! "$
RollbackTransactionAsync11" :
(11: ;
)11; <
;11< =
throw22 
;22 
}33 
return55 
true55 
;55 
}66 	
}77 
}88 Œ.
îC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\Implementations\PurchaseService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
.( )
Implementations) 8
;8 9
public 
class 
PurchaseService 
( 
IUnitOfWork (
_unitOfWork) 4
)4 5
:6 7
IPurchaseService8 H
{		 
public

 

async

 
Task

 
<

 
List

 
<

 
string

 !
>

! "
>

" #'
GetPurchasedContentIdsAsync

$ ?
(

? @
Guid

@ D
	accountId

E N
)

N O
{ 
return 
await 
_unitOfWork  
.  !
	Purchases! *
.* +2
&GetPurchasedContentIdsByAccountIdAsync+ Q
(Q R
	accountIdR [
)[ \
;\ ]
} 
public 

async 
Task 
< 
( 
bool 
Success #
,# $
string% +
Message, 3
,3 4
int5 8
?8 9

NewBalance: D
)D E
>E F 
PurchaseContentAsyncG [
([ \
Guid\ `
userIda g
,g h
stringi o
	contentIdp y
,y z
int{ ~
price	 Ñ
)
Ñ Ö
{ 
var 
wallet 
= 
await 
_unitOfWork &
.& '
MythosWallet' 3
.3 4
GetByUserIdAsync4 D
(D E
userIdE K
)K L
;L M
if 

( 
wallet 
== 
null 
) 
return 
( 
false 
, 
$str 1
,1 2
null3 7
)7 8
;8 9
if 

( 
wallet 
. 
IsLocked 
) 
return 
( 
false 
, 
$str 5
,5 6
null7 ;
); <
;< =
if 

( 
wallet 
. 
MythrasBalance !
<" #
price$ )
)) *
return 
( 
false 
, 
$str 1
,1 2
wallet3 9
.9 :
MythrasBalance: H
)H I
;I J
var 
alreadyPurchased 
= 
await $
_unitOfWork% 0
.0 1
	Purchases1 :
.: ;
ExistsAsync; F
(F G
pG H
=>I K
pL M
.M N
	AccountIdN W
==X Z
userId[ a
&&b d
pe f
.f g
	ContentIdg p
==q s
	contentIdt }
)} ~
;~ 
if 

( 
alreadyPurchased 
) 
return   
(   
true   
,   
$str   1
,  1 2
wallet  3 9
.  9 :
MythrasBalance  : H
)  H I
;  I J
var## 
transaction## 
=## 
new## 
MythosTransaction## /
{$$ 	
	AccountId%% 
=%% 
userId%% 
,%% !
CounterpartyAccountId&& !
=&&" #
userId&&$ *
,&&* +
Amount'' 
='' 
price'' 
,'' 
	CreatedAt(( 
=(( 
DateTime((  
.((  !
UtcNow((! '
,((' (
Type)) 
=)) 
Enums)) 
.)) !
MythosTransactionType)) .
.)). /
PurchaseMade))/ ;
}** 	
;**	 

await++ 
_unitOfWork++ 
.++ 
MythosTransactions++ ,
.++, -
AddAsync++- 5
(++5 6
transaction++6 A
)++A B
;++B C
await,, 
_unitOfWork,, 
.,, 
	SaveAsync,, #
(,,# $
),,$ %
;,,% &
var// 
purchase// 
=// 
new// 
Purchase// #
{00 	
	AccountId11 
=11 
userId11 
,11 
	ContentId22 
=22 
	contentId22 !
,22! "
MythrasPrice33 
=33 
price33  
,33  !
PurchaseDate44 
=44 
DateTime44 #
.44# $
UtcNow44$ *
,44* +
MythosTransactionId55 
=55  !
transaction55" -
.55- .
MythosTransactionId55. A
,55A B
MythosTransaction66 
=66 
transaction66  +
}77 	
;77	 

await88 
_unitOfWork88 
.88 
	Purchases88 #
.88# $
AddAsync88$ ,
(88, -
purchase88- 5
)885 6
;886 7
wallet;; 
.;; 
MythrasBalance;; 
-=;;  
price;;! &
;;;& '
wallet<< 
.<< 
LastUpdated<< 
=<< 
DateTime<< %
.<<% &
UtcNow<<& ,
;<<, -
_unitOfWork== 
.== 
MythosWallet==  
.==  !
Update==! '
(==' (
wallet==( .
)==. /
;==/ 0
await?? 
_unitOfWork?? 
.?? 
	SaveAsync?? #
(??# $
)??$ %
;??% &
returnAA 
(AA 
trueAA 
,AA 
$strAA &
,AA& '
walletAA( .
.AA. /
MythrasBalanceAA/ =
)AA= >
;AA> ?
}BB 
}CC ê
ÅC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\IAuthService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

	interface 
IAuthService !
{ 
Task 
< 
Account 
? 
> 
RegisterAsync $
($ %#
CreateAccountRequestDto% <
request= D
)D E
;E F
Task		 
<		 
TokenResponseDto		 
?		 
>		 

LoginAsync		  *
(		* +

AccountDto		+ 5
request		6 =
)		= >
;		> ?
Task

 
<

 
TokenResponseDto

 
?

 
>

 
RefreshTokensAsync

  2
(

2 3
Guid

3 7
userId

8 >
,

> ?
string

@ F
refreshToken

G S
)

S T
;

T U
} 
} ñ
ÑC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\IAccountService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

	interface 
IAccountService $
{ 
Task 
< 

AccountDto 
? 
> 
GetAccountByIdAsync -
(- .
Guid. 2
id3 5
)5 6
;6 7
Task 
< 
AccountResponseDto 
?  
>  !.
"GetAccountByAccessTokenCookieAsync" D
(D E
GuidE I
idJ L
)L M
;M N
Task		 
<		 !
EditProfileRequestDto		 "
?		" #
>		# $
UpdateAccountAsync		% 7
(		7 8
Guid		8 <
id		= ?
,		? @!
EditProfileRequestDto		A V
model		W \
)		\ ]
;		] ^
Task

 
<

 
bool

 
>

 
ChangePasswordAsync

 &
(

& '
Guid

' +
id

, .
,

. /!
ChangePasswordRequest

0 E
request

F M
)

M N
;

N O
Task 
<  
BecomeWriterResponse !
>! "
BecomeWriterAsync# 4
(4 5
Guid5 9
	accountId: C
,C D
	PersonDtoE N
dtoO R
)R S
;S T
} 
} ê]
ÄC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\AuthService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{ 
public 

class 
AuthService 
( 
MythosDbContext ,
context- 4
,4 5
IConfiguration6 D
configurationE R
)R S
:T U
IAuthServiceV b
{ 
public 
async 
Task 
< 
TokenResponseDto *
?* +
>+ ,

LoginAsync- 7
(7 8

AccountDto8 B
requestC J
)J K
{ 	
var 
user 
= 
await 
context $
.$ %
Accounts% -
.- .
FirstOrDefaultAsync. A
(A B
uB C
=>D F
uG H
.H I
UsernameI Q
==R T
requestU \
.\ ]
Username] e
)e f
;f g
if 
( 
user 
is 
null 
) 
{ 
return 
null 
; 
} 
if 
( 
new 
PasswordHasher "
<" #
Account# *
>* +
(+ ,
), -
.- . 
VerifyHashedPassword. B
(B C
userC G
,G H
userI M
.M N
PasswordHashN Z
,Z [
request\ c
.c d
Passwordd l
)l m
==n p'
PasswordVerificationResult	q ã
.
ã å
Failed
å í
)
í ì
{ 
return 
null 
; 
} 
return 
await 
CreateTokenResponse ,
(, -
user- 1
)1 2
;2 3
} 	
public   
async   
Task   
<   
Account   !
?  ! "
>  " #
RegisterAsync  $ 1
(  1 2#
CreateAccountRequestDto  2 I
request  J Q
)  Q R
{!! 	
if## 
(## 
await## 
context## 
.## 
Accounts## &
.##& '
AnyAsync##' /
(##/ 0
a##0 1
=>##2 4
a##5 6
.##6 7
Username##7 ?
==##@ B
request##C J
.##J K
Username##K S
)##S T
)##T U
{$$ 
return%% 
null%% 
;%% 
}&& 
var(( 
account(( 
=(( 
new(( 
Account(( %
(((% &
)((& '
;((' (
var** 
hashedPassword** 
=**  
new**! $
PasswordHasher**% 3
<**3 4
Account**4 ;
>**; <
(**< =
)**= >
.++ 
HashPassword++ 
(++ 
account++ %
,++% &
request++' .
.++. /
Password++/ 7
)++7 8
;++8 9
account-- 
.-- 
Username-- 
=-- 
request-- &
.--& '
Username--' /
;--/ 0
account.. 
... 
Email.. 
=.. 
request.. #
...# $
Email..$ )
;..) *
account// 
.// 
Role// 
=// 
$str// #
;//# $
account00 
.00 
PasswordHash00  
=00! "
hashedPassword00# 1
;001 2
context22 
.22 
Accounts22 
.22 
Add22  
(22  !
account22! (
)22( )
;22) *
await33 
context33 
.33 
SaveChangesAsync33 *
(33* +
)33+ ,
;33, -
var66 
wallet66 
=66 
new66 
MythosWallet66 )
{77 
UserId88 
=88 
account88  
.88  !
Id88! #
,88# $
MythrasBalance99 
=99  
$num99! $
,99$ %
IsLocked:: 
=:: 
false::  
,::  !
LastUpdated;; 
=;; 
DateTime;; &
.;;& '
UtcNow;;' -
}<< 
;<< 
context>> 
.>> 
MythosWallets>> !
.>>! "
Add>>" %
(>>% &
wallet>>& ,
)>>, -
;>>- .
await?? 
context?? 
.?? 
SaveChangesAsync?? *
(??* +
)??+ ,
;??, -
returnAA 
accountAA 
;AA 
}BB 	
publicCC 
asyncCC 
TaskCC 
<CC 
TokenResponseDtoCC *
?CC* +
>CC+ ,
RefreshTokensAsyncCC- ?
(CC? @
GuidCC@ D
userIdCCE K
,CCK L
stringCCM S
refreshTokenCCT `
)CC` a
{DD 	
varEE 
userEE 
=EE 
awaitEE %
ValidateRefreshTokenAsyncEE 6
(EE6 7
userIdEE7 =
,EE= >
refreshTokenEE? K
)EEK L
;EEL M
ifGG 
(GG 
userGG 
isGG 
nullGG 
)GG 
returnHH 
nullHH 
;HH 
returnJJ 
awaitJJ 
CreateTokenResponseJJ ,
(JJ, -
userJJ- 1
)JJ1 2
;JJ2 3
}KK 	
privateLL 
asyncLL 
TaskLL 
<LL 
AccountLL "
?LL" #
>LL# $%
ValidateRefreshTokenAsyncLL% >
(LL> ?
GuidLL? C
userIdLLD J
,LLJ K
stringLLL R
refreshTokenLLS _
)LL_ `
{MM 	
varNN 
userNN 
=NN 
awaitNN 
contextNN $
.NN$ %
AccountsNN% -
.NN- .
	FindAsyncNN. 7
(NN7 8
userIdNN8 >
)NN> ?
;NN? @
ifPP 
(PP 
userPP 
isPP 
nullPP 
||PP 
userQQ 
.QQ 
RefreshTokenQQ !
!=QQ" $
refreshTokenQQ% 1
||QQ2 4
userRR 
.RR "
RefreshTokenExpiryTimeRR +
<=RR, .
DateTimeRR/ 7
.RR7 8
UtcNowRR8 >
)RR> ?
{SS 
returnTT 
nullTT 
;TT 
}UU 
returnWW 
userWW 
;WW 
}XX 	
privateYY 
staticYY 
stringYY  
GenerateRefreshTokenYY 2
(YY2 3
)YY3 4
{ZZ 	
var[[ 
randomNumber[[ 
=[[ 
new[[ "
byte[[# '
[[[' (
$num[[( *
][[* +
;[[+ ,
using\\ 
var\\ 
rng\\ 
=\\ !
RandomNumberGenerator\\ 1
.\\1 2
Create\\2 8
(\\8 9
)\\9 :
;\\: ;
rng]] 
.]] 
GetBytes]] 
(]] 
randomNumber]] %
)]]% &
;]]& '
return^^ 
Convert^^ 
.^^ 
ToBase64String^^ )
(^^) *
randomNumber^^* 6
)^^6 7
;^^7 8
}__ 	
private`` 
async`` 
Task`` 
<`` 
string`` !
>``! ",
 GenerateAndSaveRefreshTokenAsync``# C
(``C D
Account``D K
user``L P
)``P Q
{aa 	
varbb 
refreshTokenbb 
=bb  
GenerateRefreshTokenbb 3
(bb3 4
)bb4 5
;bb5 6
usercc 
.cc 
RefreshTokencc 
=cc 
refreshTokencc  ,
;cc, -
userdd 
.dd "
RefreshTokenExpiryTimedd '
=dd( )
DateTimedd* 2
.dd2 3
UtcNowdd3 9
.dd9 :
AddDaysdd: A
(ddA B
$numddB C
)ddC D
;ddD E
awaitff 
contextff 
.ff 
SaveChangesAsyncff *
(ff* +
)ff+ ,
;ff, -
returngg 
refreshTokengg 
;gg  
}hh 	
privateii 
asyncii 
Taskii 
<ii 
TokenResponseDtoii +
>ii+ ,
CreateTokenResponseii- @
(ii@ A
AccountiiA H
useriiI M
)iiM N
{jj 	
returnkk 
newkk 
TokenResponseDtokk '
{ll 
AccessTokenmm 
=mm 
CreateTokenmm )
(mm) *
usermm* .
)mm. /
,mm/ 0
RefreshTokennn 
=nn 
awaitnn $,
 GenerateAndSaveRefreshTokenAsyncnn% E
(nnE F
usernnF J
)nnJ K
}oo 
;oo 
}pp 	
privateqq 
stringqq 
CreateTokenqq "
(qq" #
Accountqq# *
userqq+ /
)qq/ 0
{rr 	
varss 
claimsss 
=ss 
newss 
Listss !
<ss! "
Claimss" '
>ss' (
{tt 
newuu 
(uu 
$struu 
,uu 
useruu  $
.uu$ %
Usernameuu% -
)uu- .
,uu. /
newvv 
(vv 
$strvv 
,vv  
uservv! %
.vv% &
Idvv& (
.vv( )
ToStringvv) 1
(vv1 2
)vv2 3
)vv3 4
,vv4 5
newww 
(ww 
$strww 
,ww 
userww  
.ww  !
Roleww! %
)ww% &
}xx 
;xx 
varzz 
keyzz 
=zz 
newzz  
SymmetricSecurityKeyzz .
(zz. /
Encoding{{ 
.{{ 
UTF8{{ 
.{{ 
GetBytes{{ &
({{& '
configuration{{' 4
.{{4 5
GetValue{{5 =
<{{= >
string{{> D
>{{D E
({{E F
$str{{F Y
){{Y Z
!{{Z [
){{[ \
){{\ ]
;{{] ^
var}} 
creds}} 
=}} 
new}} 
SigningCredentials}} .
(}}. /
key}}/ 2
,}}2 3
SecurityAlgorithms}}4 F
.}}F G

HmacSha512}}G Q
)}}Q R
;}}R S
var 
tokenDescriptor 
=  !
new" %
JwtSecurityToken& 6
(6 7
issuer
ÄÄ 
:
ÄÄ 
configuration
ÄÄ %
.
ÄÄ% &
GetValue
ÄÄ& .
<
ÄÄ. /
string
ÄÄ/ 5
>
ÄÄ5 6
(
ÄÄ6 7
$str
ÄÄ7 K
)
ÄÄK L
,
ÄÄL M
audience
ÅÅ 
:
ÅÅ 
configuration
ÅÅ '
.
ÅÅ' (
GetValue
ÅÅ( 0
<
ÅÅ0 1
string
ÅÅ1 7
>
ÅÅ7 8
(
ÅÅ8 9
$str
ÅÅ9 O
)
ÅÅO P
,
ÅÅP Q
claims
ÇÇ 
:
ÇÇ 
claims
ÇÇ 
,
ÇÇ 
expires
ÉÉ 
:
ÉÉ 
DateTime
ÉÉ !
.
ÉÉ! "
UtcNow
ÉÉ" (
.
ÉÉ( )
AddDays
ÉÉ) 0
(
ÉÉ0 1
$num
ÉÉ1 2
)
ÉÉ2 3
,
ÉÉ3 4 
signingCredentials
ÑÑ "
:
ÑÑ" #
creds
ÑÑ$ )
)
ÖÖ 
;
ÖÖ 
return
áá 
new
áá %
JwtSecurityTokenHandler
áá .
(
áá. /
)
áá/ 0
.
áá0 1

WriteToken
áá1 ;
(
áá; <
tokenDescriptor
áá< K
)
ááK L
;
ááL M
}
àà 	
}
ââ 
}ää ÆC
ÉC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Services\AccountService.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Services  (
{		 
public

 

class

 
AccountService

 
(

  
MythosDbContext

  /
context

0 7
,

7 8
IUnitOfWork

9 D
_unitOfWork

E P
)

P Q
:

R S
IAccountService

T c
{ 
public 
async 
Task 
< 

AccountDto $
?$ %
>% &
GetAccountByIdAsync' :
(: ;
Guid; ?
id@ B
)B C
{ 	
var 
account 
= 
await 
context  '
.' (
Accounts( 0
.0 1
	FindAsync1 :
(: ;
id; =
)= >
;> ?
if 
( 
account 
is 
null 
)  
return 
null 
; 
return 
new 

AccountDto !
(! "
)" #
{ 
Username 
= 
account "
." #
Username# +
,+ ,
Password 
= 
account "
." #
PasswordHash# /
,/ 0
} 
; 
} 	
public 
async 
Task 
< 
AccountResponseDto ,
?, -
>- ..
"GetAccountByAccessTokenCookieAsync/ Q
(Q R
GuidR V
idW Y
)Y Z
{ 	
var 
account 
= 
await 
context  '
.' (
Accounts( 0
.0 1
	FindAsync1 :
(: ;
id; =
)= >
;> ?
if 
( 
account 
is 
null 
)  
return 
null 
; 
return!! 
new!! 
AccountResponseDto!! )
(!!) *
)!!* +
{"" 
	AccountId## 
=## 
account## #
.### $
Id##$ &
.##& '
ToString##' /
(##/ 0
)##0 1
,##1 2
Username$$ 
=$$ 
account$$ "
.$$" #
Username$$# +
,$$+ ,
Email%% 
=%% 
account%% 
.%%  
Email%%  %
,%%% &
Password&& 
=&& 
account&& "
.&&" #
PasswordHash&&# /
,&&/ 0
Role'' 
='' 
account'' 
.'' 
Role'' #
}(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ !
EditProfileRequestDto++ /
?++/ 0
>++0 1
UpdateAccountAsync++2 D
(++D E
Guid++E I
id++J L
,++L M!
EditProfileRequestDto++N c
model++d i
)++i j
{,, 	
var-- 
account-- 
=-- 
await-- 
context--  '
.--' (
Accounts--( 0
.--0 1
	FindAsync--1 :
(--: ;
id--; =
)--= >
;--> ?
if// 
(// 
account// 
is// 
null// 
)//  
return00 
null00 
;00 
account22 
.22 
Username22 
=22 
model22 $
.22$ %
Username22% -
;22- .
account33 
.33 
Email33 
=33 
model33 !
.33! "
Email33" '
;33' (
await55 
context55 
.55 
SaveChangesAsync55 *
(55* +
)55+ ,
;55, -
return66 
model66 
;66 
}77 	
public99 
async99 
Task99 
<99 
bool99 
>99 
ChangePasswordAsync99  3
(993 4
Guid994 8
id999 ;
,99; <!
ChangePasswordRequest99= R
request99S Z
)99Z [
{:: 	
var;; 
account;; 
=;; 
await;; 
context;;  '
.;;' (
Accounts;;( 0
.;;0 1
	FindAsync;;1 :
(;;: ;
id;;; =
);;= >
;;;> ?
if== 
(== 
account== 
is== 
null== 
)==  
return>> 
false>> 
;>> 
var@@ 
newPasswordHash@@ 
=@@  !
new@@" %
PasswordHasher@@& 4
<@@4 5
Account@@5 <
>@@< =
(@@= >
)@@> ?
.AA 
HashPasswordAA 
(AA 
accountAA %
,AA% &
requestAA' .
.AA. /
NewPasswordAA/ :
)AA: ;
;AA; <
accountBB 
.BB 
PasswordHashBB  
=BB! "
newPasswordHashBB# 2
;BB2 3
varDD 
resultDD 
=DD 
awaitDD 
contextDD &
.DD& '
SaveChangesAsyncDD' 7
(DD7 8
)DD8 9
;DD9 :
returnFF 
resultFF 
>FF 
$numFF 
;FF 
}GG 	
publicII 
asyncII 
TaskII 
<II  
BecomeWriterResponseII .
>II. /
BecomeWriterAsyncII0 A
(IIA B
GuidIIB F
	accountIdIIG P
,IIP Q
	PersonDtoIIR [
dtoII\ _
)II_ `
{JJ 	
varKK 
accountKK 
=KK 
awaitKK 
_unitOfWorkKK  +
.KK+ ,
AccountsKK, 4
.KK4 5
GetByIdAsyncKK5 A
(KKA B
	accountIdKKB K
)KKK L
;KKL M
ifLL 
(LL 
accountLL 
==LL 
nullLL 
)LL  
throwMM 
newMM 
BusinessExceptionMM +
(MM+ ,
$strMM, C
)MMC D
;MMD E
ifOO 
(OO 
accountOO 
.OO 
RoleOO 
==OO 
$strOO  (
)OO( )
throwPP 
newPP 
BusinessExceptionPP +
(PP+ ,
$strPP, ?
)PP? @
;PP@ A
ifQQ 
(QQ 
accountQQ 
.QQ 
RoleQQ 
!=QQ 
$strQQ  (
)QQ( )
throwRR 
newRR 
BusinessExceptionRR +
(RR+ ,
$strRR, ]
)RR] ^
;RR^ _
awaitTT 
_unitOfWorkTT 
.TT %
ExecuteInTransactionAsyncTT 7
(TT7 8
asyncTT8 =
(TT> ?
)TT? @
=>TTA C
{UU 
varVV 
personVV 
=VV 
newVV  
PersonVV! '
{WW 
PersonIdXX 
=XX 
GuidXX #
.XX# $
NewGuidXX$ +
(XX+ ,
)XX, -
,XX- .
NameYY 
=YY 
dtoYY 
.YY 
NameYY #
,YY# $
SurnamesZZ 
=ZZ 
dtoZZ "
.ZZ" #
LastNameZZ# +
,ZZ+ ,
	BirthDate[[ 
=[[ 
dto[[  #
.[[# $
	BirthDate[[$ -
,[[- .
Country\\ 
=\\ 
dto\\ !
.\\! "
Country\\" )
,\\) *
	Biography]] 
=]] 
dto]]  #
.]]# $
	Biography]]$ -
,]]- .
	AccountId^^ 
=^^ 
	accountId^^  )
}__ 
;__ 
_unitOfWorkaa 
.aa 
Peopleaa "
.aa" #
Addaa# &
(aa& '
personaa' -
)aa- .
;aa. /
accountcc 
.cc 
Rolecc 
=cc 
$strcc '
;cc' (
_unitOfWorkdd 
.dd 
Accountsdd $
.dd$ %
Updatedd% +
(dd+ ,
accountdd, 3
)dd3 4
;dd4 5
awaitff 
_unitOfWorkff !
.ff! "
	SaveAsyncff" +
(ff+ ,
)ff, -
;ff- .
}gg 
)gg 
;gg 
returnii 
newii  
BecomeWriterResponseii +
(ii+ ,
)ii, -
;ii- .
}jj 	
}kk 
}ll Æ
öC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\ITransactionRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
{ 
public 

	interface "
ITransactionRepository +
{ 
void 
Add 
( 
Transaction 
transaction (
)( )
;) *
} 
}		 à
üC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\ISubscriptionPlanRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
{ 
public 

	interface '
ISubscriptionPlanRepository 0
{ 
Task 
< 
SuscriptionPlan 
? 
> "
GetActivePlanByIdAsync 5
(5 6
int6 9
planId: @
)@ A
;A B
} 
}		 –
óC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\IPurchaseRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
;7 8
public 
	interface 
IPurchaseRepository $
{ 
Task		 
<		 	
List			 
<		 
string		 
>		 
>		 2
&GetPurchasedContentIdsByAccountIdAsync		 =
(		= >
Guid		> B
	accountId		C L
)		L M
;		M N
Task

 
AddAsync

	 
(

 
Purchase

 
purchase

 #
)

# $
;

$ %
Task 
< 	
bool	 
> 
ExistsAsync 
( 

Expression %
<% &
Func& *
<* +
Purchase+ 3
,3 4
bool5 9
>9 :
>: ;
	predicate< E
)E F
;F G
} â
ïC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\IPersonRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
;7 8
public 
	interface 
IPersonRepository "
{ 
void 
Add	 
( 
Person 
person 
) 
; 
}		 ¨
õC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\IMythosWalletRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
{ 
public 

	interface #
IMythosWalletRepository ,
{ 
Task 
AddBonusAsync 
( 
Guid 
userId  &
,& '
int( +
bonus, 1
)1 2
;2 3
Task 
< 
MythosWallet 
? 
> 
GetByUserIdAsync ,
(, -
Guid- 1
userId2 8
)8 9
;9 :
void		 
Update		 
(		 
MythosWallet		  
wallet		! '
)		' (
;		( )
}

 
} ¥
†C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\IMythosTransactionRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
;7 8
public 
	interface (
IMythosTransactionRepository -
{ 
Task 
AddAsync	 
( 
MythosTransaction #
transaction$ /
)/ 0
;0 1
}		 Ç
¢C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\IAccountSubscriptionRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
{ 
public 

	interface *
IAccountSubscriptionRepository 3
{ 
Task 
< 
bool 
> !
HasActiveSubscription (
(( )
Guid) -
userId. 4
)4 5
;5 6
void 
Add 
( "
AccountSuscriptionPlan '
subscription( 4
)4 5
;5 6
}		 
}

 Õ
ñC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Interfaces\IAccountRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -

Interfaces- 7
;7 8
public 
	interface 
IAccountRepository #
{ 
Task 
< 	
Account	 
? 
> 
GetByIdAsync 
(  
Guid  $
id% '
)' (
;( )
void		 
Update			 
(		 
Account		 
account		 
)		  
;		  !
}

 ˛
ûC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\TransactionRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
{ 
public 

class !
TransactionRepository &
(& '
MythosDbContext' 6
_context7 ?
)? @
:A B"
ITransactionRepositoryC Y
{ 
public		 
void		 
Add		 
(		 
Transaction		 #
transaction		$ /
)		/ 0
{

 	
_context 
. 
Transactions !
.! "
Add" %
(% &
transaction& 1
)1 2
;2 3
} 	
} 
} ∞	
£C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\SubscriptionPlanRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
{ 
public 

class &
SubscriptionPlanRepository +
(+ ,
MythosDbContext, ;
_context< D
)D E
:F G'
ISubscriptionPlanRepositoryH c
{		 
public

 
Task

 
<

 
SuscriptionPlan

 #
?

# $
>

$ %"
GetActivePlanByIdAsync

& <
(

< =
int

= @
planId

A G
)

G H
{ 	
return 
_context 
. 
SuscriptionPlans ,
., -
FirstOrDefaultAsync- @
(@ A
pA B
=>C E
pF G
.G H
SuscriptionPlanIdH Y
==Z \
planId] c
&&d f
pg h
.h i
IsActivei q
)q r
;r s
} 	
} 
} Ç
õC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\PurchaseRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
;< =
public

 
class

 
PurchaseRepository

 
(

  
MythosDbContext

  /
_context

0 8
)

8 9
:

: ;
IPurchaseRepository

< O
{ 
public 

async 
Task 
< 
List 
< 
string !
>! "
>" #2
&GetPurchasedContentIdsByAccountIdAsync$ J
(J K
GuidK O
	accountIdP Y
)Y Z
{ 
return 
await 
_context 
. 
	Purchases '
. 
Where 
( 
p 
=> 
p 
. 
	AccountId #
==$ &
	accountId' 0
)0 1
. 
Select 
( 
p 
=> 
p 
. 
	ContentId $
)$ %
.% &
ToListAsync& 1
(1 2
)2 3
;3 4
} 
public 

async 
Task 
AddAsync 
( 
Purchase '
purchase( 0
)0 1
{ 
await 
_context 
. 
	Purchases  
.  !
AddAsync! )
() *
purchase* 2
)2 3
;3 4
} 
public 

async 
Task 
< 
bool 
> 
ExistsAsync '
(' (

Expression( 2
<2 3
Func3 7
<7 8
Purchase8 @
,@ A
boolB F
>F G
>G H
	predicateI R
)R S
{ 
return 
await 
_context 
. 
	Purchases '
.' (
AnyAsync( 0
(0 1
	predicate1 :
): ;
;; <
} 
} …
ôC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\PersonRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
;< =
public 
class 
PersonRepository 
( 
MythosDbContext -
_context. 6
)6 7
:8 9
IPersonRepository: K
{		 
public

 

void

 
Add

 
(

 
Person

 
person

 !
)

! "
{ 
_context 
. 
People 
. 
Add 
( 
person "
)" #
;# $
} 
} Ä
üC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\MythosWalletRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
{ 
public 

class "
MythosWalletRepository '
(' (
MythosDbContext( 7
_context8 @
)@ A
:B C#
IMythosWalletRepositoryD [
{		 
public

 
async

 
Task

 
AddBonusAsync

 '
(

' (
Guid

( ,
userId

- 3
,

3 4
int

5 8
bonus

9 >
)

> ?
{ 	
var 
wallet 
= 
await 
_context '
.' (
MythosWallets( 5
.5 6
FirstOrDefaultAsync6 I
(I J
wJ K
=>L N
wO P
.P Q
UserIdQ W
==X Z
userId[ a
)a b
;b c
if 
( 
wallet 
!= 
null 
) 
{ 
wallet 
. 
MythrasBalance %
+=& (
bonus) .
;. /
wallet 
. 
LastUpdated "
=# $
DateTime% -
.- .
UtcNow. 4
;4 5
} 
} 	
public 
async 
Task 
< 
MythosWallet &
?& '
>' (
GetByUserIdAsync) 9
(9 :
Guid: >
userId? E
)E F
{ 	
return 
await 
_context !
.! "
MythosWallets" /
./ 0
FirstOrDefaultAsync0 C
(C D
wD E
=>F H
wI J
.J K
UserIdK Q
==R T
userIdU [
)[ \
;\ ]
} 	
public 
void 
Update 
( 
MythosWallet '
wallet( .
). /
{ 	
_context 
. 
MythosWallets "
." #
Update# )
() *
wallet* 0
)0 1
;1 2
} 	
} 
} ª
§C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\MythosTransactionRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
;< =
public 
class '
MythosTransactionRepository (
(( )
MythosDbContext) 8
_context9 A
)A B
:C D(
IMythosTransactionRepositoryE a
{		 
public

 

async

 
Task

 
AddAsync

 
(

 
MythosTransaction

 0
transaction

1 <
)

< =
{ 
await 
_context 
. 
MythosTransactions )
.) *
AddAsync* 2
(2 3
transaction3 >
)> ?
;? @
} 
} †
¶C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\AccountSubscriptionRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
{ 
public 

class )
AccountSubscriptionRepository .
(. /
MythosDbContext/ >
_context? G
)G H
:I J*
IAccountSubscriptionRepositoryK i
{		 
public

 
void

 
Add

 
(

 "
AccountSuscriptionPlan

 .
subscription

/ ;
)

; <
{ 	
_context 
. #
AccountSuscriptionPlans ,
., -
Add- 0
(0 1
subscription1 =
)= >
;> ?
} 	
public 
Task 
< 
bool 
> !
HasActiveSubscription /
(/ 0
Guid0 4
userId5 ;
); <
{ 	
return 
_context 
. #
AccountSuscriptionPlans 3
. 
AnyAsync 
( 
s 
=> 
s 
. 
	AccountId &
==' )
userId* 0
&&1 3
s4 5
.5 6
EndDate6 =
>> ?
DateTime@ H
.H I
UtcNowI O
&&P R
sS T
.T U
StatusU [
==\ ^
$str_ g
)g h
;h i
} 	
} 
} è

öC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Repositories\Implementations\AccountRepository.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Repositories  ,
., -
Implementations- <
;< =
public 
class 
AccountRepository 
( 
MythosDbContext .
_context/ 7
)7 8
:9 :
IAccountRepository; M
{		 
public

 

async

 
Task

 
<

 
Account

 
?

 
>

 
GetByIdAsync

  ,
(

, -
Guid

- 1
id

2 4
)

4 5
{ 
return 
await 
_context 
. 
Accounts &
.& '
	FindAsync' 0
(0 1
id1 3
)3 4
;4 5
} 
public 

void 
Update 
( 
Account 
account &
)& '
{ 
_context 
. 
Accounts 
. 
Update  
(  !
account! (
)( )
;) *
} 
} È]
sC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. 

AddOpenApi 
( 
) 
; 
builder 
. 
Services 
. 
AddDbContext 
< 
MythosDbContext -
>- .
(. /
options/ 6
=>7 9
options 
. 
UseSqlServer 
( 
builder  
.  !
Configuration! .
.. /
GetConnectionString/ B
(B C
$strC S
)S T
)T U
)U V
;V W
builder 
. 
Services 
. 
AddAuthentication "
(" #
JwtBearerDefaults# 4
.4 5 
AuthenticationScheme5 I
)I J
. 
AddJwtBearer 
( 
options 
=> 
{ 
options 
. %
TokenValidationParameters )
=* +
new, /%
TokenValidationParameters0 I
{ 	
ValidateIssuer 
= 
true !
,! "
ValidIssuer 
= 
builder !
.! "
Configuration" /
[/ 0
$str0 D
]D E
,E F
ValidateAudience   
=   
true   #
,  # $
ValidAudience!! 
=!! 
builder!! #
.!!# $
Configuration!!$ 1
[!!1 2
$str!!2 H
]!!H I
,!!I J
ValidateLifetime"" 
="" 
true"" #
,""# $
IssuerSigningKey## 
=## 
new## " 
SymmetricSecurityKey### 7
(##7 8
Encoding##8 @
.##@ A
UTF8##A E
.##E F
GetBytes##F N
(##N O
builder##O V
.##V W
Configuration##W d
[##d e
$str##e x
]##x y
!##y z
)##z {
)##{ |
,##| }$
ValidateIssuerSigningKey$$ $
=$$% &
true$$' +
}%% 	
;%%	 

options'' 
.'' 
Events'' 
='' 
new'' 
JwtBearerEvents'' ,
{(( 	
OnMessageReceived)) 
=)) 
context))  '
=>))( *
{** 
if++ 
(++ 
context++ 
.++ 
Request++ #
.++# $
Cookies++$ +
.+++ ,
TryGetValue++, 7
(++7 8
$str++8 E
,++E F
out++G J
var++K N
cookieToken++O Z
)++Z [
&&++\ ^
!++_ `
string++` f
.++f g
IsNullOrEmpty++g t
(++t u
cookieToken	++u Ä
)
++Ä Å
)
++Å Ç
{,, 
context-- 
.-- 
Token-- !
=--" #
cookieToken--$ /
;--/ 0
}.. 
else// 
{00 
var11 

authHeader11 "
=11# $
context11% ,
.11, -
Request11- 4
.114 5
Headers115 <
[11< =
$str11= L
]11L M
.11M N
FirstOrDefault11N \
(11\ ]
)11] ^
;11^ _
if22 
(22 
!22 
string22 
.22  
IsNullOrEmpty22  -
(22- .

authHeader22. 8
)228 9
&&22: <

authHeader22= G
.22G H

StartsWith22H R
(22R S
$str22S \
)22\ ]
)22] ^
{33 
context44 
.44  
Token44  %
=44& '

authHeader44( 2
.442 3
	Substring443 <
(44< =
$str44= F
.44F G
Length44G M
)44M N
.44N O
Trim44O S
(44S T
)44T U
;44U V
}55 
}66 
return88 
Task88 
.88 
CompletedTask88 )
;88) *
}99 
}:: 	
;::	 

};; 
);; 
;;; 
builder== 
.== 
Services== 
.== 
AddCors== 
(== 
options==  
=>==! #
{>> 
options?? 
.?? 
	AddPolicy?? 
(?? 
$str?? +
,??+ ,
policy??- 3
=>??4 6
{@@ 
policyAA 
.AA 
WithOriginsAA 
(AA 
$strAA 3
,AA3 4
$strAA5 L
)AAL M
.AAM N
AllowAnyHeaderAAN \
(AA\ ]
)AA] ^
.AA^ _
AllowAnyMethodAA_ m
(AAm n
)AAn o
.AAo p
AllowCredentials	AAp Ä
(
AAÄ Å
)
AAÅ Ç
;
AAÇ É
}DD 
)DD 
;DD 
}EE 
)EE 
;EE 
builderGG 
.GG 
ServicesGG 
.GG 
	AddScopedGG 
<GG 
IAuthServiceGG '
,GG' (
AuthServiceGG) 4
>GG4 5
(GG5 6
)GG6 7
;GG7 8
builderHH 
.HH 
ServicesHH 
.HH 
	AddScopedHH 
<HH 
IAccountServiceHH *
,HH* +
AccountServiceHH, :
>HH: ;
(HH; <
)HH< =
;HH= >
builderII 
.II 
ServicesII 
.II 
	AddScopedII 
<II %
IMythosTransactionServiceII 4
,II4 5$
MythosTransactionServiceII6 N
>IIN O
(IIO P
)IIP Q
;IIQ R
builderJJ 
.JJ 
ServicesJJ 
.JJ 
	AddScopedJJ 
<JJ #
IMythrasPurchaseServiceJJ 2
,JJ2 3"
MythrasPurchaseServiceJJ4 J
>JJJ K
(JJK L
)JJL M
;JJM N
builderKK 
.KK 
ServicesKK 
.KK 
	AddScopedKK 
<KK 
IWithdrawalServiceKK -
,KK- .
WithdrawalServiceKK/ @
>KK@ A
(KKA B
)KKB C
;KKC D
builderLL 
.LL 
ServicesLL 
.LL 
	AddScopedLL 
<LL  
IMythosWalletServiceLL /
,LL/ 0
MythosWalletServiceLL1 D
>LLD E
(LLE F
)LLF G
;LLG H
builderMM 
.MM 
ServicesMM 
.MM 
	AddScopedMM 
<MM "
IMythrasPackageServiceMM 1
,MM1 2!
MythrasPackageServiceMM3 H
>MMH I
(MMI J
)MMJ K
;MMK L
builderNN 
.NN 
ServicesNN 
.NN 
	AddScopedNN 
<NN  
ISubscriptionServiceNN /
,NN/ 0
SubscriptionServiceNN1 D
>NND E
(NNE F
)NNF G
;NNG H
builderOO 
.OO 
ServicesOO 
.OO 
	AddScopedOO 
<OO 
IPurchaseServiceOO +
,OO+ ,
PurchaseServiceOO- <
>OO< =
(OO= >
)OO> ?
;OO? @
builderQQ 
.QQ 
ServicesQQ 
.QQ 
	AddScopedQQ 
<QQ 
IUnitOfWorkQQ &
,QQ& '

UnitOfWorkQQ( 2
>QQ2 3
(QQ3 4
)QQ4 5
;QQ5 6
builderRR 
.RR 
ServicesRR 
.RR 
	AddScopedRR 
<RR '
ISubscriptionPlanRepositoryRR 6
,RR6 7&
SubscriptionPlanRepositoryRR8 R
>RRR S
(RRS T
)RRT U
;RRU V
builderSS 
.SS 
ServicesSS 
.SS 
	AddScopedSS 
<SS "
ITransactionRepositorySS 1
,SS1 2!
TransactionRepositorySS3 H
>SSH I
(SSI J
)SSJ K
;SSK L
builderTT 
.TT 
ServicesTT 
.TT 
	AddScopedTT 
<TT *
IAccountSubscriptionRepositoryTT 9
,TT9 :)
AccountSubscriptionRepositoryTT; X
>TTX Y
(TTY Z
)TTZ [
;TT[ \
builderUU 
.UU 
ServicesUU 
.UU 
	AddScopedUU 
<UU #
IMythosWalletRepositoryUU 2
,UU2 3"
MythosWalletRepositoryUU4 J
>UUJ K
(UUK L
)UUL M
;UUM N
builderVV 
.VV 
ServicesVV 
.VV 
	AddScopedVV 
<VV 
IAccountRepositoryVV -
,VV- .
AccountRepositoryVV/ @
>VV@ A
(VVA B
)VVB C
;VVC D
builderWW 
.WW 
ServicesWW 
.WW 
	AddScopedWW 
<WW 
IPersonRepositoryWW ,
,WW, -
PersonRepositoryWW. >
>WW> ?
(WW? @
)WW@ A
;WWA B
builderXX 
.XX 
ServicesXX 
.XX 
	AddScopedXX 
<XX 
IPurchaseRepositoryXX .
,XX. /
PurchaseRepositoryXX0 B
>XXB C
(XXC D
)XXD E
;XXE F
builderYY 
.YY 
ServicesYY 
.YY 
	AddScopedYY 
<YY (
IMythosTransactionRepositoryYY 7
,YY7 8'
MythosTransactionRepositoryYY9 T
>YYT U
(YYU V
)YYV W
;YYW X
var[[ 
app[[ 
=[[ 	
builder[[
 
.[[ 
Build[[ 
([[ 
)[[ 
;[[ 
using]] 
(]] 
var]] 

scope]] 
=]] 
app]] 
.]] 
Services]] 
.]]  
CreateScope]]  +
(]]+ ,
)]], -
)]]- .
{^^ 
var__ 
	dbContext__ 
=__ 
scope__ 
.__ 
ServiceProvider__ )
.__) *
GetRequiredService__* <
<__< =
MythosDbContext__= L
>__L M
(__M N
)__N O
;__O P
ifaa 
(aa 
	dbContextaa 
.aa 
Databaseaa 
.aa 
IsRelationalaa '
(aa' (
)aa( )
)aa) *
{bb 
	dbContextcc 
.cc 
Databasecc 
.cc 
Migratecc "
(cc" #
)cc# $
;cc$ %
}dd 
}ee 
ifhh 
(hh 
apphh 
.hh 
Environmenthh 
.hh 
IsDevelopmenthh !
(hh! "
)hh" #
)hh# $
{ii 
appjj 
.jj 

MapOpenApijj 
(jj 
)jj 
;jj 
}kk 
appmm 
.mm 
UseHttpsRedirectionmm 
(mm 
)mm 
;mm 
appoo 
.oo 
UseCorsoo 
(oo 
$stroo !
)oo! "
;oo" #
appqq 
.qq 
UseMiddlewareqq 
<qq &
ExceptionHandlerMiddlewareqq ,
>qq, -
(qq- .
)qq. /
;qq/ 0
appss 
.ss 
UseAuthenticationss 
(ss 
)ss 
;ss 
apptt 
.tt 
UseAuthorizationtt 
(tt 
)tt 
;tt 
appvv 
.vv 
MapControllersvv 
(vv 
)vv 
;vv 
appxx 
.xx 
Runxx 
(xx 
)xx 	
;xx	 
∞	
àC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\WithdrawalResponseDto.cs
public 
class !
WithdrawalResponseDto "
{ 
public 

string 
Message 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
public 

int 
WithdrawnMythras 
{  !
get" %
;% &
set' *
;* +
}, -
public 

decimal 
AmountInPesos  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

string 
Status 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
public 

DateTime 
RequestedDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
} “
ÑC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\WalletResponseDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class 
WalletResponseDto "
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
MythrasBalance !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsLocked 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
LastUpdated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
}		 
}

 …
ÉC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\TokenResponseDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class 
TokenResponseDto !
{ 
public 
required 
string 
AccessToken *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
required 
string 
RefreshToken +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} Ï
C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\SubscribeDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class 
SubscribeDto 
{ 
public 
int 
PlanId 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ∏
âC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\RefreshTokenRequestDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class "
RefreshTokenRequestDto '
{ 
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
required 
string 
RefreshToken +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} ÿ
ÖC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\PurchaseRequestDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
;& '
public 
class 
PurchaseRequestDto 
{ 
public 

string 
	ContentId 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 

int 
Price 
{ 
get 
; 
set 
;  
}! "
}		 ß
çC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\PurchaseMythrasResponseDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class &
PurchaseMythrasResponseDto +
{ 
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 
int 
MythrasBalance !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
WalletLastUpdated )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
}		 €
åC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\PurchaseMythrasRequestDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class %
PurchaseMythrasRequestDto *
{ 
public 
int 
MythrasPackageId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 

CardNumber  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
string1 7
.7 8
Empty8 =
;= >
public 
string 

CardHolder  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
string1 7
.7 8
Empty8 =
;= >
public 
string 

ExpiryDate  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
string1 7
.7 8
Empty8 =
;= >
public		 
string		 
Cvc		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
=		( )
string		* 0
.		0 1
Empty		1 6
;		6 7
public

 
string

 
CardType

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
=

- .
string

/ 5
.

5 6
Empty

6 ;
;

; <
public 
BillingAddressDto  
BillingAddress! /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
=> ?
new@ C
(C D
)D E
;E F
} 
public 

class 
BillingAddressDto "
{ 
public 
string 
Street 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
string 

PostalCode  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
string1 7
.7 8
Empty8 =
;= >
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
} 
} ô
|C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\PersonDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
;& '
public 
class 
	PersonDto 
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 

string 
LastName 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public		 

DateTime		 
	BirthDate		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 

string

 
Country

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
=

( )
string

* 0
.

0 1
Empty

1 6
;

6 7
public 

string 
	Biography 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} ≈
àC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\EditProfileRequestDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class !
EditProfileRequestDto &
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
} 
} í
ÑC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\CreatePurchaseDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class 
CreatePurchaseDto "
{ 
public 
string 
	ContentId 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
public 
int 
MythrasPrice 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
MythosTransactionId &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
}		 ñ
ÜC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\DonationResponseDto.cs
public 
class 
DonationResponseDto  
{ 
public 

string 
Message 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
public 

int 
SenderBalance 
{ 
get "
;" #
set$ '
;' (
}) *
public 

int 
ReceiverBalance 
{  
get! $
;$ %
set& )
;) *
}+ ,
} Õ

çC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\CreateWithdrawalRequestDto.cs
public 
class &
CreateWithdrawalRequestDto '
{ 
public 

int 
Amount 
{ 
get 
; 
set  
;  !
}" #
public 

string 

CardNumber 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 

string 

CardHolder 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 

string 
Bank 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 

string 
Concept 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
} ú
çC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\CreateMythosTransactionDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 &
CreateMythosTransactionDto		 +
:		, -
ControllerBase		. <
{

 
public !
MythosTransactionType $
Type% )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
Amount 
{ 
get 
;  
set! $
;$ %
}& '
public 
Guid !
CounterpartyAccountId )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} ü
ÑC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\CreateDonationDto.cs
public 
class 
CreateDonationDto 
{ 
public 

Guid 
ReceiverAccountId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 

int 
Amount 
{ 
get 
; 
set  
;  !
}" #
} π
äC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\CreateAccountRequestDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class #
CreateAccountRequestDto (
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
} 
}		 ¬
àC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\ChangePasswordRequest.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class !
ChangePasswordRequest &
{ 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength (
=) *
$num+ ,
), -
]- .
public		 
string		 
NewPassword		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
=		0 1
string		2 8
.		8 9
Empty		9 >
;		> ?
}

 
} †
áC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\BecomeWriterResponse.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
;& '
public 
class  
BecomeWriterResponse !
{ 
public 

string 
Message 
{ 
get 
;  
set! $
;$ %
}& '
=( )
$str* J
;J K
} ∏
ÖC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\AccountResponseDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class 
AccountResponseDto #
{ 
public 
string 
	AccountId 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public		 
string		 
Role		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} ±
}C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Models\AccountDto.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Models  &
{ 
public 

class 

AccountDto 
{ 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
} 
} ‚S
îC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250626013201_UpdateSeedData.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 
UpdateSeedData		 '
:		( )
	Migration		* 3
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 

UpdateData '
(' (
table 
: 
$str (
,( )
	keyColumn 
: 
$str -
,- .
keyValue 
: 
$num 
, 
column 
: 
$str #
,# $
value 
: 
new 
DateTime #
(# $
$num$ (
,( )
$num* +
,+ ,
$num- /
,/ 0
$num1 2
,2 3
$num4 5
,5 6
$num7 8
,8 9
$num: ;
,; <
DateTimeKind= I
.I J
UtcJ M
)M N
)N O
;O P
migrationBuilder 
. 

UpdateData '
(' (
table 
: 
$str (
,( )
	keyColumn 
: 
$str -
,- .
keyValue 
: 
$num 
, 
column 
: 
$str #
,# $
value 
: 
new 
DateTime #
(# $
$num$ (
,( )
$num* +
,+ ,
$num- /
,/ 0
$num1 2
,2 3
$num4 5
,5 6
$num7 8
,8 9
$num: ;
,; <
DateTimeKind= I
.I J
UtcJ M
)M N
)N O
;O P
migrationBuilder 
. 

UpdateData '
(' (
table 
: 
$str (
,( )
	keyColumn 
: 
$str -
,- .
keyValue 
: 
$num 
, 
column   
:   
$str   #
,  # $
value!! 
:!! 
new!! 
DateTime!! #
(!!# $
$num!!$ (
,!!( )
$num!!* +
,!!+ ,
$num!!- /
,!!/ 0
$num!!1 2
,!!2 3
$num!!4 5
,!!5 6
$num!!7 8
,!!8 9
$num!!: ;
,!!; <
DateTimeKind!!= I
.!!I J
Utc!!J M
)!!M N
)!!N O
;!!O P
migrationBuilder## 
.## 

UpdateData## '
(##' (
table$$ 
:$$ 
$str$$ )
,$$) *
	keyColumn%% 
:%% 
$str%% .
,%%. /
keyValue&& 
:&& 
$num&& 
,&& 
column'' 
:'' 
$str'' #
,''# $
value(( 
:(( 
new(( 
DateTime(( #
(((# $
$num(($ (
,((( )
$num((* +
,((+ ,
$num((- /
,((/ 0
$num((1 2
,((2 3
$num((4 5
,((5 6
$num((7 8
,((8 9
$num((: ;
,((; <
DateTimeKind((= I
.((I J
Utc((J M
)((M N
)((N O
;((O P
migrationBuilder** 
.** 

UpdateData** '
(**' (
table++ 
:++ 
$str++ )
,++) *
	keyColumn,, 
:,, 
$str,, .
,,,. /
keyValue-- 
:-- 
$num-- 
,-- 
column.. 
:.. 
$str.. #
,..# $
value// 
:// 
new// 
DateTime// #
(//# $
$num//$ (
,//( )
$num//* +
,//+ ,
$num//- /
,/// 0
$num//1 2
,//2 3
$num//4 5
,//5 6
$num//7 8
,//8 9
$num//: ;
,//; <
DateTimeKind//= I
.//I J
Utc//J M
)//M N
)//N O
;//O P
migrationBuilder11 
.11 

UpdateData11 '
(11' (
table22 
:22 
$str22 )
,22) *
	keyColumn33 
:33 
$str33 .
,33. /
keyValue44 
:44 
$num44 
,44 
column55 
:55 
$str55 #
,55# $
value66 
:66 
new66 
DateTime66 #
(66# $
$num66$ (
,66( )
$num66* +
,66+ ,
$num66- /
,66/ 0
$num661 2
,662 3
$num664 5
,665 6
$num667 8
,668 9
$num66: ;
,66; <
DateTimeKind66= I
.66I J
Utc66J M
)66M N
)66N O
;66O P
}77 	
	protected:: 
override:: 
void:: 
Down::  $
(::$ %
MigrationBuilder::% 5
migrationBuilder::6 F
)::F G
{;; 	
migrationBuilder<< 
.<< 

UpdateData<< '
(<<' (
table== 
:== 
$str== (
,==( )
	keyColumn>> 
:>> 
$str>> -
,>>- .
keyValue?? 
:?? 
$num?? 
,?? 
column@@ 
:@@ 
$str@@ #
,@@# $
valueAA 
:AA 
newAA 
DateTimeAA #
(AA# $
$numAA$ (
,AA( )
$numAA* +
,AA+ ,
$numAA- /
,AA/ 0
$numAA1 2
,AA2 3
$numAA4 6
,AA6 7
$numAA8 :
,AA: ;
$numAA< ?
,AA? @
DateTimeKindAAA M
.AAM N
UtcAAN Q
)AAQ R
.AAR S
AddTicksAAS [
(AA[ \
$numAA\ `
)AA` a
)AAa b
;AAb c
migrationBuilderCC 
.CC 

UpdateDataCC '
(CC' (
tableDD 
:DD 
$strDD (
,DD( )
	keyColumnEE 
:EE 
$strEE -
,EE- .
keyValueFF 
:FF 
$numFF 
,FF 
columnGG 
:GG 
$strGG #
,GG# $
valueHH 
:HH 
newHH 
DateTimeHH #
(HH# $
$numHH$ (
,HH( )
$numHH* +
,HH+ ,
$numHH- /
,HH/ 0
$numHH1 2
,HH2 3
$numHH4 6
,HH6 7
$numHH8 :
,HH: ;
$numHH< ?
,HH? @
DateTimeKindHHA M
.HHM N
UtcHHN Q
)HHQ R
.HHR S
AddTicksHHS [
(HH[ \
$numHH\ `
)HH` a
)HHa b
;HHb c
migrationBuilderJJ 
.JJ 

UpdateDataJJ '
(JJ' (
tableKK 
:KK 
$strKK (
,KK( )
	keyColumnLL 
:LL 
$strLL -
,LL- .
keyValueMM 
:MM 
$numMM 
,MM 
columnNN 
:NN 
$strNN #
,NN# $
valueOO 
:OO 
newOO 
DateTimeOO #
(OO# $
$numOO$ (
,OO( )
$numOO* +
,OO+ ,
$numOO- /
,OO/ 0
$numOO1 2
,OO2 3
$numOO4 6
,OO6 7
$numOO8 :
,OO: ;
$numOO< ?
,OO? @
DateTimeKindOOA M
.OOM N
UtcOON Q
)OOQ R
.OOR S
AddTicksOOS [
(OO[ \
$numOO\ `
)OO` a
)OOa b
;OOb c
migrationBuilderQQ 
.QQ 

UpdateDataQQ '
(QQ' (
tableRR 
:RR 
$strRR )
,RR) *
	keyColumnSS 
:SS 
$strSS .
,SS. /
keyValueTT 
:TT 
$numTT 
,TT 
columnUU 
:UU 
$strUU #
,UU# $
valueVV 
:VV 
newVV 
DateTimeVV #
(VV# $
$numVV$ (
,VV( )
$numVV* +
,VV+ ,
$numVV- /
,VV/ 0
$numVV1 2
,VV2 3
$numVV4 6
,VV6 7
$numVV8 :
,VV: ;
$numVV< ?
,VV? @
DateTimeKindVVA M
.VVM N
UtcVVN Q
)VVQ R
.VVR S
AddTicksVVS [
(VV[ \
$numVV\ `
)VV` a
)VVa b
;VVb c
migrationBuilderXX 
.XX 

UpdateDataXX '
(XX' (
tableYY 
:YY 
$strYY )
,YY) *
	keyColumnZZ 
:ZZ 
$strZZ .
,ZZ. /
keyValue[[ 
:[[ 
$num[[ 
,[[ 
column\\ 
:\\ 
$str\\ #
,\\# $
value]] 
:]] 
new]] 
DateTime]] #
(]]# $
$num]]$ (
,]]( )
$num]]* +
,]]+ ,
$num]]- /
,]]/ 0
$num]]1 2
,]]2 3
$num]]4 6
,]]6 7
$num]]8 :
,]]: ;
$num]]< ?
,]]? @
DateTimeKind]]A M
.]]M N
Utc]]N Q
)]]Q R
.]]R S
AddTicks]]S [
(]][ \
$num]]\ `
)]]` a
)]]a b
;]]b c
migrationBuilder__ 
.__ 

UpdateData__ '
(__' (
table`` 
:`` 
$str`` )
,``) *
	keyColumnaa 
:aa 
$straa .
,aa. /
keyValuebb 
:bb 
$numbb 
,bb 
columncc 
:cc 
$strcc #
,cc# $
valuedd 
:dd 
newdd 
DateTimedd #
(dd# $
$numdd$ (
,dd( )
$numdd* +
,dd+ ,
$numdd- /
,dd/ 0
$numdd1 2
,dd2 3
$numdd4 6
,dd6 7
$numdd8 :
,dd: ;
$numdd< ?
,dd? @
DateTimeKindddA M
.ddM N
UtcddN Q
)ddQ R
.ddR S
AddTicksddS [
(dd[ \
$numdd\ `
)dd` a
)dda b
;ddb c
}ee 	
}ff 
}gg öA
°C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250626012522_SeedInitialPlansAndPackages.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{		 
public 

partial 
class '
SeedInitialPlansAndPackages 4
:5 6
	Migration7 @
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 

InsertData '
(' (
table 
: 
$str (
,( )
columns 
: 
new 
[ 
] 
{  
$str! 3
,3 4
$str5 C
,C D
$strE P
,P Q
$strR \
,\ ]
$str^ m
,m n
$stro u
,u v
$strw ~
}	 Ä
,
Ä Å
values 
: 
new 
object "
[" #
,# $
]$ %
{ 
{ 
$num 
, 
$num 
, 
new 
DateTime  (
(( )
$num) -
,- .
$num/ 0
,0 1
$num2 4
,4 5
$num6 7
,7 8
$num9 ;
,; <
$num= ?
,? @
$numA D
,D E
DateTimeKindF R
.R S
UtcS V
)V W
.W X
AddTicksX `
(` a
$numa e
)e f
,f g
trueh l
,l m
$numn q
,q r
$str	s Ç
,
Ç É
$num
Ñ ä
}
ã å
,
å ç
{ 
$num 
, 
$num 
, 
new  
DateTime! )
() *
$num* .
,. /
$num0 1
,1 2
$num3 5
,5 6
$num7 8
,8 9
$num: <
,< =
$num> @
,@ A
$numB E
,E F
DateTimeKindG S
.S T
UtcT W
)W X
.X Y
AddTicksY a
(a b
$numb f
)f g
,g h
truei m
,m n
$numo r
,r s
$str	t Ö
,
Ö Ü
$num
á é
}
è ê
,
ê ë
{ 
$num 
, 
$num 
, 
new !
DateTime" *
(* +
$num+ /
,/ 0
$num1 2
,2 3
$num4 6
,6 7
$num8 9
,9 :
$num; =
,= >
$num? A
,A B
$numC F
,F G
DateTimeKindH T
.T U
UtcU X
)X Y
.Y Z
AddTicksZ b
(b c
$numc g
)g h
,h i
truej n
,n o
$nump s
,s t
$str	u Ö
,
Ö Ü
$num
á é
}
è ê
} 
) 
; 
migrationBuilder 
. 

InsertData '
(' (
table 
: 
$str )
,) *
columns 
: 
new 
[ 
] 
{  
$str! 4
,4 5
$str6 A
,A B
$strC Q
,Q R
$strS b
,b c
$strd n
,n o
$str	p Ö
,
Ö Ü
$str
á ç
,
ç é
$str
è ñ
}
ó ò
,
ò ô
values 
: 
new 
object "
[" #
,# $
]$ %
{ 
{ 
$num 
, 
new 
DateTime %
(% &
$num& *
,* +
$num, -
,- .
$num/ 1
,1 2
$num3 4
,4 5
$num6 8
,8 9
$num: <
,< =
$num> A
,A B
DateTimeKindC O
.O P
UtcP S
)S T
.T U
AddTicksU ]
(] ^
$num^ b
)b c
,c d
$nume g
,g h
$stri }
,} ~
true	 É
,
É Ñ
$num
Ö à
,
à â
$str
ä ó
,
ó ò
$num
ô ü
}
† °
,
° ¢
{   
$num   
,   
new   
DateTime   %
(  % &
$num  & *
,  * +
$num  , -
,  - .
$num  / 1
,  1 2
$num  3 4
,  4 5
$num  6 8
,  8 9
$num  : <
,  < =
$num  > A
,  A B
DateTimeKind  C O
.  O P
Utc  P S
)  S T
.  T U
AddTicks  U ]
(  ] ^
$num  ^ b
)  b c
,  c d
$num  e g
,  g h
$str  i }
,  } ~
true	   É
,
  É Ñ
$num
  Ö à
,
  à â
$str
  ä ô
,
  ô ö
$num
  õ °
}
  ¢ £
,
  £ §
{!! 
$num!! 
,!! 
new!! 
DateTime!! %
(!!% &
$num!!& *
,!!* +
$num!!, -
,!!- .
$num!!/ 1
,!!1 2
$num!!3 4
,!!4 5
$num!!6 8
,!!8 9
$num!!: <
,!!< =
$num!!> A
,!!A B
DateTimeKind!!C O
.!!O P
Utc!!P S
)!!S T
.!!T U
AddTicks!!U ]
(!!] ^
$num!!^ b
)!!b c
,!!c d
$num!!e g
,!!g h
$str!!i y
,!!y z
true!!{ 
,	!! Ä
$num
!!Å Ñ
,
!!Ñ Ö
$str
!!Ü î
,
!!î ï
$num
!!ñ ù
}
!!û ü
}"" 
)"" 
;"" 
}## 	
	protected&& 
override&& 
void&& 
Down&&  $
(&&$ %
MigrationBuilder&&% 5
migrationBuilder&&6 F
)&&F G
{'' 	
migrationBuilder(( 
.(( 

DeleteData(( '
(((' (
table)) 
:)) 
$str)) (
,))( )
	keyColumn** 
:** 
$str** -
,**- .
keyValue++ 
:++ 
$num++ 
)++ 
;++ 
migrationBuilder-- 
.-- 

DeleteData-- '
(--' (
table.. 
:.. 
$str.. (
,..( )
	keyColumn// 
:// 
$str// -
,//- .
keyValue00 
:00 
$num00 
)00 
;00 
migrationBuilder22 
.22 

DeleteData22 '
(22' (
table33 
:33 
$str33 (
,33( )
	keyColumn44 
:44 
$str44 -
,44- .
keyValue55 
:55 
$num55 
)55 
;55 
migrationBuilder77 
.77 

DeleteData77 '
(77' (
table88 
:88 
$str88 )
,88) *
	keyColumn99 
:99 
$str99 .
,99. /
keyValue:: 
::: 
$num:: 
):: 
;:: 
migrationBuilder<< 
.<< 

DeleteData<< '
(<<' (
table== 
:== 
$str== )
,==) *
	keyColumn>> 
:>> 
$str>> .
,>>. /
keyValue?? 
:?? 
$num?? 
)?? 
;?? 
migrationBuilderAA 
.AA 

DeleteDataAA '
(AA' (
tableBB 
:BB 
$strBB )
,BB) *
	keyColumnCC 
:CC 
$strCC .
,CC. /
keyValueDD 
:DD 
$numDD 
)DD 
;DD 
}EE 	
}FF 
}GG ë
êC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250618104746_Withdrawal.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 

Withdrawal		 #
:		$ %
	Migration		& /
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
WithdrawalId  
=! "
table# (
.( )
Column) /
</ 0
int0 3
>3 4
(4 5
type5 9
:9 :
$str; @
,@ A
nullableB J
:J K
falseL Q
)Q R
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
WriterUserId  
=! "
table# (
.( )
Column) /
</ 0
Guid0 4
>4 5
(5 6
type6 :
:: ;
$str< N
,N O
nullableP X
:X Y
falseZ _
)_ `
,` a
SubtractedMythras %
=& '
table( -
.- .
Column. 4
<4 5
int5 8
>8 9
(9 :
type: >
:> ?
$str@ E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
AmountRealMoney #
=$ %
table& +
.+ ,
Column, 2
<2 3
decimal3 :
>: ;
(; <
type< @
:@ A
$strB Q
,Q R
nullableS [
:[ \
false] b
)b c
,c d
RequestedDate !
=" #
table$ )
.) *
Column* 0
<0 1
DateTime1 9
>9 :
(: ;
type; ?
:? @
$strA L
,L M
nullableN V
:V W
falseX ]
)] ^
,^ _
Status 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
WithdrawalId> J
)J K
;K L
} 
) 
; 
} 	
	protected!! 
override!! 
void!! 
Down!!  $
(!!$ %
MigrationBuilder!!% 5
migrationBuilder!!6 F
)!!F G
{"" 	
migrationBuilder## 
.## 
	DropTable## &
(##& '
name$$ 
:$$ 
$str$$ #
)$$# $
;$$$ %
}%% 	
}&& 
}'' ∆3
™C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250618050709_SuscriptionPlanNullableEnTransaction.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public 

partial 
class 0
$SuscriptionPlanNullableEnTransaction =
:> ?
	Migration@ I
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str H
,H I
table 
: 
$str %
)% &
;& '
migrationBuilder 
. 
DropForeignKey +
(+ ,
name 
: 
$str J
,J K
table 
: 
$str %
)% &
;& '
migrationBuilder 
. 
AlterColumn (
<( )
int) ,
>, -
(- .
name 
: 
$str )
,) *
table 
: 
$str %
,% &
type 
: 
$str 
, 
nullable 
: 
true 
, 

oldClrType 
: 
typeof "
(" #
int# &
)& '
,' (
oldType 
: 
$str 
) 
;  
migrationBuilder 
. 
AlterColumn (
<( )
int) ,
>, -
(- .
name 
: 
$str (
,( )
table 
: 
$str %
,% &
type   
:   
$str   
,   
nullable!! 
:!! 
true!! 
,!! 

oldClrType"" 
:"" 
typeof"" "
(""" #
int""# &
)""& '
,""' (
oldType## 
:## 
$str## 
)## 
;##  
migrationBuilder%% 
.%% 
AddForeignKey%% *
(%%* +
name&& 
:&& 
$str&& H
,&&H I
table'' 
:'' 
$str'' %
,''% &
column(( 
:(( 
$str(( *
,((* +
principalTable)) 
:)) 
$str))  1
,))1 2
principalColumn** 
:**  
$str**! 3
)**3 4
;**4 5
migrationBuilder,, 
.,, 
AddForeignKey,, *
(,,* +
name-- 
:-- 
$str-- J
,--J K
table.. 
:.. 
$str.. %
,..% &
column// 
:// 
$str// +
,//+ ,
principalTable00 
:00 
$str00  2
,002 3
principalColumn11 
:11  
$str11! 4
)114 5
;115 6
}22 	
	protected55 
override55 
void55 
Down55  $
(55$ %
MigrationBuilder55% 5
migrationBuilder556 F
)55F G
{66 	
migrationBuilder77 
.77 
DropForeignKey77 +
(77+ ,
name88 
:88 
$str88 H
,88H I
table99 
:99 
$str99 %
)99% &
;99& '
migrationBuilder;; 
.;; 
DropForeignKey;; +
(;;+ ,
name<< 
:<< 
$str<< J
,<<J K
table== 
:== 
$str== %
)==% &
;==& '
migrationBuilder?? 
.?? 
AlterColumn?? (
<??( )
int??) ,
>??, -
(??- .
name@@ 
:@@ 
$str@@ )
,@@) *
tableAA 
:AA 
$strAA %
,AA% &
typeBB 
:BB 
$strBB 
,BB 
nullableCC 
:CC 
falseCC 
,CC  
defaultValueDD 
:DD 
$numDD 
,DD  

oldClrTypeEE 
:EE 
typeofEE "
(EE" #
intEE# &
)EE& '
,EE' (
oldTypeFF 
:FF 
$strFF 
,FF 
oldNullableGG 
:GG 
trueGG !
)GG! "
;GG" #
migrationBuilderII 
.II 
AlterColumnII (
<II( )
intII) ,
>II, -
(II- .
nameJJ 
:JJ 
$strJJ (
,JJ( )
tableKK 
:KK 
$strKK %
,KK% &
typeLL 
:LL 
$strLL 
,LL 
nullableMM 
:MM 
falseMM 
,MM  
defaultValueNN 
:NN 
$numNN 
,NN  

oldClrTypeOO 
:OO 
typeofOO "
(OO" #
intOO# &
)OO& '
,OO' (
oldTypePP 
:PP 
$strPP 
,PP 
oldNullableQQ 
:QQ 
trueQQ !
)QQ! "
;QQ" #
migrationBuilderSS 
.SS 
AddForeignKeySS *
(SS* +
nameTT 
:TT 
$strTT H
,TTH I
tableUU 
:UU 
$strUU %
,UU% &
columnVV 
:VV 
$strVV *
,VV* +
principalTableWW 
:WW 
$strWW  1
,WW1 2
principalColumnXX 
:XX  
$strXX! 3
,XX3 4
onDeleteYY 
:YY 
ReferentialActionYY +
.YY+ ,
CascadeYY, 3
)YY3 4
;YY4 5
migrationBuilder[[ 
.[[ 
AddForeignKey[[ *
([[* +
name\\ 
:\\ 
$str\\ J
,\\J K
table]] 
:]] 
$str]] %
,]]% &
column^^ 
:^^ 
$str^^ +
,^^+ ,
principalTable__ 
:__ 
$str__  2
,__2 3
principalColumn`` 
:``  
$str``! 4
,``4 5
onDeleteaa 
:aa 
ReferentialActionaa +
.aa+ ,
Cascadeaa, 3
)aa3 4
;aa4 5
}bb 	
}cc 
}dd ‘
ìC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250618025416_InitialCreate.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 
InitialCreate		 &
:		' (
	Migration		) 2
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str %
,% &
columns 
: 
table 
=> !
new" %
{ 
MythosWalletId "
=# $
table% *
.* +
Column+ 1
<1 2
int2 5
>5 6
(6 7
type7 ;
:; <
$str= B
,B C
nullableD L
:L M
falseN S
)S T
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
UserId 
= 
table "
." #
Column# )
<) *
Guid* .
>. /
(/ 0
type0 4
:4 5
$str6 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
MythrasBalance "
=# $
table% *
.* +
Column+ 1
<1 2
int2 5
>5 6
(6 7
type7 ;
:; <
$str= B
,B C
nullableD L
:L M
falseN S
)S T
,T U
IsLocked 
= 
table $
.$ %
Column% +
<+ ,
bool, 0
>0 1
(1 2
type2 6
:6 7
$str8 =
,= >
nullable? G
:G H
falseI N
)N O
,O P
LastUpdated 
=  !
table" '
.' (
Column( .
<. /
DateTime/ 7
>7 8
(8 9
type9 =
:= >
$str? J
,J K
nullableL T
:T U
falseV [
)[ \
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 7
,7 8
x9 :
=>; =
x> ?
.? @
MythosWalletId@ N
)N O
;O P
} 
) 
; 
} 	
	protected   
override   
void   
Down    $
(  $ %
MigrationBuilder  % 5
migrationBuilder  6 F
)  F G
{!! 	
migrationBuilder"" 
."" 
	DropTable"" &
(""& '
name## 
:## 
$str## %
)##% &
;##& '
}$$ 	
}%% 
}&& Æ
£C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250614231108_AddEmailFieldForAccountEntity.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public 

partial 
class )
AddEmailFieldForAccountEntity 6
:7 8
	Migration9 B
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	AddColumn &
<& '
string' -
>- .
(. /
name 
: 
$str 
, 
table 
: 
$str !
,! "
type 
: 
$str %
,% &
nullable 
: 
false 
,  
defaultValue 
: 
$str  
)  !
;! "
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str 
, 
table 
: 
$str !
)! "
;" #
} 	
} 
} ˇ$
ùC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250520154411_AddRelationAccountPlans.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 #
AddRelationAccountPlans		 0
:		1 2
	Migration		3 <
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str /
,/ 0
columns 
: 
table 
=> !
new" %
{ 
	AccountId 
= 
table  %
.% &
Column& ,
<, -
Guid- 1
>1 2
(2 3
type3 7
:7 8
$str9 K
,K L
nullableM U
:U V
falseW \
)\ ]
,] ^
SuscriptionPlanId %
=& '
table( -
.- .
Column. 4
<4 5
int5 8
>8 9
(9 :
type: >
:> ?
$str@ E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
	StartDate 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
EndDate 
= 
table #
.# $
Column$ *
<* +
DateTime+ 3
>3 4
(4 5
type5 9
:9 :
$str; F
,F G
nullableH P
:P Q
falseR W
)W X
,X Y
Status 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% A
,A B
xC D
=>E G
newH K
{L M
xN O
.O P
	AccountIdP Y
,Y Z
x[ \
.\ ]
SuscriptionPlanId] n
}o p
)p q
;q r
table 
. 

ForeignKey $
($ %
name 
: 
$str M
,M N
column 
: 
x  !
=>" $
x% &
.& '
	AccountId' 0
,0 1
principalTable &
:& '
$str( 2
,2 3
principalColumn '
:' (
$str) -
,- .
onDelete    
:    !
ReferentialAction  " 3
.  3 4
Restrict  4 <
)  < =
;  = >
table!! 
.!! 

ForeignKey!! $
(!!$ %
name"" 
:"" 
$str"" ]
,""] ^
column## 
:## 
x##  !
=>##" $
x##% &
.##& '
SuscriptionPlanId##' 8
,##8 9
principalTable$$ &
:$$& '
$str$$( :
,$$: ;
principalColumn%% '
:%%' (
$str%%) <
,%%< =
onDelete&&  
:&&  !
ReferentialAction&&" 3
.&&3 4
Restrict&&4 <
)&&< =
;&&= >
}'' 
)'' 
;'' 
migrationBuilder)) 
.)) 
CreateIndex)) (
())( )
name** 
:** 
$str** D
,**D E
table++ 
:++ 
$str++ 0
,++0 1
column,, 
:,, 
$str,, +
),,+ ,
;,,, -
}-- 	
	protected00 
override00 
void00 
Down00  $
(00$ %
MigrationBuilder00% 5
migrationBuilder006 F
)00F G
{11 	
migrationBuilder22 
.22 
	DropTable22 &
(22& '
name33 
:33 
$str33 /
)33/ 0
;330 1
}44 	
}55 
}66 Á7
öC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250520153018_AddTransactionsTable.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		  
AddTransactionsTable		 -
:		. /
	Migration		0 9
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str $
,$ %
columns 
: 
table 
=> !
new" %
{ 
TransactionId !
=" #
table$ )
.) *
Column* 0
<0 1
int1 4
>4 5
(5 6
type6 :
:: ;
$str< A
,A B
nullableC K
:K L
falseM R
)R S
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
	AccountId 
= 
table  %
.% &
Column& ,
<, -
Guid- 1
>1 2
(2 3
type3 7
:7 8
$str9 K
,K L
nullableM U
:U V
falseW \
)\ ]
,] ^
SuscriptionPlanId %
=& '
table( -
.- .
Column. 4
<4 5
int5 8
>8 9
(9 :
type: >
:> ?
$str@ E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
MythrasPackageId $
=% &
table' ,
., -
Column- 3
<3 4
int4 7
>7 8
(8 9
type9 =
:= >
$str? D
,D E
nullableF N
:N O
falseP U
)U V
,V W
Type 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
AmountRealMoney #
=$ %
table& +
.+ ,
Column, 2
<2 3
string3 9
>9 :
(: ;
type; ?
:? @
$strA P
,P Q
nullableR Z
:Z [
false\ a
)a b
,b c
PaymentMethod !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
type9 =
:= >
$str? N
,N O
nullableP X
:X Y
falseZ _
)_ `
,` a
Status 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
,Y Z
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 6
,6 7
x8 9
=>: <
x= >
.> ?
TransactionId? L
)L M
;M N
table   
.   

ForeignKey   $
(  $ %
name!! 
:!! 
$str!! B
,!!B C
column"" 
:"" 
x""  !
=>""" $
x""% &
.""& '
	AccountId""' 0
,""0 1
principalTable## &
:##& '
$str##( 2
,##2 3
principalColumn$$ '
:$$' (
$str$$) -
,$$- .
onDelete%%  
:%%  !
ReferentialAction%%" 3
.%%3 4
Cascade%%4 ;
)%%; <
;%%< =
table&& 
.&& 

ForeignKey&& $
(&&$ %
name'' 
:'' 
$str'' P
,''P Q
column(( 
:(( 
x((  !
=>((" $
x((% &
.((& '
MythrasPackageId((' 7
,((7 8
principalTable)) &
:))& '
$str))( 9
,))9 :
principalColumn** '
:**' (
$str**) ;
,**; <
onDelete++  
:++  !
ReferentialAction++" 3
.++3 4
Cascade++4 ;
)++; <
;++< =
table,, 
.,, 

ForeignKey,, $
(,,$ %
name-- 
:-- 
$str-- R
,--R S
column.. 
:.. 
x..  !
=>.." $
x..% &
...& '
SuscriptionPlanId..' 8
,..8 9
principalTable// &
://& '
$str//( :
,//: ;
principalColumn00 '
:00' (
$str00) <
,00< =
onDelete11  
:11  !
ReferentialAction11" 3
.113 4
Cascade114 ;
)11; <
;11< =
}22 
)22 
;22 
migrationBuilder44 
.44 
CreateIndex44 (
(44( )
name55 
:55 
$str55 1
,551 2
table66 
:66 
$str66 %
,66% &
column77 
:77 
$str77 #
)77# $
;77$ %
migrationBuilder99 
.99 
CreateIndex99 (
(99( )
name:: 
::: 
$str:: 8
,::8 9
table;; 
:;; 
$str;; %
,;;% &
column<< 
:<< 
$str<< *
)<<* +
;<<+ ,
migrationBuilder>> 
.>> 
CreateIndex>> (
(>>( )
name?? 
:?? 
$str?? 9
,??9 :
table@@ 
:@@ 
$str@@ %
,@@% &
columnAA 
:AA 
$strAA +
)AA+ ,
;AA, -
}BB 	
	protectedEE 
overrideEE 
voidEE 
DownEE  $
(EE$ %
MigrationBuilderEE% 5
migrationBuilderEE6 F
)EEF G
{FF 	
migrationBuilderGG 
.GG 
	DropTableGG &
(GG& '
nameHH 
:HH 
$strHH $
)HH$ %
;HH% &
}II 	
}JJ 
}KK ü;
ôC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250520152139_AddPackagesAndPlans.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 
AddPackagesAndPlans		 ,
:		- .
	Migration		/ 8
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str '
,' (
columns 
: 
table 
=> !
new" %
{ 
MythrasPackageId $
=% &
table' ,
., -
Column- 3
<3 4
int4 7
>7 8
(8 9
type9 =
:= >
$str? D
,D E
nullableF N
:N O
falseP U
)U V
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
MythrasAmount !
=" #
table$ )
.) *
Column* 0
<0 1
int1 4
>4 5
(5 6
type6 :
:: ;
$str< A
,A B
nullableC K
:K L
falseM R
)R S
,S T
Price 
= 
table !
.! "
Column" (
<( )
decimal) 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
	precisionI R
:R S
$numT V
,V W
scaleX ]
:] ^
$num_ `
,` a
nullableb j
:j k
falsel q
)q r
,r s
IsActive 
= 
table $
.$ %
Column% +
<+ ,
bool, 0
>0 1
(1 2
type2 6
:6 7
$str8 =
,= >
nullable? G
:G H
falseI N
)N O
,O P
BonusMythras  
=! "
table# (
.( )
Column) /
</ 0
int0 3
>3 4
(4 5
type5 9
:9 :
$str; @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 9
,9 :
x; <
=>= ?
x@ A
.A B
MythrasPackageIdB R
)R S
;S T
} 
) 
; 
migrationBuilder   
.   
CreateTable   (
(  ( )
name!! 
:!! 
$str!! (
,!!( )
columns"" 
:"" 
table"" 
=>"" !
new""" %
{## 
SuscriptionPlanId$$ %
=$$& '
table$$( -
.$$- .
Column$$. 4
<$$4 5
int$$5 8
>$$8 9
($$9 :
type$$: >
:$$> ?
$str$$@ E
,$$E F
nullable$$G O
:$$O P
false$$Q V
)$$V W
.%% 

Annotation%% #
(%%# $
$str%%$ 8
,%%8 9
$str%%: @
)%%@ A
,%%A B
Name&& 
=&& 
table&&  
.&&  !
Column&&! '
<&&' (
string&&( .
>&&. /
(&&/ 0
type&&0 4
:&&4 5
$str&&6 E
,&&E F
nullable&&G O
:&&O P
false&&Q V
)&&V W
,&&W X
Price'' 
='' 
table'' !
.''! "
Column''" (
<''( )
decimal'') 0
>''0 1
(''1 2
type''2 6
:''6 7
$str''8 G
,''G H
	precision''I R
:''R S
$num''T V
,''V W
scale''X ]
:''] ^
$num''_ `
,''` a
nullable''b j
:''j k
false''l q
)''q r
,''r s
DurationDays((  
=((! "
table((# (
.((( )
Column(() /
<((/ 0
int((0 3
>((3 4
(((4 5
type((5 9
:((9 :
$str((; @
,((@ A
nullable((B J
:((J K
false((L Q
)((Q R
,((R S
MythrasMonthlyBonus)) '
=))( )
table))* /
.))/ 0
Column))0 6
<))6 7
int))7 :
>)): ;
()); <
type))< @
:))@ A
$str))B G
,))G H
nullable))I Q
:))Q R
false))S X
)))X Y
,))Y Z
ExtraBenefits** !
=**" #
table**$ )
.**) *
Column*** 0
<**0 1
string**1 7
>**7 8
(**8 9
type**9 =
:**= >
$str**? N
,**N O
nullable**P X
:**X Y
false**Z _
)**_ `
,**` a
IsActive++ 
=++ 
table++ $
.++$ %
Column++% +
<+++ ,
bool++, 0
>++0 1
(++1 2
type++2 6
:++6 7
$str++8 =
,++= >
nullable++? G
:++G H
false++I N
)++N O
,++O P
	CreatedAt,, 
=,, 
table,,  %
.,,% &
Column,,& ,
<,,, -
DateTime,,- 5
>,,5 6
(,,6 7
type,,7 ;
:,,; <
$str,,= H
,,,H I
nullable,,J R
:,,R S
false,,T Y
),,Y Z
}-- 
,-- 
constraints.. 
:.. 
table.. "
=>..# %
{// 
table00 
.00 

PrimaryKey00 $
(00$ %
$str00% :
,00: ;
x00< =
=>00> @
x00A B
.00B C
SuscriptionPlanId00C T
)00T U
;00U V
}11 
)11 
;11 
}22 	
	protected55 
override55 
void55 
Down55  $
(55$ %
MigrationBuilder55% 5
migrationBuilder556 F
)55F G
{66 	
migrationBuilder77 
.77 
	DropTable77 &
(77& '
name88 
:88 
$str88 '
)88' (
;88( )
migrationBuilder:: 
.:: 
	DropTable:: &
(::& '
name;; 
:;; 
$str;; (
);;( )
;;;) *
}<< 	
}== 
}>> ¡O
°C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250520150218_AddPurchasesAndTransactions.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 '
AddPurchasesAndTransactions		 4
:		5 6
	Migration		7 @
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str *
,* +
columns 
: 
table 
=> !
new" %
{ 
MythosTransactionId '
=( )
table* /
./ 0
Column0 6
<6 7
int7 :
>: ;
(; <
type< @
:@ A
$strB G
,G H
nullableI Q
:Q R
falseS X
)X Y
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Type 
= 
table  
.  !
Column! '
<' (
int( +
>+ ,
(, -
type- 1
:1 2
$str3 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K
Amount 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
type/ 3
:3 4
$str5 :
,: ;
nullable< D
:D E
falseF K
)K L
,L M
BalanceAfter  
=! "
table# (
.( )
Column) /
</ 0
int0 3
>3 4
(4 5
type5 9
:9 :
$str; @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
	AccountId 
= 
table  %
.% &
Column& ,
<, -
Guid- 1
>1 2
(2 3
type3 7
:7 8
$str9 K
,K L
nullableM U
:U V
falseW \
)\ ]
,] ^!
CounterpartyAccountId )
=* +
table, 1
.1 2
Column2 8
<8 9
Guid9 =
>= >
(> ?
type? C
:C D
$strE W
,W X
nullableY a
:a b
falsec h
)h i
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% <
,< =
x> ?
=>@ B
xC D
.D E
MythosTransactionIdE X
)X Y
;Y Z
table 
. 

ForeignKey $
($ %
name 
: 
$str H
,H I
column   
:   
x    !
=>  " $
x  % &
.  & '
	AccountId  ' 0
,  0 1
principalTable!! &
:!!& '
$str!!( 2
,!!2 3
principalColumn"" '
:""' (
$str"") -
,""- .
onDelete##  
:##  !
ReferentialAction##" 3
.##3 4
Restrict##4 <
)##< =
;##= >
table$$ 
.$$ 

ForeignKey$$ $
($$$ %
name%% 
:%% 
$str%% T
,%%T U
column&& 
:&& 
x&&  !
=>&&" $
x&&% &
.&&& '!
CounterpartyAccountId&&' <
,&&< =
principalTable'' &
:''& '
$str''( 2
,''2 3
principalColumn(( '
:((' (
$str(() -
,((- .
onDelete))  
:))  !
ReferentialAction))" 3
.))3 4
Restrict))4 <
)))< =
;))= >
}** 
)** 
;** 
migrationBuilder,, 
.,, 
CreateTable,, (
(,,( )
name-- 
:-- 
$str-- !
,--! "
columns.. 
:.. 
table.. 
=>.. !
new.." %
{// 

PurchaseId00 
=00  
table00! &
.00& '
Column00' -
<00- .
int00. 1
>001 2
(002 3
type003 7
:007 8
$str009 >
,00> ?
nullable00@ H
:00H I
false00J O
)00O P
.11 

Annotation11 #
(11# $
$str11$ 8
,118 9
$str11: @
)11@ A
,11A B
	ContentId22 
=22 
table22  %
.22% &
Column22& ,
<22, -
string22- 3
>223 4
(224 5
type225 9
:229 :
$str22; J
,22J K
nullable22L T
:22T U
false22V [
)22[ \
,22\ ]
MythrasPrice33  
=33! "
table33# (
.33( )
Column33) /
<33/ 0
int330 3
>333 4
(334 5
type335 9
:339 :
$str33; @
,33@ A
nullable33B J
:33J K
false33L Q
)33Q R
,33R S
PurchaseDate44  
=44! "
table44# (
.44( )
Column44) /
<44/ 0
DateTime440 8
>448 9
(449 :
type44: >
:44> ?
$str44@ K
,44K L
nullable44M U
:44U V
false44W \
)44\ ]
,44] ^
	AccountId55 
=55 
table55  %
.55% &
Column55& ,
<55, -
Guid55- 1
>551 2
(552 3
type553 7
:557 8
$str559 K
,55K L
nullable55M U
:55U V
false55W \
)55\ ]
,55] ^
MythosTransactionId66 '
=66( )
table66* /
.66/ 0
Column660 6
<666 7
int667 :
>66: ;
(66; <
type66< @
:66@ A
$str66B G
,66G H
nullable66I Q
:66Q R
false66S X
)66X Y
}77 
,77 
constraints88 
:88 
table88 "
=>88# %
{99 
table:: 
.:: 

PrimaryKey:: $
(::$ %
$str::% 3
,::3 4
x::5 6
=>::7 9
x::: ;
.::; <

PurchaseId::< F
)::F G
;::G H
table;; 
.;; 

ForeignKey;; $
(;;$ %
name<< 
:<< 
$str<< ?
,<<? @
column== 
:== 
x==  !
=>==" $
x==% &
.==& '
	AccountId==' 0
,==0 1
principalTable>> &
:>>& '
$str>>( 2
,>>2 3
principalColumn?? '
:??' (
$str??) -
,??- .
onDelete@@  
:@@  !
ReferentialAction@@" 3
.@@3 4
Cascade@@4 ;
)@@; <
;@@< =
tableAA 
.AA 

ForeignKeyAA $
(AA$ %
nameBB 
:BB 
$strBB S
,BBS T
columnCC 
:CC 
xCC  !
=>CC" $
xCC% &
.CC& '
MythosTransactionIdCC' :
,CC: ;
principalTableDD &
:DD& '
$strDD( <
,DD< =
principalColumnEE '
:EE' (
$strEE) >
,EE> ?
onDeleteFF  
:FF  !
ReferentialActionFF" 3
.FF3 4
CascadeFF4 ;
)FF; <
;FF< =
}GG 
)GG 
;GG 
migrationBuilderII 
.II 
CreateIndexII (
(II( )
nameJJ 
:JJ 
$strJJ 7
,JJ7 8
tableKK 
:KK 
$strKK +
,KK+ ,
columnLL 
:LL 
$strLL #
)LL# $
;LL$ %
migrationBuilderNN 
.NN 
CreateIndexNN (
(NN( )
nameOO 
:OO 
$strOO C
,OOC D
tablePP 
:PP 
$strPP +
,PP+ ,
columnQQ 
:QQ 
$strQQ /
)QQ/ 0
;QQ0 1
migrationBuilderSS 
.SS 
CreateIndexSS (
(SS( )
nameTT 
:TT 
$strTT .
,TT. /
tableUU 
:UU 
$strUU "
,UU" #
columnVV 
:VV 
$strVV #
)VV# $
;VV$ %
migrationBuilderXX 
.XX 
CreateIndexXX (
(XX( )
nameYY 
:YY 
$strYY 8
,YY8 9
tableZZ 
:ZZ 
$strZZ "
,ZZ" #
column[[ 
:[[ 
$str[[ -
)[[- .
;[[. /
}\\ 	
	protected__ 
override__ 
void__ 
Down__  $
(__$ %
MigrationBuilder__% 5
migrationBuilder__6 F
)__F G
{`` 	
migrationBuilderaa 
.aa 
	DropTableaa &
(aa& '
namebb 
:bb 
$strbb !
)bb! "
;bb" #
migrationBuilderdd 
.dd 
	DropTabledd &
(dd& '
nameee 
:ee 
$stree *
)ee* +
;ee+ ,
}ff 	
}gg 
}hh î$
îC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250519194101_AddPeopleTable.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 
AddPeopleTable		 '
:		( )
	Migration		* 3
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
PersonId 
= 
table $
.$ %
Column% +
<+ ,
Guid, 0
>0 1
(1 2
type2 6
:6 7
$str8 J
,J K
nullableL T
:T U
falseV [
)[ \
,\ ]
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
Surnames 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
	BirthDate 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
	Biography 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
type5 9
:9 :
$str; J
,J K
nullableL T
:T U
falseV [
)[ \
,\ ]
Country 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
	AccountId 
= 
table  %
.% &
Column& ,
<, -
Guid- 1
>1 2
(2 3
type3 7
:7 8
$str9 K
,K L
nullableM U
:U V
falseW \
)\ ]
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 0
,0 1
x2 3
=>4 6
x7 8
.8 9
PersonId9 A
)A B
;B C
table 
. 

ForeignKey $
($ %
name 
: 
$str <
,< =
column 
: 
x  !
=>" $
x% &
.& '
	AccountId' 0
,0 1
principalTable   &
:  & '
$str  ( 2
,  2 3
principalColumn!! '
:!!' (
$str!!) -
,!!- .
onDelete""  
:""  !
ReferentialAction""" 3
.""3 4
Cascade""4 ;
)""; <
;""< =
}## 
)## 
;## 
migrationBuilder%% 
.%% 
CreateIndex%% (
(%%( )
name&& 
:&& 
$str&& +
,&&+ ,
table'' 
:'' 
$str'' 
,''  
column(( 
:(( 
$str(( #
)((# $
;(($ %
})) 	
	protected,, 
override,, 
void,, 
Down,,  $
(,,$ %
MigrationBuilder,,% 5
migrationBuilder,,6 F
),,F G
{-- 	
migrationBuilder.. 
... 
	DropTable.. &
(..& '
name// 
:// 
$str// 
)// 
;//  
}00 	
}11 
}22 ‘
ñC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250507173807_AddRefreshTokens.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 
AddRefreshTokens		 )
:		* +
	Migration		, 5
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	AddColumn &
<& '
string' -
>- .
(. /
name 
: 
$str $
,$ %
table 
: 
$str !
,! "
type 
: 
$str %
,% &
nullable 
: 
true 
) 
;  
migrationBuilder 
. 
	AddColumn &
<& '
DateTime' /
>/ 0
(0 1
name 
: 
$str .
,. /
table 
: 
$str !
,! "
type 
: 
$str !
,! "
nullable 
: 
true 
) 
;  
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str $
,$ %
table   
:   
$str   !
)  ! "
;  " #
migrationBuilder"" 
."" 

DropColumn"" '
(""' (
name## 
:## 
$str## .
,##. /
table$$ 
:$$ 
$str$$ !
)$$! "
;$$" #
}%% 	
}&& 
}'' ê
îC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250507171619_AddAccountRole.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public 

partial 
class 
AddAccountRole '
:( )
	Migration* 3
{		 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
	AddColumn &
<& '
string' -
>- .
(. /
name 
: 
$str 
, 
table 
: 
$str !
,! "
type 
: 
$str %
,% &
nullable 
: 
false 
,  
defaultValue 
: 
$str  
)  !
;! "
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str 
, 
table 
: 
$str !
)! "
;" #
} 	
} 
} ”
çC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Migrations\20250507053343_Initial.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Migrations  *
{ 
public		 

partial		 
class		 
Initial		  
:		! "
	Migration		# ,
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
Username 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
PasswordHash  
=! "
table# (
.( )
Column) /
</ 0
string0 6
>6 7
(7 8
type8 <
:< =
$str> M
,M N
nullableO W
:W X
falseY ^
)^ _
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 2
,2 3
x4 5
=>6 8
x9 :
.: ;
Id; =
)= >
;> ?
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name   
:   
$str    
)    !
;  ! "
}!! 	
}"" 
}## Ë
ëC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Middleware\ExceptionHandlerMiddleware.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Middleware  *
;* +
public 
class &
ExceptionHandlerMiddleware '
(' (
RequestDelegate( 7
_next8 =
,= >
ILogger? F
<F G&
ExceptionHandlerMiddlewareG a
>a b
_loggerc j
)j k
{ 
public 

async 
Task 
Invoke 
( 
HttpContext (
context) 0
)0 1
{		 
try

 
{ 	
await 
_next 
( 
context 
)  
;  !
} 	
catch 
( 
BusinessException  
ex! #
)# $
{ 	
context 
. 
Response 
. 

StatusCode '
=( )
$num* -
;- .
await 
context 
. 
Response "
." #
WriteAsJsonAsync# 3
(3 4
new4 7
{8 9
error: ?
=@ A
exB D
.D E
MessageE L
}M N
)N O
;O P
} 	
catch 
( 
	Exception 
ex 
) 
{ 	
_logger 
. 
LogError 
( 
ex 
,  
$str! 2
)2 3
;3 4
context 
. 
Response 
. 

StatusCode '
=( )
$num* -
;- .
await 
context 
. 
Response "
." #
WriteAsJsonAsync# 3
(3 4
new4 7
{8 9
error: ?
=@ A
$strB T
}U V
)V W
;W X
} 	
} 
} È
àC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Exceptions\BusinessException.cs
	namespace 	!
mythos_backend_dotnet
 
.  

Exceptions  *
;* +
public 
class 
BusinessException 
:  
	Exception! *
{ 
public 

BusinessException 
( 
string #
message$ +
)+ ,
:- .
base/ 3
(3 4
message4 ;
); <
{= >
}? @
} Ç
áC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Enums\MythosTransactionType.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Enums  %
{ 
public 

enum !
MythosTransactionType %
{ 
DonationSent 
, 
DonationReceived 
, 
PurchaseMade 
, 
PurchaseReceived 
}		 
}

 Á

C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\Withdrawal.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 

Withdrawal 
{ 
public 
int 
WithdrawalId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid 
WriterUserId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
SubtractedMythras $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
decimal 
AmountRealMoney &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public		 
DateTime		 
RequestedDate		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
string

 
Status

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
=

+ ,
string

- 3
.

3 4
Empty

4 9
;

9 :
} 
} ˆ
ÄC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\Transaction.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
Transaction 
{ 
public 
int 
TransactionId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
Guid 
	AccountId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Account 
? 
Account 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
SuscriptionPlanId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
SuscriptionPlan		 
?		 
SuscriptionPlan		  /
{		0 1
get		2 5
;		5 6
set		7 :
;		: ;
}		< =
public

 
int

 
?

 
MythrasPackageId

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
MythrasPackage 
? 
MythrasPackage -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
AmountRealMoney %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
string6 <
.< =
Empty= B
;B C
public 
string 
PaymentMethod #
{$ %
get& )
;) *
set+ .
;. /
}0 1
=2 3
string4 :
.: ;
Empty; @
;@ A
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ˝
ÑC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\SuscriptionPlan.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
SuscriptionPlan  
{ 
public 
int 
SuscriptionPlanId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
[

 	
	Precision

	 
(

 
$num

 
,

 
$num

 
)

 
]

 
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
DurationDays 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
MythrasMonthlyBonus &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
ExtraBenefits #
{$ %
get& )
;) *
set+ .
;. /
}0 1
=2 3
string4 :
.: ;
Empty; @
;@ A
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ≈
}C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\Purchase.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
Purchase 
{ 
public 
int 

PurchaseId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	ContentId 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
public 
int 
MythrasPrice 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
PurchaseDate $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
Guid		 
	AccountId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
Account

 
?

 
Account

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
int 
MythosTransactionId &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
MythosTransaction  
?  !
MythosTransaction" 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
} à
{C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\Person.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
Person 
{ 
public 
Guid 
PersonId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public		 
string		 
Surnames		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
=		- .
string		/ 5
.		5 6
Empty		6 ;
;		; <
public

 
DateTime

 
	BirthDate

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
	Biography 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 
Guid 
	AccountId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Account 
? 
Account 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ˇ
ÉC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\MythrasPackage.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
MythrasPackage 
{ 
public 
int 
MythrasPackageId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public		 
int		 
MythrasAmount		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
[ 	
	Precision	 
( 
$num 
, 
$num 
) 
] 
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
BonusMythras 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ¶
ÜC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\MythosTransaction.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
MythosTransaction "
{ 
public 
int 
MythosTransactionId &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public !
MythosTransactionType $
Type% )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public		 
int		 
Amount		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
int

 
BalanceAfter

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Guid 
	AccountId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Account 
? 
Account 
{  !
get" %
;% &
set' *
;* +
}, -
public 
Guid !
CounterpartyAccountId )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Account 
? 
CounterpartyAccount +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} ª
ãC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\AccountSuscriptionPlan.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class "
AccountSuscriptionPlan '
{ 
public 
Guid 
	AccountId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Account 
? 
Account 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
SuscriptionPlanId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
SuscriptionPlan 
? 
SuscriptionPlan  /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public		 
DateTime		 
	StartDate		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
DateTime

 
EndDate

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
} 
} ä
|C:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\Account.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
Account 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
PasswordHash "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
string3 9
.9 :
Empty: ?
;? @
public		 
string		 
Role		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public

 
string

 
?

 
RefreshToken

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
DateTime 
? "
RefreshTokenExpiryTime /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} Î
ÅC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Entities\MythosWallet.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Entities  (
{ 
public 

class 
MythosWallet 
{ 
public 
int 
MythosWalletId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Guid 
UserId 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
MythrasBalance !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsLocked 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
DateTime		 
LastUpdated		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
}

 
} €_
ÄC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Data\MythosDbContext.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Data  $
{ 
public 

class 
MythosDbContext  
(  !
DbContextOptions! 1
<1 2
MythosDbContext2 A
>A B
optionsC J
)J K
:L M
	DbContextN W
(W X
optionsX _
)_ `
{ 
public 
DbSet 
< 
Account 
> 
Accounts &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public		 
DbSet		 
<		 
Person		 
>		 
People		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
public

 
DbSet

 
<

 
MythosTransaction

 &
>

& '
MythosTransactions

( :
{

; <
get

= @
;

@ A
set

B E
;

E F
}

G H
public 
DbSet 
< 
Purchase 
> 
	Purchases (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DbSet 
< 
SuscriptionPlan $
>$ %
SuscriptionPlans& 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
DbSet 
< 
MythrasPackage #
># $
MythrasPackages% 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
DbSet 
< 
Transaction  
>  !
Transactions" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
DbSet 
< "
AccountSuscriptionPlan +
>+ ,#
AccountSuscriptionPlans- D
{E F
getG J
;J K
setL O
;O P
}Q R
public 
DbSet 
< 
MythosWallet !
>! "
MythosWallets# 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
DbSet 
< 

Withdrawal 
>  
Withdrawals! ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
MythosTransaction  1
>1 2
(2 3
)3 4
. 
HasOne 
( 
mt 
=> 
mt  
.  !
Account! (
)( )
. 
WithMany 
( 
) 
. 
HasForeignKey 
( 
mt !
=>" $
mt% '
.' (
	AccountId( 1
)1 2
. 
OnDelete 
( 
DeleteBehavior (
.( )
Restrict) 1
)1 2
;2 3
modelBuilder 
. 
Entity 
<  
MythosTransaction  1
>1 2
(2 3
)3 4
. 
HasOne 
( 
mt 
=> 
mt  
.  !
CounterpartyAccount! 4
)4 5
. 
WithMany 
( 
) 
. 
HasForeignKey 
( 
mt !
=>" $
mt% '
.' (!
CounterpartyAccountId( =
)= >
.   
OnDelete   
(   
DeleteBehavior   (
.  ( )
Restrict  ) 1
)  1 2
;  2 3
modelBuilder"" 
."" 
Entity"" 
<""  "
AccountSuscriptionPlan""  6
>""6 7
(""7 8
)""8 9
.## 
HasKey## 
(## 
usp## 
=>## 
new## "
{### $
usp##% (
.##( )
	AccountId##) 2
,##2 3
usp##4 7
.##7 8
SuscriptionPlanId##8 I
}##J K
)##K L
;##L M
modelBuilder%% 
.%% 
Entity%% 
<%%  "
AccountSuscriptionPlan%%  6
>%%6 7
(%%7 8
)%%8 9
.&& 
HasOne&& 
(&& 
usp&& 
=>&& 
usp&& "
.&&" #
Account&&# *
)&&* +
.'' 
WithMany'' 
('' 
)'' 
.(( 
HasForeignKey(( 
((( 
usp(( "
=>((# %
usp((& )
.(() *
	AccountId((* 3
)((3 4
.)) 
OnDelete)) 
()) 
DeleteBehavior)) (
.))( )
Restrict))) 1
)))1 2
;))2 3
modelBuilder++ 
.++ 
Entity++ 
<++  "
AccountSuscriptionPlan++  6
>++6 7
(++7 8
)++8 9
.,, 
HasOne,, 
(,, 
usp,, 
=>,, 
usp,, "
.,," #
SuscriptionPlan,,# 2
),,2 3
.-- 
WithMany-- 
(-- 
)-- 
... 
HasForeignKey.. 
(.. 
usp.. "
=>..# %
usp..& )
...) *
SuscriptionPlanId..* ;
)..; <
.// 
OnDelete// 
(// 
DeleteBehavior// (
.//( )
Restrict//) 1
)//1 2
;//2 3
modelBuilder33 
.33 
Entity33 
<33  
SuscriptionPlan33  /
>33/ 0
(330 1
)331 2
.332 3
HasData333 :
(33: ;
new44 
SuscriptionPlan44 #
{55 
SuscriptionPlanId66 %
=66& '
$num66( )
,66) *
Name77 
=77 
$str77 (
,77( )
Price88 
=88 
$num88 "
,88" #
DurationDays99  
=99! "
$num99# %
,99% &
MythrasMonthlyBonus:: '
=::( )
$num::* -
,::- .
ExtraBenefits;; !
=;;" #
$str;;$ 8
,;;8 9
IsActive<< 
=<< 
true<< #
,<<# $
	CreatedAt== 
=== 
new==  #
DateTime==$ ,
(==, -
$num==- 1
,==1 2
$num==3 4
,==4 5
$num==6 8
,==8 9
$num==: ;
,==; <
$num=== >
,==> ?
$num==@ A
,==A B
DateTimeKind==C O
.==O P
Utc==P S
)==S T
}>> 
,>> 
new?? 
SuscriptionPlan?? #
{@@ 
SuscriptionPlanIdAA %
=AA& '
$numAA( )
,AA) *
NameBB 
=BB 
$strBB *
,BB* +
PriceCC 
=CC 
$numCC "
,CC" #
DurationDaysDD  
=DD! "
$numDD# %
,DD% &
MythrasMonthlyBonusEE '
=EE( )
$numEE* -
,EE- .
ExtraBenefitsFF !
=FF" #
$strFF$ 8
,FF8 9
IsActiveGG 
=GG 
trueGG #
,GG# $
	CreatedAtHH 
=HH 
newHH  #
DateTimeHH$ ,
(HH, -
$numHH- 1
,HH1 2
$numHH3 4
,HH4 5
$numHH6 8
,HH8 9
$numHH: ;
,HH; <
$numHH= >
,HH> ?
$numHH@ A
,HHA B
DateTimeKindHHC O
.HHO P
UtcHHP S
)HHS T
}II 
,II 
newJJ 
SuscriptionPlanJJ #
{KK 
SuscriptionPlanIdLL %
=LL& '
$numLL( )
,LL) *
NameMM 
=MM 
$strMM )
,MM) *
PriceNN 
=NN 
$numNN #
,NN# $
DurationDaysOO  
=OO! "
$numOO# %
,OO% &
MythrasMonthlyBonusPP '
=PP( )
$numPP* -
,PP- .
ExtraBenefitsQQ !
=QQ" #
$strQQ$ 4
,QQ4 5
IsActiveRR 
=RR 
trueRR #
,RR# $
	CreatedAtSS 
=SS 
newSS  #
DateTimeSS$ ,
(SS, -
$numSS- 1
,SS1 2
$numSS3 4
,SS4 5
$numSS6 8
,SS8 9
$numSS: ;
,SS; <
$numSS= >
,SS> ?
$numSS@ A
,SSA B
DateTimeKindSSC O
.SSO P
UtcSSP S
)SSS T
}TT 
)UU 
;UU 
modelBuilderXX 
.XX 
EntityXX 
<XX  
MythrasPackageXX  .
>XX. /
(XX/ 0
)XX0 1
.XX1 2
HasDataXX2 9
(XX9 :
newYY 
MythrasPackageYY "
{ZZ 
MythrasPackageId[[ $
=[[% &
$num[[' (
,[[( )
Name\\ 
=\\ 
$str\\ *
,\\* +
MythrasAmount]] !
=]]" #
$num]]$ '
,]]' (
Price^^ 
=^^ 
$num^^ "
,^^" #
BonusMythras__  
=__! "
$num__# $
,__$ %
IsActive`` 
=`` 
true`` #
,``# $
	CreatedAtaa 
=aa 
newaa  #
DateTimeaa$ ,
(aa, -
$numaa- 1
,aa1 2
$numaa3 4
,aa4 5
$numaa6 8
,aa8 9
$numaa: ;
,aa; <
$numaa= >
,aa> ?
$numaa@ A
,aaA B
DateTimeKindaaC O
.aaO P
UtcaaP S
)aaS T
}bb 
,bb 
newcc 
MythrasPackagecc "
{dd 
MythrasPackageIdee $
=ee% &
$numee' (
,ee( )
Nameff 
=ff 
$strff ,
,ff, -
MythrasAmountgg !
=gg" #
$numgg$ '
,gg' (
Pricehh 
=hh 
$numhh #
,hh# $
BonusMythrasii  
=ii! "
$numii# %
,ii% &
IsActivejj 
=jj 
truejj #
,jj# $
	CreatedAtkk 
=kk 
newkk  #
DateTimekk$ ,
(kk, -
$numkk- 1
,kk1 2
$numkk3 4
,kk4 5
$numkk6 8
,kk8 9
$numkk: ;
,kk; <
$numkk= >
,kk> ?
$numkk@ A
,kkA B
DateTimeKindkkC O
.kkO P
UtckkP S
)kkS T
}ll 
,ll 
newmm 
MythrasPackagemm "
{nn 
MythrasPackageIdoo $
=oo% &
$numoo' (
,oo( )
Namepp 
=pp 
$strpp +
,pp+ ,
MythrasAmountqq !
=qq" #
$numqq$ '
,qq' (
Pricerr 
=rr 
$numrr #
,rr# $
BonusMythrasss  
=ss! "
$numss# &
,ss& '
IsActivett 
=tt 
truett #
,tt# $
	CreatedAtuu 
=uu 
newuu  #
DateTimeuu$ ,
(uu, -
$numuu- 1
,uu1 2
$numuu3 4
,uu4 5
$numuu6 8
,uu8 9
$numuu: ;
,uu; <
$numuu= >
,uu> ?
$numuu@ A
,uuA B
DateTimeKinduuC O
.uuO P
UtcuuP S
)uuS T
}vv 
)ww 
;ww 
baseyy 
.yy 
OnModelCreatingyy  
(yy  !
modelBuilderyy! -
)yy- .
;yy. /
}zz 	
}{{ 
}|| »
åC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\WithdrawalController.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Controllers  +
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class  
WithdrawalController %
(% &
IWithdrawalService& 8
withdrawalService9 J
)J K
:L M
ControllerBaseN \
{ 
[ 	
HttpPost	 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str #
)# $
]$ %
public 
async 
Task 
< 
IActionResult '
>' (
RequestWithdrawal) :
(: ;
[; <
FromBody< D
]D E&
CreateWithdrawalRequestDtoF `
dtoa d
)d e
{ 	
var 
accountIdClaim 
=  
User! %
.% &
Claims& ,
., -
FirstOrDefault- ;
(; <
c< =
=>> @
cA B
.B C
TypeC G
==H J
$strK V
)V W
;W X
if 
( 
accountIdClaim 
== !
null" &
)& '
return 
Unauthorized #
(# $
$str$ F
)F G
;G H
var 
userId 
= 
Guid 
. 
Parse #
(# $
accountIdClaim$ 2
.2 3
Value3 8
)8 9
;9 :
var 
response 
= 
await  
withdrawalService! 2
.2 3"
RequestWithdrawalAsync3 I
(I J
userIdJ P
,P Q
dtoR U
)U V
;V W
if 
( 
response 
. 
Status 
==  "
$str# -
)- .
return 
Ok 
( 
response "
)" #
;# $
return 

BadRequest 
( 
response &
)& '
;' (
} 	
} 
} ùD
ëC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\SuscriptionPlanController.cs
	namespace		 	!
mythos_backend_dotnet		
 
.		  
Controllers		  +
{

 
[ 
Route 

(
 
$str #
)# $
]$ %
[ 
ApiController 
] 
public 

class %
SuscriptionPlanController *
(* + 
ISubscriptionService+ ?
subscriptionService@ S
,S T
MythosDbContextU d
_contexte m
)m n
:o p
ControllerBaseq 
{ 
[ 	
HttpGet	 
] 
[ 	
AllowAnonymous	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
SuscriptionPlan, ;
>; <
>< =
>= >
GetAll? E
(E F
)F G
{ 	
var 
plans 
= 
await 
_context &
.& '
SuscriptionPlans' 7
.7 8
Where8 =
(= >
p> ?
=>@ B
pC D
.D E
IsActiveE M
)M N
.N O
ToListAsyncO Z
<Z [
SuscriptionPlan[ j
>j k
(k l
)l m
;m n
return 
Ok 
( 
plans 
) 
; 
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Create) /
(/ 0
[0 1
FromBody1 9
]9 :
SuscriptionPlan; J
planK O
)O P
{ 	
plan 
. 
	CreatedAt 
= 
DateTime %
.% &
UtcNow& ,
;, -
_context 
. 
SuscriptionPlans %
.% &
Add& )
() *
plan* .
). /
;/ 0
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
CreatedAtAction "
(" #
nameof# )
() *
GetById* 1
)1 2
,2 3
new4 7
{8 9
id: <
== >
plan? C
.C D
SuscriptionPlanIdD U
}V W
,W X
planY ]
)] ^
;^ _
}   	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
SuscriptionPlan##' 6
>##6 7
>##7 8
GetById##9 @
(##@ A
int##A D
id##E G
)##G H
{$$ 	
var%% 
plan%% 
=%% 
await%% 
_context%% %
.%%% &
SuscriptionPlans%%& 6
.%%6 7
	FindAsync%%7 @
(%%@ A
id%%A C
)%%C D
;%%D E
if&& 
(&& 
plan&& 
==&& 
null&& 
)&& 
return&& $
NotFound&&% -
(&&- .
)&&. /
;&&/ 0
return'' 
Ok'' 
('' 
plan'' 
)'' 
;'' 
}(( 	
[** 	
HttpPut**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
Update++) /
(++/ 0
int++0 3
id++4 6
,++6 7
[++8 9
FromBody++9 A
]++A B
SuscriptionPlan++C R
model++S X
)++X Y
{,, 	
if-- 
(-- 
id-- 
!=-- 
model-- 
.-- 
SuscriptionPlanId-- -
)--- .
return--/ 5

BadRequest--6 @
(--@ A
)--A B
;--B C
var// 
plan// 
=// 
await// 
_context// %
.//% &
SuscriptionPlans//& 6
.//6 7
	FindAsync//7 @
(//@ A
id//A C
)//C D
;//D E
if00 
(00 
plan00 
==00 
null00 
)00 
return00 $
NotFound00% -
(00- .
)00. /
;00/ 0
plan22 
.22 
Name22 
=22 
model22 
.22 
Name22 "
;22" #
plan33 
.33 
Price33 
=33 
model33 
.33 
Price33 $
;33$ %
plan44 
.44 
DurationDays44 
=44 
model44  %
.44% &
DurationDays44& 2
;442 3
plan55 
.55 
MythrasMonthlyBonus55 $
=55% &
model55' ,
.55, -
MythrasMonthlyBonus55- @
;55@ A
plan66 
.66 
ExtraBenefits66 
=66  
model66! &
.66& '
ExtraBenefits66' 4
;664 5
plan77 
.77 
IsActive77 
=77 
model77 !
.77! "
IsActive77" *
;77* +
await99 
_context99 
.99 
SaveChangesAsync99 +
(99+ ,
)99, -
;99- .
return:: 
	NoContent:: 
(:: 
):: 
;:: 
};; 	
[== 	

HttpDelete==	 
(== 
$str== 
)== 
]== 
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
Delete>>) /
(>>/ 0
int>>0 3
id>>4 6
)>>6 7
{?? 	
var@@ 
plan@@ 
=@@ 
await@@ 
_context@@ %
.@@% &
SuscriptionPlans@@& 6
.@@6 7
	FindAsync@@7 @
(@@@ A
id@@A C
)@@C D
;@@D E
ifAA 
(AA 
planAA 
==AA 
nullAA 
)AA 
returnAA $
NotFoundAA% -
(AA- .
)AA. /
;AA/ 0
_contextCC 
.CC 
SuscriptionPlansCC %
.CC% &
RemoveCC& ,
(CC, -
planCC- 1
)CC1 2
;CC2 3
awaitDD 
_contextDD 
.DD 
SaveChangesAsyncDD +
(DD+ ,
)DD, -
;DD- .
returnFF 
	NoContentFF 
(FF 
)FF 
;FF 
}GG 	
[II 	
HttpPostII	 
(II 
$strII 
)II 
]II 
[JJ 	
	AuthorizeJJ	 
]JJ 
publicKK 
asyncKK 
TaskKK 
<KK 
ActionResultKK &
>KK& '
	SubscribeKK( 1
(KK1 2
[KK2 3
FromBodyKK3 ;
]KK; <
SubscribeDtoKK= I
modelKKJ O
)KKO P
{LL 	
varMM 
userIdClaimMM 
=MM 
UserMM "
.MM" #
ClaimsMM# )
.MM) *
FirstOrDefaultMM* 8
(MM8 9
cMM9 :
=>MM; =
cMM> ?
.MM? @
TypeMM@ D
==MME G
$strMMH S
)MMS T
;MMT U
ifOO 
(OO 
userIdClaimOO 
isOO 
nullOO #
)OO# $
returnPP 
ForbidPP 
(PP 
)PP 
;PP  
ifRR 
(RR 
!RR 
GuidRR 
.RR 
TryParseRR 
(RR 
userIdClaimRR *
.RR* +
ValueRR+ 0
,RR0 1
outRR2 5
GuidRR6 :
userIdRR; A
)RRA B
)RRB C
returnSS 
UnauthorizedSS #
(SS# $
)SS$ %
;SS% &
varUU 
resultUU 
=UU 
awaitUU 
subscriptionServiceUU 2
.UU2 3 
SubscribeToPlanAsyncUU3 G
(UUG H
userIdUUH N
,UUN O
modelUUP U
.UUU V
PlanIdUUV \
)UU\ ]
;UU] ^
returnVV 
OkVV 
(VV 
resultVV 
)VV 
;VV 
}WW 	
}XX 
}YY òC
äC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\PurchaseController.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Controllers  +
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
	Authorize 
] 
public 

class 
PurchaseController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
MythosDbContext (
_context) 1
;1 2
private 
readonly 
IPurchaseService )
_purchaseService* :
;: ;
public 
PurchaseController !
(! "
MythosDbContext" 1
context2 9
,9 :
IPurchaseService; K
purchaseServiceL [
)[ \
{ 	
_context 
= 
context 
; 
_purchaseService 
= 
purchaseService .
;. /
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
Purchase, 4
>4 5
>5 6
>6 7
GetUserPurchases8 H
(H I
)I J
{ 	
var 
userId 
= 
Guid 
. 
Parse #
(# $
User$ (
.( )
FindFirstValue) 7
(7 8

ClaimTypes8 B
.B C
NameIdentifierC Q
)Q R
)R S
;S T
var!! 
	purchases!! 
=!! 
await!! !
_context!!" *
.!!* +
	Purchases!!+ 4
."" 
Where"" 
("" 
p"" 
=>"" 
p"" 
."" 
	AccountId"" '
==""( *
userId""+ 1
)""1 2
.## 
OrderByDescending## "
(##" #
p### $
=>##% '
p##( )
.##) *
PurchaseDate##* 6
)##6 7
.$$ 
ToListAsync$$ 
($$ 
)$$ 
;$$ 
return&& 
Ok&& 
(&& 
	purchases&& 
)&&  
;&&  !
}'' 	
[** 	
HttpPost**	 
]** 
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
CreatePurchase++) 7
(++7 8
[++8 9
FromBody++9 A
]++A B
CreatePurchaseDto++C T
dto++U X
)++X Y
{,, 	
var-- 
userId-- 
=-- 
Guid-- 
.-- 
Parse-- #
(--# $
User--$ (
.--( )
FindFirstValue--) 7
(--7 8

ClaimTypes--8 B
.--B C
NameIdentifier--C Q
)--Q R
)--R S
;--S T
var11 
purchase11 
=11 
new11 
Purchase11 '
{22 
	ContentId33 
=33 
dto33 
.33  
	ContentId33  )
,33) *
MythrasPrice44 
=44 
dto44 "
.44" #
MythrasPrice44# /
,44/ 0
PurchaseDate55 
=55 
DateTime55 '
.55' (
UtcNow55( .
,55. /
	AccountId66 
=66 
userId66 "
,66" #
MythosTransactionId77 #
=77$ %
dto77& )
.77) *
MythosTransactionId77* =
}88 
;88 
_context:: 
.:: 
	Purchases:: 
.:: 
Add:: "
(::" #
purchase::# +
)::+ ,
;::, -
await;; 
_context;; 
.;; 
SaveChangesAsync;; +
(;;+ ,
);;, -
;;;- .
return== 
CreatedAtAction== "
(==" #
nameof==# )
(==) *
GetUserPurchases==* :
)==: ;
,==; <
new=== @
{==A B
id==C E
===F G
purchase==H P
.==P Q

PurchaseId==Q [
}==\ ]
,==] ^
purchase==_ g
)==g h
;==h i
}>> 	
[@@ 	
HttpGet@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
[AA 	
	AuthorizeAA	 
]AA 
publicBB 
asyncBB 
TaskBB 
<BB 
IActionResultBB '
>BB' ("
GetPurchasedContentIdsBB) ?
(BB? @
)BB@ A
{CC 	
varDD 
accountIdClaimDD 
=DD  
UserDD! %
.DD% &
ClaimsDD& ,
.DD, -
FirstOrDefaultDD- ;
(DD; <
cDD< =
=>DD> @
cDDA B
.DDB C
TypeDDC G
==DDH J
$strDDK V
)DDV W
;DDW X
ifEE 
(EE 
accountIdClaimEE 
isEE !
nullEE" &
)EE& '
returnFF 
UnauthorizedFF #
(FF# $
$strFF$ K
)FFK L
;FFL M
ifHH 
(HH 
!HH 
GuidHH 
.HH 
TryParseHH 
(HH 
accountIdClaimHH -
.HH- .
ValueHH. 3
,HH3 4
outHH5 8
varHH9 <
	accountIdHH= F
)HHF G
)HHG H
returnII 

BadRequestII !
(II! "
$strII" A
)IIA B
;IIB C
varKK 

contentIdsKK 
=KK 
awaitKK "
_purchaseServiceKK# 3
.KK3 4'
GetPurchasedContentIdsAsyncKK4 O
(KKO P
	accountIdKKP Y
)KKY Z
;KKZ [
returnLL 
OkLL 
(LL 

contentIdsLL  
)LL  !
;LL! "
}MM 	
[OO 	
HttpPostOO	 
(OO 
$strOO 
)OO 
]OO 
[PP 	
	AuthorizePP	 
]PP 
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (

BuyChapterQQ) 3
(QQ3 4
[QQ4 5
FromBodyQQ5 =
]QQ= >
PurchaseRequestDtoQQ? Q
requestQQR Y
)QQY Z
{RR 	
varTT 
userIdClaimTT 
=TT 
UserTT "
.TT" #
ClaimsTT# )
.TT) *
FirstOrDefaultTT* 8
(TT8 9
cTT9 :
=>TT; =
cTT> ?
.TT? @
TypeTT@ D
==TTE G
$strTTH S
)TTS T
;TTT U
ifUU 
(UU 
userIdClaimUU 
==UU 
nullUU #
)UU# $
returnUU% +
UnauthorizedUU, 8
(UU8 9
$strUU9 T
)UUT U
;UUU V
ifWW 
(WW 
!WW 
GuidWW 
.WW 
TryParseWW 
(WW 
userIdClaimWW *
.WW* +
ValueWW+ 0
,WW0 1
outWW2 5
varWW6 9
userIdWW: @
)WW@ A
)WWA B
returnXX 
UnauthorizedXX #
(XX# $
$strXX$ <
)XX< =
;XX= >
varZZ 
(ZZ 
successZZ 
,ZZ 
messageZZ !
,ZZ! "

newBalanceZZ# -
)ZZ- .
=ZZ/ 0
awaitZZ1 6
_purchaseServiceZZ7 G
.ZZG H 
PurchaseContentAsyncZZH \
(ZZ\ ]
userIdZZ] c
,ZZc d
requestZZe l
.ZZl m
	ContentIdZZm v
,ZZv w
requestZZx 
.	ZZ Ä
Price
ZZÄ Ö
)
ZZÖ Ü
;
ZZÜ á
if\\ 
(\\ 
!\\ 
success\\ 
)\\ 
return]] 

BadRequest]] !
(]]! "
new]]" %
{]]& '
success]]( /
=]]0 1
false]]2 7
,]]7 8
message]]9 @
,]]@ A

newBalance]]B L
}]]M N
)]]N O
;]]O P
return__ 
Ok__ 
(__ 
new__ 
{__ 
success__ #
=__$ %
true__& *
,__* +
message__, 3
,__3 4

newBalance__5 ?
}__@ A
)__A B
;__B C
}`` 	
}aa 
}bb ∏
ëC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\MythrasPurchaseController.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Controllers  +
{ 
[		 
Route		 

(		
 
$str		 !
)		! "
]		" #
[

 
ApiController

 
]

 
public 

class %
MythrasPurchaseController *
(* +#
IMythrasPurchaseService+ B"
mythrasPurchaseServiceC Y
)Y Z
:[ \
ControllerBase] k
{ 
[ 	
HttpPost	 
] 
[ 	
	Authorize	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
PurchaseMythras) 8
(8 9
[9 :
FromBody: B
]B C%
PurchaseMythrasRequestDtoD ]
dto^ a
)a b
{ 	
var 
accountIdClaim 
=  
User! %
.% &
Claims& ,
., -
FirstOrDefault- ;
(; <
c< =
=>> @
cA B
.B C
TypeC G
==H J
$strK V
)V W
;W X
if 
( 
accountIdClaim 
== !
null" &
)& '
return 
Unauthorized #
(# $
$str$ F
)F G
;G H
var 
userId 
= 
Guid 
. 
Parse #
(# $
accountIdClaim$ 2
.2 3
Value3 8
)8 9
;9 :
var 
( 
success 
, 
message !
,! "
response# +
)+ ,
=- .
await/ 4"
mythrasPurchaseService5 K
.K L 
PurchaseMythrasAsyncL `
(` a
userIda g
,g h
dtoi l
)l m
;m n
if 
( 
! 
success 
) 
return 

BadRequest !
(! "
message" )
)) *
;* +
return 
Ok 
( 
response 
) 
;  
} 	
} 
} °:
êC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\MythrasPackageController.cs
	namespace		 	!
mythos_backend_dotnet		
 
.		  
Controllers		  +
{

 
[ 
Route 

(
 
$str !
)! "
]" #
[ 
ApiController 
] 
public 

class $
MythrasPackageController )
:* +
ControllerBase, :
{ 
private 
readonly 
MythosDbContext (
_context) 1
;1 2
private 
readonly "
IMythrasPackageService /
_packageService0 ?
;? @
public $
MythrasPackageController '
(' (
MythosDbContext( 7
context8 ?
,? @"
IMythrasPackageServiceA W
packageServiceX f
)f g
{ 	
_context 
= 
context 
; 
_packageService 
= 
packageService ,
;, -
} 	
[ 	
HttpGet	 
] 
[ 	
AllowAnonymous	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
var 
packages 
= 
await  
_packageService! 0
.0 1"
GetActivePackagesAsync1 G
(G H
)H I
;I J
return 
Ok 
( 
packages 
) 
;  
} 	
[   	
HttpGet  	 
(   
$str   
)   
]   
[!! 	
AllowAnonymous!!	 
]!! 
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
GetById"") 0
(""0 1
int""1 4
id""5 7
)""7 8
{## 	
var$$ 
package$$ 
=$$ 
await$$ 
_packageService$$  /
.$$/ 0%
GetActivePackageByIdAsync$$0 I
($$I J
id$$J L
)$$L M
;$$M N
if%% 
(%% 
package%% 
==%% 
null%% 
)%%  
return&& 
NotFound&& 
(&&  
$str&&  D
)&&D E
;&&E F
return'' 
Ok'' 
('' 
package'' 
)'' 
;'' 
}(( 	
[** 	
HttpPost**	 
]** 
[++ 	
	Authorize++	 
(++ 
Roles++ 
=++ 
$str++ "
)++" #
]++# $
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
Create,,) /
(,,/ 0
[,,0 1
FromBody,,1 9
],,9 :
MythrasPackage,,; I
package,,J Q
),,Q R
{-- 	
package.. 
... 
	CreatedAt.. 
=.. 
DateTime..  (
...( )
UtcNow..) /
;../ 0
_context// 
.// 
MythrasPackages// $
.//$ %
Add//% (
(//( )
package//) 0
)//0 1
;//1 2
await00 
_context00 
.00 
SaveChangesAsync00 +
(00+ ,
)00, -
;00- .
return11 
CreatedAtAction11 "
(11" #
nameof11# )
(11) *
GetById11* 1
)111 2
,112 3
new114 7
{118 9
id11: <
=11= >
package11? F
.11F G
MythrasPackageId11G W
}11X Y
,11Y Z
package11[ b
)11b c
;11c d
}22 	
[44 	
HttpPut44	 
(44 
$str44 
)44 
]44 
[55 	
	Authorize55	 
(55 
Roles55 
=55 
$str55 "
)55" #
]55# $
public66 
async66 
Task66 
<66 
IActionResult66 '
>66' (
Update66) /
(66/ 0
int660 3
id664 6
,666 7
[668 9
FromBody669 A
]66A B
MythrasPackage66C Q
model66R W
)66W X
{77 	
if88 
(88 
id88 
!=88 
model88 
.88 
MythrasPackageId88 ,
)88, -
return88. 4

BadRequest885 ?
(88? @
)88@ A
;88A B
var:: 
package:: 
=:: 
await:: 
_context::  (
.::( )
MythrasPackages::) 8
.::8 9
	FindAsync::9 B
(::B C
id::C E
)::E F
;::F G
if;; 
(;; 
package;; 
==;; 
null;; 
);;  
return;;! '
NotFound;;( 0
(;;0 1
);;1 2
;;;2 3
package== 
.== 
Name== 
=== 
model==  
.==  !
Name==! %
;==% &
package>> 
.>> 
MythrasAmount>> !
=>>" #
model>>$ )
.>>) *
MythrasAmount>>* 7
;>>7 8
package?? 
.?? 
Price?? 
=?? 
model?? !
.??! "
Price??" '
;??' (
package@@ 
.@@ 
IsActive@@ 
=@@ 
model@@ $
.@@$ %
IsActive@@% -
;@@- .
packageAA 
.AA 
BonusMythrasAA  
=AA! "
modelAA# (
.AA( )
BonusMythrasAA) 5
;AA5 6
awaitCC 
_contextCC 
.CC 
SaveChangesAsyncCC +
(CC+ ,
)CC, -
;CC- .
returnDD 
	NoContentDD 
(DD 
)DD 
;DD 
}EE 	
[GG 	

HttpDeleteGG	 
(GG 
$strGG 
)GG 
]GG 
[HH 	
	AuthorizeHH	 
(HH 
RolesHH 
=HH 
$strHH "
)HH" #
]HH# $
publicII 
asyncII 
TaskII 
<II 
IActionResultII '
>II' (
DeleteII) /
(II/ 0
intII0 3
idII4 6
)II6 7
{JJ 	
varKK 
packageKK 
=KK 
awaitKK 
_contextKK  (
.KK( )
MythrasPackagesKK) 8
.KK8 9
	FindAsyncKK9 B
(KKB C
idKKC E
)KKE F
;KKF G
ifLL 
(LL 
packageLL 
==LL 
nullLL 
)LL  
returnLL! '
NotFoundLL( 0
(LL0 1
)LL1 2
;LL2 3
_contextNN 
.NN 
MythrasPackagesNN $
.NN$ %
RemoveNN% +
(NN+ ,
packageNN, 3
)NN3 4
;NN4 5
awaitOO 
_contextOO 
.OO 
SaveChangesAsyncOO +
(OO+ ,
)OO, -
;OO- .
returnQQ 
	NoContentQQ 
(QQ 
)QQ 
;QQ 
}RR 	
}SS 
}TT ´!
éC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\MythosWalletController.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Controllers  +
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 "
MythosWalletController

 '
(

' ( 
IMythosWalletService

( <
walletService

= J
)

J K
:

L M
ControllerBase

N \
{ 
[ 	
HttpGet	 
] 
[ 	
	Authorize	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetMyWallet) 4
(4 5
)5 6
{ 	
var 
accountIdClaim 
=  
User! %
.% &
Claims& ,
., -
FirstOrDefault- ;
(; <
c< =
=>> @
cA B
.B C
TypeC G
==H J
$strK V
)V W
;W X
if 
( 
accountIdClaim 
== !
null" &
)& '
return 
Unauthorized #
(# $
$str$ F
)F G
;G H
var 
userId 
= 
Guid 
. 
Parse #
(# $
accountIdClaim$ 2
.2 3
Value3 8
)8 9
;9 :
var 
wallet 
= 
await 
walletService ,
., -"
GetWalletByUserIdAsync- C
(C D
userIdD J
)J K
;K L
if 
( 
wallet 
== 
null 
) 
return 
NotFound 
(  
$str  H
)H I
;I J
return 
Ok 
( 
wallet 
) 
; 
} 	
[ 	
HttpPut	 
( 
$str 
) 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str "
)" #
]# $
public 
async 
Task 
< 
IActionResult '
>' (
BlockWallet) 4
(4 5
[5 6
	FromQuery6 ?
]? @
GuidA E
userIdF L
)L M
{ 	
var 
result 
= 
await 
walletService ,
., -
BlockWalletAsync- =
(= >
userId> D
)D E
;E F
if   
(   
!   
result   
)   
return!! 

BadRequest!! !
(!!! "
$str!!" b
)!!b c
;!!c d
return"" 
Ok"" 
("" 
$str"" )
)"") *
;""* +
}## 	
[%% 	
HttpPut%%	 
(%% 
$str%% 
)%% 
]%% 
[&& 	
	Authorize&&	 
(&& 
Roles&& 
=&& 
$str&& "
)&&" #
]&&# $
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
UnblockWallet'') 6
(''6 7
[''7 8
	FromQuery''8 A
]''A B
Guid''C G
userId''H N
)''N O
{(( 	
var)) 
result)) 
=)) 
await)) 
walletService)) ,
.)), -
UnblockWalletAsync))- ?
())? @
userId))@ F
)))F G
;))G H
if** 
(** 
!** 
result** 
)** 
return++ 

BadRequest++ !
(++! "
$str++" h
)++h i
;++i j
return,, 
Ok,, 
(,, 
$str,, ,
),,, -
;,,- .
}-- 	
}.. 
}// ⁄=
ìC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\MythosTransactionController.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Controllers  +
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class '
MythosTransactionController ,
:- .
ControllerBase/ =
{ 
private 
readonly 
MythosDbContext (
_context) 1
;1 2
private 
readonly %
IMythosTransactionService 2
_transactionService3 F
;F G
public '
MythosTransactionController *
(* +
MythosDbContext+ :
context; B
,B C%
IMythosTransactionServiceD ]
transactionService^ p
)p q
{ 	
_context 
= 
context 
; 
_transactionService 
=  !
transactionService" 4
;4 5
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
MythosTransaction, =
>= >
>> ?
>? @
GetUserTransactionsA T
(T U
)U V
{ 	
var 
userId 
= 
Guid 
. 
Parse #
(# $
User$ (
.( )
FindFirstValue) 7
(7 8

ClaimTypes8 B
.B C
NameIdentifierC Q
)Q R
)R S
;S T
var   
transactions   
=   
await   $
_context  % -
.  - .
MythosTransactions  . @
.!! 
Where!! 
(!! 
t!! 
=>!! 
t!! 
.!! 
	AccountId!! '
==!!( *
userId!!+ 1
||!!2 4
t!!5 6
.!!6 7!
CounterpartyAccountId!!7 L
==!!M O
userId!!P V
)!!V W
."" 
OrderByDescending"" "
(""" #
t""# $
=>""% '
t""( )
."") *
	CreatedAt""* 3
)""3 4
.""4 5
ToListAsync""5 @
(""@ A
)""A B
;""B C
return$$ 
Ok$$ 
($$ 
transactions$$ "
)$$" #
;$$# $
}%% 	
[(( 	
HttpPost((	 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
CreateTransaction))) :
()): ;
[)); <
FromBody))< D
]))D E&
CreateMythosTransactionDto))F `
dto))a d
)))d e
{** 	
var++ 
userId++ 
=++ 
Guid++ 
.++ 
Parse++ #
(++# $
User++$ (
.++( )
FindFirstValue++) 7
(++7 8

ClaimTypes++8 B
.++B C
NameIdentifier++C Q
)++Q R
)++R S
;++S T
var.. 
sender.. 
=.. 
await.. 
_context.. '
...' (
Accounts..( 0
...0 1
	FindAsync..1 :
(..: ;
userId..; A
)..A B
;..B C
var// 
receiver// 
=// 
await//  
_context//! )
.//) *
Accounts//* 2
.//2 3
	FindAsync//3 <
(//< =
dto//= @
.//@ A!
CounterpartyAccountId//A V
)//V W
;//W X
if11 
(11 
sender11 
==11 
null11 
||11 !
receiver11" *
==11+ -
null11. 2
)112 3
return114 :

BadRequest11; E
(11E F
$str11F Y
)11Y Z
;11Z [
if44 
(44 
dto44 
.44 
Amount44 
<=44 
$num44 
)44  
return44! '

BadRequest44( 2
(442 3
$str443 C
)44C D
;44D E
var88 
newBalanceSender88  
=88! "
$num88# $
;88$ %
var:: 
transaction:: 
=:: 
new:: !
MythosTransaction::" 3
{;; 
Type<< 
=<< 
dto<< 
.<< 
Type<< 
,<<  
Amount== 
=== 
dto== 
.== 
Amount== #
,==# $
BalanceAfter>> 
=>> 
newBalanceSender>> /
,>>/ 0
	CreatedAt?? 
=?? 
DateTime?? $
.??$ %
UtcNow??% +
,??+ ,
	AccountId@@ 
=@@ 
sender@@ "
.@@" #
Id@@# %
,@@% &!
CounterpartyAccountIdAA %
=AA& '
receiverAA( 0
.AA0 1
IdAA1 3
,AA3 4
}BB 
;BB 
_contextDD 
.DD 
MythosTransactionsDD '
.DD' (
AddDD( +
(DD+ ,
transactionDD, 7
)DD7 8
;DD8 9
awaitEE 
_contextEE 
.EE 
SaveChangesAsyncEE +
(EE+ ,
)EE, -
;EE- .
returnGG 
CreatedAtActionGG "
(GG" #
nameofGG# )
(GG) *
GetUserTransactionsGG* =
)GG= >
,GG> ?
newGG@ C
{GGD E
idGGF H
=GGI J
transactionGGK V
.GGV W
MythosTransactionIdGGW j
}GGk l
,GGl m
transactionGGn y
)GGy z
;GGz {
}HH 	
[JJ 	
HttpPostJJ	 
(JJ 
$strJJ 
)JJ 
]JJ 
[KK 	
	AuthorizeKK	 
(KK 
RolesKK 
=KK 
$strKK #
)KK# $
]KK$ %
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' (
DonateLL) /
(LL/ 0
[LL0 1
FromBodyLL1 9
]LL9 :
CreateDonationDtoLL; L
dtoLLM P
)LLP Q
{MM 	
varNN 
accountIdClaimNN 
=NN  
UserNN! %
.NN% &
ClaimsNN& ,
.NN, -
FirstOrDefaultNN- ;
(NN; <
cNN< =
=>NN> @
cNNA B
.NNB C
TypeNNC G
==NNH J
$strNNK V
)NNV W
;NNW X
ifOO 
(OO 
accountIdClaimOO 
==OO !
nullOO" &
)OO& '
returnPP 
UnauthorizedPP #
(PP# $
$strPP$ F
)PPF G
;PPG H
varRR 
senderAccountIdRR 
=RR  !
GuidRR" &
.RR& '
ParseRR' ,
(RR, -
accountIdClaimRR- ;
.RR; <
ValueRR< A
)RRA B
;RRB C
varTT 
(TT 
successTT 
,TT 
messageTT !
,TT! "
responseTT# +
)TT+ ,
=TT- .
awaitTT/ 4
_transactionServiceTT5 H
.TTH I
DonateAsyncTTI T
(TTT U
senderAccountIdTTU d
,TTd e
dtoTTf i
)TTi j
;TTj k
ifVV 
(VV 
!VV 
successVV 
)VV 
returnWW 

BadRequestWW !
(WW! "
messageWW" )
)WW) *
;WW* +
returnYY 
OkYY 
(YY 
responseYY 
)YY 
;YY  
}ZZ 	
}[[ 
}\\ ’S
ÜC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\AuthController.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Controllers  +
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
AuthController 
(  
IAuthService  ,
authService- 8
)8 9
:: ;
ControllerBase< J
{ 
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
Account' .
>. /
>/ 0
Register1 9
(9 :#
CreateAccountRequestDto: Q
requestR Y
)Y Z
{ 	
var 
user 
= 
await 
authService (
.( )
RegisterAsync) 6
(6 7
request7 >
)> ?
;? @
if 
( 
user 
is 
null 
) 
return 

BadRequest !
(! "
new" %
{& '
message( /
=0 1
$str2 o
}p q
)q r
;r s
return 
Ok 
( 
user 
) 
; 
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
TokenResponseDto' 7
>7 8
>8 9
Login: ?
(? @

AccountDto@ J
requestK R
)R S
{ 	
var 
response 
= 
await  
authService! ,
., -

LoginAsync- 7
(7 8
request8 ?
)? @
;@ A
if 
( 
response 
is 
null  
)  !
return 

BadRequest !
(! "
$str" A
)A B
;B C
var!! 
accessTokenOptions!! "
=!!# $
new!!% (
CookieOptions!!) 6
{"" 
HttpOnly## 
=## 
true## 
,##  
Secure$$ 
=$$ 
true$$ 
,$$ 
SameSite%% 
=%% 
SameSiteMode%% '
.%%' (
None%%( ,
,%%, -
Expires&& 
=&& 
DateTime&& "
.&&" #
UtcNow&&# )
.&&) *
AddDays&&* 1
(&&1 2
$num&&2 3
)&&3 4
}'' 
;'' 
var)) 
refreshTokenOptions)) #
=))$ %
new))& )
CookieOptions))* 7
{** 
HttpOnly++ 
=++ 
true++ 
,++  
Secure,, 
=,, 
false,, 
,,, 
SameSite-- 
=-- 
SameSiteMode-- '
.--' (
Strict--( .
,--. /
Expires.. 
=.. 
DateTime.. "
..." #
UtcNow..# )
...) *
AddDays..* 1
(..1 2
$num..2 3
)..3 4
}// 
;// 
Response11 
.11 
Cookies11 
.11 
Append11 #
(11# $
$str11$ 1
,111 2
response113 ;
.11; <
AccessToken11< G
,11G H
accessTokenOptions11I [
)11[ \
;11\ ]
Response22 
.22 
Cookies22 
.22 
Append22 #
(22# $
$str22$ 2
,222 3
response224 <
.22< =
RefreshToken22= I
,22I J
refreshTokenOptions22K ^
)22^ _
;22_ `
return44 
Ok44 
(44 
new44 
{44 
message44 #
=44$ %
$str44& 8
}449 :
)44: ;
;44; <
}55 	
[77 	
HttpPost77	 
(77 
$str77 !
)77! "
]77" #
public88 
async88 
Task88 
<88 
ActionResult88 &
>88& '
RefreshToken88( 4
(884 5
)885 6
{99 	
var:: 
refreshToken:: 
=:: 
Request:: &
.::& '
Cookies::' .
[::. /
$str::/ =
]::= >
;::> ?
var;; 
userIdString;; 
=;; 
User;; #
.;;# $
Claims;;$ *
.;;* +
FirstOrDefault;;+ 9
(;;9 :
c;;: ;
=>;;< >
c;;? @
.;;@ A
Type;;A E
==;;F H
$str;;I T
);;T U
?;;U V
.;;V W
Value;;W \
;;;\ ]
if== 
(== 
string== 
.== 
IsNullOrEmpty== $
(==$ %
refreshToken==% 1
)==1 2
||==3 5
string==6 <
.==< =
IsNullOrEmpty=== J
(==J K
userIdString==K W
)==W X
||==Y [
!==\ ]
Guid==] a
.==a b
TryParse==b j
(==j k
userIdString==k w
,==w x
out==y |
var	==} Ä
userId
==Å á
)
==á à
)
==à â
{>> 
return?? 
Unauthorized?? #
(??# $
$str??$ D
)??D E
;??E F
}@@ 
varBB 
resultBB 
=BB 
awaitBB 
authServiceBB *
.BB* +
RefreshTokensAsyncBB+ =
(BB= >
userIdBB> D
,BBD E
refreshTokenBBF R
)BBR S
;BBS T
ifDD 
(DD 
resultDD 
isDD 
nullDD 
)DD 
returnEE 
UnauthorizedEE #
(EE# $
$strEE$ <
)EE< =
;EE= >
varGG 
accessTokenOptionsGG "
=GG# $
newGG% (
CookieOptionsGG) 6
{HH 
HttpOnlyII 
=II 
trueII 
,II  
SecureJJ 
=JJ 
falseJJ 
,JJ 
SameSiteKK 
=KK 
SameSiteModeKK '
.KK' (
StrictKK( .
,KK. /
ExpiresLL 
=LL 
DateTimeLL "
.LL" #
UtcNowLL# )
.LL) *
AddDaysLL* 1
(LL1 2
$numLL2 3
)LL3 4
}MM 
;MM 
varOO 
refreshTokenOptionsOO #
=OO$ %
newOO& )
CookieOptionsOO* 7
{PP 
HttpOnlyQQ 
=QQ 
trueQQ 
,QQ  
SecureRR 
=RR 
falseRR 
,RR 
SameSiteSS 
=SS 
SameSiteModeSS '
.SS' (
StrictSS( .
,SS. /
ExpiresTT 
=TT 
DateTimeTT "
.TT" #
UtcNowTT# )
.TT) *
AddDaysTT* 1
(TT1 2
$numTT2 3
)TT3 4
}UU 
;UU 
ResponseWW 
.WW 
CookiesWW 
.WW 
AppendWW #
(WW# $
$strWW$ 1
,WW1 2
resultWW3 9
.WW9 :
AccessTokenWW: E
,WWE F
accessTokenOptionsWWG Y
)WWY Z
;WWZ [
ResponseXX 
.XX 
CookiesXX 
.XX 
AppendXX #
(XX# $
$strXX$ 2
,XX2 3
resultXX4 :
.XX: ;
RefreshTokenXX; G
,XXG H
refreshTokenOptionsXXI \
)XX\ ]
;XX] ^
returnZZ 
OkZZ 
(ZZ 
newZZ 
{ZZ 
messageZZ #
=ZZ$ %
$strZZ& D
}ZZE F
)ZZF G
;ZZG H
}[[ 	
[^^ 	
	Authorize^^	 
]^^ 
[__ 	
HttpGet__	 
]__ 
public`` 
IActionResult`` %
AuthenticatedOnlyEndpoint`` 6
(``6 7
)``7 8
{aa 	
returnbb 
Okbb 
(bb 
$strbb .
)bb. /
;bb/ 0
}cc 	
[ee 	
	Authorizeee	 
]ee 
[ff 	
HttpPostff	 
(ff 
$strff 
)ff 
]ff 
publicgg 
IActionResultgg 
Logoutgg #
(gg# $
)gg$ %
{hh 	
Responseii 
.ii 
Cookiesii 
.ii 
Deleteii #
(ii# $
$strii$ 1
)ii1 2
;ii2 3
Responsejj 
.jj 
Cookiesjj 
.jj 
Deletejj #
(jj# $
$strjj$ 2
)jj2 3
;jj3 4
returnkk 
Okkk 
(kk 
newkk 
{kk 
messagekk #
=kk$ %
$strkk& ?
}kk@ A
)kkA B
;kkB C
}ll 	
[nn 	
	Authorizenn	 
(nn 
Rolesnn 
=nn 
$strnn "
)nn" #
]nn# $
[oo 	
HttpGetoo	 
(oo 
$stroo 
)oo 
]oo 
publicpp 
IActionResultpp 
AdminOnlyEndpointpp .
(pp. /
)pp/ 0
{qq 	
returnrr 
Okrr 
(rr 
$strrr )
)rr) *
;rr* +
}ss 	
[uu 	
HttpPostuu	 
(uu 
$struu 
)uu 
]uu 
publicvv 
asyncvv 
Taskvv 
<vv 
ActionResultvv &
<vv& '
TokenResponseDtovv' 7
>vv7 8
>vv8 9
LoginRawvv: B
(vvB C

AccountDtovvC M
requestvvN U
)vvU V
{ww 	
varxx 
responsexx 
=xx 
awaitxx  
authServicexx! ,
.xx, -

LoginAsyncxx- 7
(xx7 8
requestxx8 ?
)xx? @
;xx@ A
ifzz 
(zz 
responsezz 
iszz 
nullzz  
)zz  !
return{{ 

BadRequest{{ !
({{! "
$str{{" A
){{A B
;{{B C
return}} 
Ok}} 
(}} 
response}} 
)}} 
;}}  
}~~ 	
} 
}ÄÄ ˇ;
âC:\Users\Jax\Documents\Universidad\8_Semestre\Proyecto-Final\mythos-backend-dotnet\mythos-backend-dotnet\Controllers\AccountController.cs
	namespace 	!
mythos_backend_dotnet
 
.  
Controllers  +
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 
AccountController

 "
(

" #
IAccountService

# 2
accountService

3 A
)

A B
:

C D
ControllerBase

E S
{ 
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	
	Authorize	 
] 
public 
async 
Task 
< 
ActionResult &
<& '

AccountDto' 1
>1 2
>2 3
GetAccountById4 B
(B C
GuidC G
idH J
)J K
{ 	
var 
account 
= 
await 
accountService  .
.. /
GetAccountByIdAsync/ B
(B C
idC E
)E F
;F G
if 
( 
account 
== 
null 
)  
return 
NotFound 
(  
)  !
;! "
return 
Ok 
( 
account 
) 
; 
} 	
[ 	
HttpGet	 
( 
) 
] 
[ 	
	Authorize	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
AccountResponseDto' 9
>9 :
>: ;)
GetAccountByAccessTokenCookie< Y
(Y Z
)Z [
{ 	
var 
accountIdClaim 
=  
User! %
.% &
Claims& ,
., -
FirstOrDefault- ;
(; <
c< =
=>> @
cA B
.B C
TypeC G
==H J
$strK V
)V W
;W X
if 
( 
accountIdClaim 
== !
null" &
)& '
return 
Unauthorized #
(# $
$str$ F
)F G
;G H
var!! 
	accountId!! 
=!! 
Guid!!  
.!!  !
Parse!!! &
(!!& '
accountIdClaim!!' 5
.!!5 6
Value!!6 ;
)!!; <
;!!< =
var## 
account## 
=## 
await## 
accountService##  .
.##. /.
"GetAccountByAccessTokenCookieAsync##/ Q
(##Q R
	accountId##R [
)##[ \
;##\ ]
if%% 
(%% 
account%% 
==%% 
null%% 
)%%  
return&& 
NotFound&& 
(&&  
)&&  !
;&&! "
return(( 
Ok(( 
((( 
account(( 
)(( 
;(( 
})) 	
[++ 	
HttpPut++	 
(++ 
$str++ 
)++ 
]++ 
[,, 	
	Authorize,,	 
],, 
public-- 
async-- 
Task-- 
<-- 
ActionResult-- &
>--& '
UpdateAccount--( 5
(--5 6
Guid--6 :
id--; =
,--= >
[--? @
FromBody--@ H
]--H I!
EditProfileRequestDto--J _
model--` e
)--e f
{.. 	
var// 
result// 
=// 
await// 
accountService// -
.//- .
UpdateAccountAsync//. @
(//@ A
id//A C
,//C D
model//E J
)//J K
;//K L
if11 
(11 
result11 
is11 
null11 
)11 
return22 
NotFound22 
(22  
)22  !
;22! "
return44 
Ok44 
(44 
)44 
;44 
}55 	
[77 	
HttpPut77	 
(77 
$str77  
)77  !
]77! "
[88 	
	Authorize88	 
]88 
public99 
async99 
Task99 
<99 
ActionResult99 &
>99& '
ChangePassword99( 6
(996 7
Guid997 ;
id99< >
,99> ?
[99@ A
FromBody99A I
]99I J!
ChangePasswordRequest99K `
request99a h
)99h i
{:: 	
var;; 
userIdClaim;; 
=;; 
User;; "
.;;" #
Claims;;# )
.;;) *
FirstOrDefault;;* 8
(;;8 9
c;;9 :
=>;;; =
c;;> ?
.;;? @
Type;;@ D
==;;E G
$str;;H S
);;S T
;;;T U
if<< 
(<< 
userIdClaim<< 
is<< 
null<< #
||<<$ &
userIdClaim<<' 2
.<<2 3
Value<<3 8
!=<<9 ;
id<<< >
.<<> ?
ToString<<? G
(<<G H
)<<H I
)<<I J
return== 
Forbid== 
(== 
)== 
;==  
if?? 
(?? 
!?? 

ModelState?? 
.?? 
IsValid?? #
)??# $
return@@ 

BadRequest@@ !
(@@! "

ModelState@@" ,
)@@, -
;@@- .
varBB 
successBB 
=BB 
awaitBB 
accountServiceBB  .
.BB. /
ChangePasswordAsyncBB/ B
(BBB C
idBBC E
,BBE F
requestBBG N
)BBN O
;BBO P
ifDD 
(DD 
!DD 
successDD 
)DD 
returnEE 
NotFoundEE 
(EE  
)EE  !
;EE! "
returnGG 
	NoContentGG 
(GG 
)GG 
;GG 
}HH 	
[JJ 	
HttpPostJJ	 
(JJ 
$strJJ !
)JJ! "
]JJ" #
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
BecomeWriterKK) 5
(KK5 6
[KK6 7
FromBodyKK7 ?
]KK? @
	PersonDtoKKA J
dtoKKK N
)KKN O
{LL 	
varMM 
userIdClaimMM 
=MM 
UserMM "
.MM" #
ClaimsMM# )
.MM) *
FirstOrDefaultMM* 8
(MM8 9
cMM9 :
=>MM; =
cMM> ?
.MM? @
TypeMM@ D
==MME G
$strMMH S
)MMS T
;MMT U
ifNN 
(NN 
userIdClaimNN 
isNN 
nullNN #
)NN# $
returnOO 
UnauthorizedOO #
(OO# $
$strOO$ S
)OOS T
;OOT U
varQQ 
	accountIdQQ 
=QQ 
GuidQQ  
.QQ  !
ParseQQ! &
(QQ& '
userIdClaimQQ' 2
.QQ2 3
ValueQQ3 8
)QQ8 9
;QQ9 :
varRR 
responseRR 
=RR 
awaitRR  
accountServiceRR! /
.RR/ 0
BecomeWriterAsyncRR0 A
(RRA B
	accountIdRRB K
,RRK L
dtoRRM P
)RRP Q
;RRQ R
returnTT 
OkTT 
(TT 
responseTT 
)TT 
;TT  
}UU 	
}VV 
}WW 