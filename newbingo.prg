#Define OK     .T.
#Define FALSO  .F.

// Deve-se gerar grandes quantidades de cartelas,
// apos abre-se o arquivo no fox e faz uma indexacao UNICA,
// ate achar a quantidade desejada.

LOCAL aNumero   := {}
LOCAL nConta    := 0
LOCAL cString   := ""
LOCAL Soma      := 0
LOCAL aPrimeiro := {}
LOCAL aSegundo  := {}
LOCAL aTerceiro := {}
LOCAL aQuarto   := {}
LOCAL aQuinto   := {}
LOCAL nPrimeiro := 0
LOCAL nSegundo  := 0
LOCAL nTerceiro := 0
LOCAL nQuarto   := 0
LOCAL nQuinto   := 0

Use Bingo New
/* Normal                       */ Inde on Numero To Bingo1
/* Primeira Carreira Horizontal */ Inde On Left(   Numero, 02  ) + SubStr( Numero,16,2) + SubStr( Numero, 31, 2 ) + SubStr( Numero, 46,2 ) + SubStr( Numero, 61, 2 ) To Bingo2 Unique
/* Segunda Carreira Horizontal  */ Inde On SubStr( Numero, 04,2) + SubStr( Numero,19,2) + SubStr( Numero, 34, 2 ) + SubStr( Numero, 49,2 ) + SubStr( Numero, 64, 2 ) To Bingo3 Unique
/* Terceira Carreira Horizontal */ Inde On SubStr( Numero, 07,2) + SubStr( Numero,22,2) + SubStr( Numero, 37, 2 ) + SubStr( Numero, 52,2 ) + SubStr( Numero, 67, 2 ) To Bingo4 Unique
/* Quarta Carreira Horizontal   */ Inde On SubStr( Numero, 10,2) + SubStr( Numero,25,2) + SubStr( Numero, 40, 2 ) + SubStr( Numero, 55,2 ) + SubStr( Numero, 70, 2 ) To Bingo5 Unique
/* Quinta Carreira Horizontal   */ Inde On SubStr( Numero, 13,2) + SubStr( Numero,28,2) + SubStr( Numero, 43, 2 ) + SubStr( Numero, 58,2 ) + SubStr( Numero, 73, 2 ) To Bingo6 Unique
Bingo->(DbCloseArea())
Use Bingo New
   DbSetIndex("Bingo1")
   DbSetIndex("Bingo2")
   DbSetIndex("Bingo3")
   DbSetIndex("Bingo4")
   DbSetIndex("Bingo5")
   DbSetIndex("Bingo6")

