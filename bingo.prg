// Deve-se gerar grandes quantidades de cartelas,
// apos abre-se o arquivo no fox e faz uma indexacao UNICA,
// ate achar a quantidade desejada.

LOCAL aNumero := {}
LOCAL nConta  := 0
LOCAL cString := ""
LOCAL Soma    := 0

Use Bingo New
Inde on Numero To Bingo
SRand( 5 )
nNumero := Rand()
WHILE .T.
   For i = 1 To 10000000000000000
   i := Rand()
   cNumero := Right( StrZero( i ), 2 )
   nTemp := Val( cNumero )
   IF nTemp >= 1 .AND. nTemp <= 75
      IF Ascan( aNumero, cNumero ) = 0
         Aadd( aNumero, cNumero )
         nConta++
      EndIF
      IF nConta = 24
         Asort( aNumero )
         For x := 1 To nConta
            IF x = nConta
               cString += aNumero[x]
            Else
               cString += aNumero[x] + " "
            EndIF
         Next
         Soma++
         ? cString
         ?? " " + StrZero( Soma,5)
         DbAppend()
         While .T.
            IF !NetErr()
               Bingo->Numero := cSTring
               Exit
            Else
               Loop
            EndIF
         EndDo
         cString := ""
         nConta  := 0
         aNumero := {}
      EndIF
   EndIF
   Next
Enddo
