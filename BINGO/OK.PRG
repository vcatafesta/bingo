LOCAL cString := ""
LOCAL aString := {}
LOCAL nConta  := 0
Set Dele On

Use Numero New
Inde On Numero To Numero

fFile1 := "BINGO1.DOC"
fFile2 := "BINGO2.DOC"
fFile3 := "BINGO3.DOC"
fFile4 := "BINGO4.DOC"

AfileRead( fFile1, "aUm" )
AfileRead( fFile2, "aDois")
AfileRead( fFile3, "aTres" )
AfileRead( fFile4, "aQuatro" )


Numero->(DbGoTop())
WHILE Numero->(!Eof())
   Aadd( aString, Numero->Numero )
   Numero->(DbSkip(1))
   nConta++
EndDo
For a := 1 To 4000
   cTemp := aUm[a]
   nSoma := 0
   For x := 1 To nConta
      cString := aString[x]
      IF cString $ cTemp
         nSoma++
      EndIF
      IF nSoma >= 24
         ? aUm[a], a
         nSoma := 0
      EndIF
   Next
Next
For a := 1 To 4000
   cTemp := aDois[a]
   nSoma := 0
   For x := 1 To nConta
      cString := aString[x]
      IF cString $ cTemp
         nSoma++
      EndIF
      IF nSoma >= 24
         ? aDois[a], a
         nSoma := 0
      EndIF
   Next
Next
For a := 1 To 4000
   cTemp := aTres[a]
   nSoma := 0
   For x := 1 To nConta
      cString := aString[x]
      IF cString $ cTemp
         nSoma++
      EndIF
      IF nSoma >= 24
         ? aTres[a], a
         nSoma := 0
      EndIF
   Next
Next
For a := 1 To 3000
   cTemp := aQuatro[a]
   nSoma := 0
   For x := 1 To nConta
      cString := aString[x]
      IF cString $ cTemp
         nSoma++
      EndIF
      IF nSoma >= 24
         ? aQuatro[a], a
         nSoma := 0
      EndIF
   Next
Next