Srand( 1 )
nContador := 0
nJa       := 0
WHILE .T.
   For i = 1 To 10000000000000000
   i := Rand()
   cNumero  := Right( StrZero( i ), 2 )
   nTemp    := Val( cNumero )
   IF nTemp >= 1 .AND. nTemp <= 15
      IF nPrimeiro < 5
         IF Ascan( aPrimeiro, cNumero ) = 0
            Aadd( aPrimeiro, cNumero )
            nPrimeiro++
            nConta++
         EndiF
      EndiF
   ElseIF nTemp >= 16 .AND. nTemp <= 30
      IF nSegundo < 5
         IF Ascan( aSegundo, cNumero ) = 0
            Aadd( aSegundo, cNumero )
            nSegundo++
            nConta++
         EndiF
      EndIF
   ElseIF nTemp >= 31 .AND. nTemp <= 45
      IF nTerceiro < 5
         IF Ascan( aTerceiro, cNumero ) = 0
            Aadd( aTerceiro, cNumero )
            nTerceiro++
            nConta++
         EndiF
      EndiF
   ElseIF nTemp >= 46 .AND. nTemp <= 60
      IF nQuarto < 5
         IF Ascan( aQuarto, cNumero ) = 0
            Aadd( aQuarto, cNumero )
            nQuarto++
            nConta++
         EndiF
      EndiF
   ElseIF nTemp >= 61 .AND. nTemp <= 75
      IF nQuinto < 5
         IF Ascan( aQuinto, cNumero ) = 0
            Aadd( aQuinto, cNumero )
            nQuinto++
            nConta++
         EndiF
      EndiF
   EndIF
   IF nConta >= 25
      Asort( aPrimeiro )
      Asort( aSegundo )
      Asort( aTerceiro )
      Asort( aQuarto )
      Asort( aQuinto )
      For x := 1 To nPrimeiro
	 cString += aPrimeiro[x] + " "
      Next
      For x := 1 To nSegundo
	 cString += aSegundo[x] + " "
      Next
      For x := 1 To nTerceiro
	 cString += aTerceiro[x] + " "
      Next
      For x := 1 To nQuarto
	 cString += aQuarto[x] + " "
      Next
      For x := 1 To nQuinto
	 IF x = nQuinto
	    cString += aQuinto[x]
         Else
	    cString += aQuinto[x] + " "
	 EndiF
      Next
      Bingo->(Order(1))
      IF Bingo->(!DbSeek( cString ))
         // Primeira Carreira Horizontal
         cString1 := Left( cString, 02 ) + SubStr( cString,16,2) + SubStr( cString, 31, 2 ) + SubStr( cString, 46,2 ) + SubStr( cString, 61, 2 )
         // Segunda Carreira Horizontal
         cString2 := SubStr( cString, 04,2) + SubStr( cString,19,2) + SubStr( cString, 34, 2 ) + SubStr( cString, 49,2 ) + SubStr( cString, 64, 2 )
         // Terceira Carreira Horizontal
         cString3 :=  SubStr( cString, 07,2) + SubStr( cString,22,2) + SubStr( cString, 37, 2 ) + SubStr( cString, 52,2 ) + SubStr( cString, 67, 2 )
        // Quarta Carreira Horizontal
        cString4 := SubStr( cString, 10,2) + SubStr( cString,25,2) + SubStr( cString, 40, 2 ) + SubStr( cString, 55,2 ) + SubStr( cString, 70, 2 )
        // Quinta Carreira Horizontal
        cString5 := SubStr( cString, 13,2) + SubStr( cString,28,2) + SubStr( cString, 43, 2 ) + SubStr( cString, 58,2 ) + SubStr( cString, 73, 2 )
        lIncluir := FALSO
        Bingo->(Order(2))
        IF Bingo->(!DbSeek( cString1 ))
           Bingo->(Order(3))
           IF Bingo->(!DbSeek( cString2 ))
              Bingo->(Order(4))
              IF Bingo->(!DbSeek( cString3 ))
                 Bingo->(Order(5))
                 IF Bingo->(!DbSeek( cString4 ))
                    Bingo->(Order(6))
                    IF Bingo->(!DbSeek( cString5 ))
                       lIncluir := OK
                    EndIF
                 EndIF
              EndIF
           EndIF
         EndIF
         IF lIncluir
            Soma++
            ? cString
            ?? " " + StrZero( Soma,4)
            DbAppend()
         Else
              cString   := ""
              nConta    := 0
              aPrimeiro := {}
              aSegundo  := {}
              aTerceiro := {}
              aQuarto   := {}
              aQuinto   := {}
              nPrimeiro := 0
              nSegundo  := 0
              nTerceiro := 0
              nQuarto   := 0
              nQuinto   := 0
              aNumero   := {}
              Loop
         EndIF
         While .T.
            IF !NetErr()
               Bingo->Numero := cSTring
               Bingo->Reg    := StrZero( Soma, 4 )
               Bingo->(DbCommit())
               Exit
            Else
               Loop
            EndIF
         EndDo
      Else
         QQout("Cartela " + StrZero( ++nJa,4 ) + " Ja incluida.  ")
      EndIF
      cString   := ""
      nConta    := 0
      aPrimeiro := {}
      aSegundo  := {}
      aTerceiro := {}
      aQuarto   := {}
      aQuinto   := {}
      nPrimeiro := 0
      nSegundo  := 0
      nTerceiro := 0
      nQuarto   := 0
      nQuinto   := 0
      aNumero   := {}
   EndIF
   Next
Enddo

Function Ver( aNumero  )
************************
LOCAL aNovo    := {}
LOCAL nY       := Len( aNumero )
LOCAL lIncluir := FALSO

For x := 1 To nY
   nTemp    := Val( aNumero[x])
   lIncluir := FALSO
   IF x <= 5
      IF nTemp <= 15
         lIncluir := OK
      EndIF
   ElseIF x >5 .AND. x <= 10
      IF nTemp > 16 .AND. nTemp <= 30
         lIncluir := OK
      EndIF
   ElseIF x >11 .AND. x <= 15
      IF nTemp > 31 .AND. nTemp <= 45
         lIncluir := OK
      EndIF
   ElseIF x >16 .AND. x <= 20
      IF nTemp > 46 .AND. nTemp <= 60
         lIncluir := OK
      EndIF
   ElseIF x >20
      IF nTemp >60 .AND. nTemp <= 75
         lIncluir := OK
      EndIF
   EndIF
   IF lIncluir
      Aadd( aNovo, aNumero[x] )
   Else
      Aadd( aNovo, "99")
   EndIF
Next
Return( aNovo )

Function Order( nOrdem )
************************
Return( DbSetOrder( nOrdem ))
