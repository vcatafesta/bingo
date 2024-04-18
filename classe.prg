#Include "Oclip.Ch"
#Include "Box.Ch"
#Include "Inkey.Ch"
#Define  FALSO   .F.
#Define  OK      .T.

//***************************************************************************************************************************

CLASSE Menu FROM Ambiente
        VAR StatusSup
        VAR StatusInf
        VAR CorCabec
        VAR CorMenu
        VAR CorBorda
        VAR CorFundo
        VAR Ativo
        VAR Menu
        VAR PanoFundo
        VAR Frame
        VAR NomeFirma

        METHOD New      = NewMenu
        METHOD Show     = ShowMenu
        METHOD SetaCor   = SetaCorMenu
        METHOD SetaFrame = SetaFrameMenu
        METHOD SetaPano  = SetaPanoMenu
        METHOD SetaBorda = SetaBordaMenu
        METHOD StatInf   = StatInfMenu
        METHOD StatSup   = StatSupMenu
        METHOD Cls       = ClsMenu
        METHOD MaBox     = MaBoxMenu
        METHOD FazMenu   = FazMenuMenu

ENDCLASSE

METODO ClsMenu
        Cls( ::CorFundo, ::PanoFundo )
        Return Self

METODO NewMenu
       ::StatusSup  := "Macrosoft"
       ::StatusInf := ""
       ::CorCabec  := 75
       ::Ativo     := 1
       ::CorMenu   := 31
       ::CorBorda  := 31
       ::Menu      := {"Opcao 1 :Item 1:Item 1", "Opcao 2:Item 2:Item2"}
       ::PanoFundo := "€≤∞±Macrosoft€±≤∞"
       ::CorFundo  := 8
       ::Frame     := XFRAME
       ::NomeFirma := "MACROSOFT SISTEMAS DE INFORMATICA LTDA"
        setattrib("y", ::CorMenu - 1)   // Cor de Menu - 1
        setattrib("v", 12+16)           // Vermelho
        setattrib("a", 14+16)           // Amarelo
        setattrib("d", 10+16)           // Verde
        setattrib("c", 11+16)           // Ciano
        setattrib("m", 13+16)           // Magenta setattrib("z", 126)
        RETURN Self

METODO ShowMenu
        LOCAL nChoice
        Cls( ::CorFundo, ::PanoFundo )
        M_Frame( ::Frame )
        ::StatSup()
        ::StatInf()
        Return( nChoice := M_Menu( ::Ativo, ::Menu, ::CorMenu, 1 ))
        RETURN Self

METODO StatInfMenu( cMensagem )
        LOCAL nCol  := LastRow()
        LOCAL nTam  := MaxCol()
        LOCAL nPos  := ( nTam - Len( ::NomeFirma ))
        aPrint( nCol, 00,    IF( cMensagem = NIL, ::StatusInf, cMensagem), ::CorCabec, MaxCol() )
        aPrint( nCol, nPos,  ::NomeFirma, ::CorCabec )
        Return Self

METODO StatSupMenu( cCabecalho )
        LOCAL nTam  := MaxCol()
        LOCAL nPos  := ( nTam - Len( ::StatusSup ))
        aPrint( 00, 00, Padc( IF( cCabecalho = NIL, ::StatusSup, cCabecalho), nTam ),  ::CorCabec, nTam )
        aPrint( 00, ( nTam-8), Clock24( 00, (nTam-8), ::CorCabec ), ::CorCabec )
        Return Self


METODO SetaCorMenu( nTipo )
***************************
LOCAL aTipo      := { ::CorMenu, ::CorCabec, ::CorFundo }
LOCAL cPanoFundo := ::PanoFundo
LOCAL cScreen    := SaveScreen()
LOCAL xTipo      := IF( nTipo = NIL, 1, nTipo )
LOCAL xColor     := aTipo[ xTipo ]
LOCAL CorAnt     := aTipo[ xTipo ]
LOCAL ikey
LOCAL oCor := Menu():New()
      oCor:CorMenu   := aTipo[ 1 ]
      oCor:CorCabec  := aTipo[ 2 ]
      oCor:CorFundo  := aTipo[ 3 ]
      oCor:PanoFundo := cPanoFundo
      oCor:StatusSup := "TESTE DE COR - Cabecalho"
      oCor:StatusInf := "TESTE DE COR"

WHILE .T.
   Keyb( Chr( 27 ))
   oCor:Show()
   M_Frame( ::Frame )
   M_Message("Cor Atual = "+ StrZero( xColor, 3 ) + " - Enter Para Setar ou ESCape", xColor )
   Ikey := WaitKey( 0 )
   IF ( Ikey == 24)
      aTipo[ xTipo ] := ( XColor  := IIF( xColor  == 0, 255, --xColor  ))
      oCor:CorMenu   := aTipo[ 1 ]
      oCor:CorCabec  := aTipo[ 2 ]
      oCor:CorFundo  := aTipo[ 3 ]
   ELSEIF ( Ikey == 5)
      ( aTipo[ xTipo ] ) :=  ( xColor  := IIF( xColor  == 255, 0, ++xColor  ))
      oCor:CorMenu   := aTipo[ 1 ]
      oCor:CorCabec  := aTipo[ 2 ]
      oCor:CorFundo  := aTipo[ 3 ]
    ELSEIF ( Ikey == 27 ) .OR. ( IKey == 13 )
       Exit
    EndIF
End
::CorMenu   := aTipo[ 1 ]
::CorCabec  := aTipo[ 2 ]
::CorFundo  := aTipo[ 3 ]
XCOR        := ::CorMenu
XCORCABEC   := ::CorCabec
CORFUNDO    := ::CorFundo
CORPATTERN  := ::CorFundo
ResTela( cScreen )
Return SeLF

METODO SetaFrameMenu
********************
LOCAL cScreen := SaveScreen()
LOCAL nChoice := 1
LOCAL aFrames := {"        ",;
                  "⁄ƒø≥Ÿƒ¿≥",;
                  "…Õª∫ºÕ»∫",;
                  "÷ƒ∑∫Ωƒ”∫",;
                  "’Õ∏≥æÕ‘≥",;
                  "ﬂﬂﬂﬁ‹‹‹›",;
                  "€€€€€€€€€",;
                  "…–À« Ã»∂"}
nChoice := ::FazMenu( 03, 10, aFrames, ::CorMenu )
ResTela( cScreen )
IF nChoice = 0
   Return
EndIF
::Frame  := aFrames[nChoice]
XFRAME   := ::Frame
M_Frame( ::Frame )
Return Self

METODO SetaBordaMenu
********************
LOCAL aTipo      := { ::CorMenu, ::CorCabec, ::CorFundo }
LOCAL cPanoFundo := ::PanoFundo
LOCAL cScreen    := SaveScreen()
LOCAL xColor     := ::CorBorda
LOCAL ikey
LOCAL oCor := Menu():New()
      oCor:CorMenu   := aTipo[ 1 ]
      oCor:CorCabec  := aTipo[ 2 ]
      oCor:CorFundo  := aTipo[ 3 ]
      oCor:CorBorda  := ::CorBorda
      oCor:PanoFundo := cPanoFundo
      oCor:StatusSup := "TESTE DE COR DE BORDA"
      oCor:StatusInf := oCor:StatusSup

WHILE .T.
   Keyb( Chr( 27 ))
   oCor:Show()
   M_Frame( ::Frame )
   M_Message("Cor Borda Atual = "+ StrZero( xColor, 3 ) + " - Enter Para Setar ou ESCape", xColor )
   Ikey := WaitKey( 0 )
   IF ( Ikey == 24)
      XColor  := IIF( xColor  == 0, 63, --xColor  )
      oCor:CorBorda  := xColor
      ::CorBorda     := xColor
   ELSEIF ( Ikey == 5)
      xColor  := IIF( xColor  == 63, 0, ++xColor  )
      oCor:CorBorda  := xColor
      ::CorBorda     := xColor
    ELSEIF ( Ikey == 27 ) .OR. ( IKey == 13 )
       Exit
    EndIF
    Border( ::CorBorda )
End
XBORDER := ::CorBorda
Border( ::CorBorda )
ResTela( cScreen )
Return SeLF

METODO SetaPanoMenu
*******************
LOCAL nPano
LOCAL Selecionado  := 1
LOCAL nKey         := 0
LOCAL cScreen	   := SaveScreen()
LOCAL oCor
nPano          := Len( Patterns )
nPos           := Ascan( Patterns, ::Panofundo )
Selecionado    := IF( nPos = 0, 1, nPos )
cPanoFundo     := ::PanoFundo
cCorMenu       := ::CorMenu
cCorCabec      := ::CorCabec
cCorFundo      := ::CorFundo

oCor           := Menu():New()
oCor:PanoFundo := cPanoFundo
oCor:CorMenu   := cCorMenu
oCor:CorCabec  := cCorCabec
oCor:CorFundo  := cCorFundo

WHILE .T.
   Keyb( Chr( 27 ))
   oCor:Show()
   M_Frame( ::Frame )
   M_Message("Use as setas CIMA e BAIXO para trocar, ENTER para aceitar. Nß " + StrZero( Selecionado, 3 ), ::CorMenu )
   nKey := Inkey(0)
   IF ( nKey == 27 .OR. nKey = 13 )
      Exit
   ElseIF nKey == 24
      Selecionado := IF( Selecionado == 1, nPano, --Selecionado  )
      oCor:PanoFundo := Patterns[ Selecionado ]
   ElseIF nKey == 5
      Selecionado := IF( Selecionado == nPano, 1, ++Selecionado  )
      oCor:PanoFundo := Patterns[ Selecionado ]
   EndIF
EndDo
::PanoFundo := Patterns[ Selecionado ]
PATTERN     := ::PanoFundo
Return Self

METODO MaBoxMenu( nTopo, nEsq, nFundo, nDireita, Cabecalho, Rodape, lInverterCor )
*********************************************************************************
LOCAL cPattern := " "
LOCAL nCor     := IF( lInverterCor = NIL, ::CorMenu,  lInverterCor )
LOCAL pback

DispBegin()
IF nDireita = 79
   nDireita = MaxCol()
EndIf
ColorSet( @nCor, @pback )
Box( nTopo, nEsq, nFundo, nDireita, ::Frame + cPattern, nCor )
IF Cabecalho != Nil
   aPrint( nTopo, nEsq+1, "€", Roloc( nCor ), (nDireita-nEsq)-1)
   aPrint( nTopo, nEsq+1, Padc( Cabecalho, ( nDireita-nEsq)-1), Roloc( nCor ))
EndIF
IF Rodape != Nil
   aPrint( nFundo, nEsq+1, "€", Roloc( nCor ), (nDireita-nEsq)-1)
   aPrint( nFundo, nEsq+1, Padc( Rodape, ( nDireita-nEsq)-1), Roloc( nCor ))
EndIF
cSetColor( SetColor())
nSetColor( nCor, Roloc( nCor ))
DispEnd()
Return

METODO FazMenuMenu( nTopo, nEsquerda, aArray, Cor )
****************************************************
LOCAL nFundo     := ( nTopo + Len( aArray ) + 3 )
LOCAL nTamTitle  := ( Len( M_Title() ) + 12 )
LOCAL nDireita   := ( nEsquerda + AmaxStrLen( aArray ) + 1 )
IF ( nDireita - nEsquerda ) <  nTamTitle
   nDireita := ( nEsquerda + nTamTitle )
EndIF
Cor := IF( Cor = NIL, ::CorMenu, Cor )
::MaBox( nTopo, nEsquerda, nFundo, nDireita, "", "", Cor )
nChoice := Mx_Choice( @nTopo, @nEsquerda, @nFundo, @nDireita, aArray, Cor )
Return( nChoice )

//***************************************************************************************************************************

CLASSE MBox
        VAR Cima
        VAR Esquerda
        VAR Baixo
        VAR Direita
        VAR cScreen
	VAR Cabecalho
	VAR Rodape
        VAR Cor
        VAR Frame

        METHOD Inkey    = InkeyBox
        METHOD New      = NewBox
        METHOD Show     = ShowBox
        METHOD Hide     = HideBox
        METHOD Up       = UpBox
        METHOD Down     = DownBox
        METHOD Left     = LeftBox
        METHOD Right    = RightBox
        METHOD PageUp   = PageUpBox
        METHOD PageDown = PageDownBox
	METHOD Move	= MoveBox
        METHOD MoveGet  = MoveGetBox

ENDCLASSE

METODO NewBox( nCima, nEsquerda, nBaixo, nDireita, cCabecalho, cRodape, lInverterCor )
        ::Cima      := IF( nCima     != NIL, nCima,     10 )
        ::Esquerda  := IF( nEsquerda != NIL, nEsquerda, 10 )
        ::Baixo     := IF( nBaixo    != NIL, nBaixo,    20 )
        ::Direita   := IF( nDireita  != NIL, nDireita,  40 )
        ::Cor       := IF( lInverterCor != NIL, lInverterCor, 31 )
        ::Cabecalho := IF( cCabecalho != NIL, cCabecalho, NIl )
        ::Rodape    := IF( cRodape    != NIL, cRodape,    NIL )
	::Frame     := B_SINGLE
        RETURN Self

METODO MoveBox( oGetList, nCima, nEsquerda, nBaixo, nDireita )
        LOCAL nTam := Len( oGetList )
        LOCAL nDifTopo := nCima     - ::Cima
        LOCAL nDifEsq  := nEsquerda - ::Esquerda
        ::Hide()
	::Show( nCima, nEsquerda, nBaixo, nDireita )
        IF nTam != 0
           ::MoveGet( oGetList, nTam, nDifTopo, nDifEsq )
        EndIF
        RETURN Self

METODO MoveGetBox( oGetList, nTam, nDifTopo, nDifEsq )
        LOCAL nX
        For nX := 1 To nTam
           oGetList[nX]:Row += nDifTopo
           oGetList[nX]:Col += nDifEsq
        Next
        RETURN Self

METODO HideBox( nTela )
        ResTela( ::cScreen )
        RETURN Self

METODO InkeyBox()
        Inkey(0)
        IF LastKey() = 397
           ::Up()
        End
        Return Self

METODO UpBox
        ::Hide()
        ::Cima--
        ::Baixo--
        ::Paint()
        Return Self

METODO PageUpBox
        ::Hide()
        ::cScreen  := SaveScreen()
        ::Cima     := 0
        ::Baixo    := 4
        ::Paint()
        Return Self

METODO PageDownBox
        ::Hide()
        ::cScreen  := SaveScreen()
        ::Cima     := 20
        ::Baixo    := 24
        ::Paint()
        Return Self

METODO DownBox
        ::Hide()
        ::cScreen  := SaveScreen()
        ::Cima++
        ::Baixo++
        ::Paint()
        Return Self

METODO LeftBox
        ::Hide()
        ::cScreen  := SaveScreen()
        ::Esquerda--
        ::Direita--
        ::Paint()
        Return Self

METODO RightBox
        ::Hide()
        ::cScreen  := SaveScreen()
        ::Esquerda++
        ::Direita++
        ::Paint()
        Return Self

METODO ShowBox( nCima, nEsquerda, nBaixo, nDireita, cCabecalho, cRodape, lInverterCor )
	LOCAL cPattern := " "
        LOCAL cCor
        LOCAL pBack
        ::cScreen    := SaveScreen()
	::Cima	    := IF( nCima     != NIL, nCima,	::Cima )
	::Esquerda  := IF( nEsquerda != NIL, nEsquerda, ::Esquerda )
	::Baixo     := IF( nBaixo    != NIL, nBaixo,	::Baixo )
	::Direita   := IF( nDireita  != NIL, nDireita,	::Direita)
	::Cor	    := IF( lInverterCor != NIL, lInverterCor, ::Cor )
	::Cabecalho := IF( cCabecalho != NIL, cCabecalho, ::Cabecalho )
	::Rodape    := IF( cRodape    != NIL, cRodape,	  ::Rodape )

        cCor := ::Cor
	DispBegin()
	IF ::Direita = 79
		::Direita := MaxCol()
	EndIf
        ColorSet( @cCor, @pback )
	Box( ::Cima, ::Esquerda, ::Baixo, ::Direita, Super:Frame + cPattern, ::Cor )
	IF ::Cabecalho != Nil
		aPrint( ::Cima, ::Esquerda+1, "€", Roloc( ::Cor ), (::Direita-::Esquerda)-1)
		aPrint( ::Cima, ::Esquerda+1, Padc( ::Cabecalho, ( ::Direita-::Esquerda)-1), Roloc( ::Cor ))
	EndIF
	IF ::Rodape != Nil
		aPrint( ::Baixo, ::Esquerda+1, "€", Roloc( ::Cor ), (::Direita-::Esquerda)-1)
		aPrint( ::Baixo, ::Esquerda+1, Padc( ::Rodape, ( ::Direita-::Esquerda)-1), Roloc( ::Cor ))
	EndIF
        cSetColor( SetColor())
        nSetColor( cCor, Roloc( cCor ))
	DispEnd()
	Return Self

//***************************************************************************************************************************

CLASSE Relatorio
        VAR RowPrn
        VAR Pagina
        VAR Tamanho
        VAR NomeFirma
        VAR Sistema
        VAR Titulo
        VAR Cabecalho
        VAR Separador
        VAR Registros

        METHOD New    = NewPrn
        METHOD Inicio = InicioPrn
ENDCLASSE

METODO NewPrn
        ::RowPrn    := 0
        ::Pagina    := 0
        ::Tamanho   := 80
        ::NomeFirma := IF( XNOMEFIR = NIL, "", XNOMEFIR )
        ::Sistema   := "Macrosoft NOME DO PROGRAMA"
        ::Titulo    := "TITULO DO RELATORIO"
        ::Cabecalho := "CODIGO DESCRICAO"
        ::Separador := "="
        ::Registros := 0
        RETURN Self

METODO InicioPrn
      LOCAL nTam := ::Tamanho / 2
      LOCAL Hora := Time()
      LOCAL Data := Dtoc( Date() )
      ::Pagina++

      DevPos( 0, 0) ; QQout( Padc( ::NomeFirma, ::Tamanho ))
      Qout( Padc( ::Sistema, ::Tamanho ))
      Qout( Padc( ::Titulo, ::Tamanho ))
      Qout( Padr( "Pagina : " + StrZero( ::Pagina, 3 ), ( nTam     ) ) + Padl( Data + " - " + Hora, ( nTam  ) ) )
      Qout( Repl( ::Separador, ::Tamanho ))
      Qout( ::Cabecalho )
      Qout( Repl( ::Separador, ::Tamanho ))
      RETURN Self

//***************************************************************************************************************************

CLASSE Ambiente
        METHOD New          = NewSistema
        METHOD ConfAmbiente
ENDCLASSE

METODO NewSistema
        LOCAL nArgumentos := Argc()
        LOCAL cDrive      := IF( nArgumentos = 0,  NIL, Argv(1))
        LOCAL Visual      := IF( nArgumentos <= 1, NIL, Argv(2))
        LOCAL xNormal     := IF( nArgumentos <= 2, NIL, Argv(3))
        PUBLI XFRAME      := "⁄ƒø≥Ÿƒ¿≥"
        PUBLI XVISUAL     := FALSO

        M_Frame( XFRAME )
        Qout("˛ Carregando Configuracao.")
        IF cDrive = NIL
           cDrive := FCurdir()
        Else
           cDrive := Upper( cDrive )
           IF At(":\", cDrive ) = 0 .OR. !IsDir( cDrive ) .OR. Len( Alltrim( cDrive )) <= 3
              ErrorBeep()
              IF Conf("Pergunta: Drive " + cDrive + " invalido. Usar o corrente ?")
                 cDrive := FCurdir()
              Else
                 Quit
              EndIF
           EndIF
        EndIF
        IF xNormal = NIL
           Visual()
        EndIF
        XVISUAL := IF( Visual = NIL, OK, FALSO )
        PUBL ISPRINTER    := 1
        PUBL aPERMISSAO   := {}
        PUBL XUSUARIO     := "SUPERVISOR"
        PUBL XBASE        := ( cDrive )
        PUBL XBASEDADOS   := ( cDrive )
        PUBL HELP_CODIGO  := 0
        PUBL XIMPRESSORA  := 1
        PUBL GET_ATIVO    := FALSO
        PUBL XPATH        := XBASE + "\" + XUSUARIO + ".CFG"
        PUBL USUARIO      := SPACE(10)
        PUBL ACENTO       := FALSO
        //*******************************************
        PUBL _Row_        := 02     // Linhas Publicas para o arquivo de Help.
        PUBL _Col_        := 00     // Linhas Publicas para o arquivo de Help.
        PUBL _Trow_       := 24     // Linhas Publicas para o arquivo de Help.
        PUBL _TCol_       := 79     // Linhas Publicas para o arquivo de Help.
        PUBL Selecionado  := 1      // Pano de Fundo Selecionado
        PUBL XCOR         := 07     // Cor do Menu
        PUBL XCORANTIGA   := 05
        PUBL XCORCABEC    := 31     // Cor do Cabecalho
        PUBL XSOMBRA      := FALSO
        PUBL XBORDER      := 80    // Cor da Borda
        PUBL CORPATTERN   := 247   // 5
        PUBL CORALERTA    := 63    // "W+/B"
        PUBL _CORBOX      := 9
        PUBL _CORBOXCIMA  := 143
        PUBL CORFUNDO     := 247   // Cor Pano de Fundo
        PUBL XFONTE       := 1     // FlReset()
        PUBL PATTERNS     := {"€≤∞±Macrosoft€±≤∞",;
                    "∞∞∞∞∞∞∞∞∞∞±±±±±±±±±≤≤≤≤≤≤≤≤≤≤±±±±±±±±±±", ;
		    "∞∞∞∞∞∞∞∞∞±±±±±±±±≤≤≤≤≤≤≤≤≤±±±±±±±±±", ;
		    "±±∞±≤±≤∞±∞±∞∞≤∞≤±≤±≤≤±±≤€≤±±≤∞≤≤", ;
		    "±±∞±≤±≤∞±∞±∞∞≤∞≤±≤±≤≤±±≤€≤", ;
		    "±±∞±≤±≤∞±∞±∞∞≤∞≤±≤±≤≤", ;
		    "∞≤±≤±≤∞±≤±∞≤∞±≤∞≤∞≤±", ;
		    "±±∞±≤±≤∞±∞±∞∞≤∞≤±≤±≤≤±±≤€≤∞", ;
		    "±±±±±±±∞∞∞∞∞∞∞∞", ;
		    "≤≤≤≤≤≤≤±±±±±±", ;
		    "≤≤≤≤≤≤≤±±±±±", ;
                    "∞±≤€≤±∞",;
		    " ∞±≤€≤±∞", ;
		    "  ∞∞±±≤≤±±∞∞", ;
		    " ∞±≤€", ;
		    "∞±≤", ;
		    "€", ;
		    "≤", ;
		    "±", ;
                    "∞", ;
                    "≈≈", ;
		    " ", ;
                    "˛˛˛˛˛˛˛˛˛˛˛˛˛˛", ;
		    "˙.˘,˙'˘.';˘˛˘˙    ", ;
                    "˙.˘.'˙.'˘.˘'", ;
                    "Macrosoft Informatica                                       ", ;
                    "Macrosoft Informatica                                      ", ;
                    "Macrosoft Informatica                                     ", ;
                    "Macrosoft Informatica                                    ", ;
                    "Macrosoft Informatica                                   ", ;
                    "Macrosoft Informatica                                  ", ;
                    "Macrosoft Informatica                                 ", ;
                    "Macrosoft                                            ", ;
                    "Macrosoft                                           ", ;
                    "Macrosoft                                          ", ;
                    "Macrosoft                                         ", ;
                    "Macrosoft                                        ", ;
                    "Macrosoft                                       ", ;
                    "Macrosoft                                      ", ;
                    "Macrosoft                                     ", ;
                    "Macrosoft                                    ", ;
                    "Macrosoft                                   ", ;
                    "Macrosoft                                  ", ;
                    "Macrosoft                                 ", ;
                    "Macrosoft                                ", ;
                    "Macrosoft                               ", ;
                    "Macrosoft                              ", ;
                    "Macrosoft                             ", ;
                    "Macrosoft                            ", ;
                    "Macrosoft                           ", ;
                    "Macrosoft                          ", ;
                    "Macrosoft                         ", ;
                    "Macrosoft                        ", ;
                    "Macrosoft                       ", ;
                    "Macrosoft                      ", ;
                    "Macrosoft                     ", ;
                    "Macrosoft                    ", ;
                    "Macrosoft                   ", ;
                    "Macrosoft                  ", ;
                    "Macrosoft                 ", ;
                    "Macrosoft                ", ;
                    "Macrosoft               ", ;
                    "Macrosoft              ", ;
                    "Macrosoft             ", ;
                    "Macrosoft            ", ;
                    "Macrosoft           ", ;
                    "Macrosoft          ", ;
                    "Macrosoft         ", ;
                    "Macrosoft        ", ;
                    "Macrosoft       ", ;
                    "Macrosoft      ", ;
                    "Macrosoft     ", ;
                    "Macrosoft    ", ;
                    "Macrosoft   ", ;
                    "Macrosoft  ", ;
                    "Macrosoft ", ;
                    "Macrosoft"}
        PUBL PATTERN         := PATTERNS[ Selecionado ]
        PUBL Spooler         := FALSO
        PUBL cArquivo        := ""
        ::ConfAmbiente( cDrive )
        Return Self

METODO ConfAmbiente( cDrive )
       **********************
       LOCAL nArgumentos := Argc()
       IF File( XPATH )
          Restore From (XPATH) Additive
       EndIF
       IF nArgumentos = 0
          XFRAME  := "…–À« Ã»∂"
       ElseIF nArgumentos = 1
          XFRAME  := "…–À« Ã»∂"
       ElseIF nArgumentos = 2
          XFRAME  := "…–À« Ã»∂"
       ElseIF nArgumentos = 3
          XFRAME := "⁄ƒø≥Ÿƒ¿≥"
       EndIF
       M_Frame( XFRAME )
       PUBL XBASE      := ( cDrive )
       PUBL TabelaFonte[26]
       TabelaFonte[01] := { || VideoMode(3)}
       TabelaFonte[02] := { || VideoMode(43)}
       TabelaFonte[03] := { || VideoMode(50)}
       TabelaFonte[05] := { || FLreset() }
       TabelaFonte[06] := { || FLdigital() }
       TabelaFonte[07] := { || FLavantgrd() }
       TabelaFonte[08] := { || FL3270() }
       TabelaFonte[09] := { || FLbroadway() }
       TabelaFonte[10] := { || FLcyrillic() }
       TabelaFonte[11] := { || FLpercy() }
       TabelaFonte[12] := { || FLlegend() }
       TabelaFonte[13] := { || FLcalligra() }
       TabelaFonte[14] := { || FLscript2() }
       TabelaFonte[15] := { || FLscript1() }
       TabelaFonte[16] := { || FLItalic1() }
       TabelaFonte[17] := { || FLItalic2() }
       TabelaFonte[18] := { || FLRomany() }
       TabelaFonte[19] := { || FLOldEng() }
       TabelaFonte[20] := { || FLBauhaus() }
       TabelaFonte[21] := { || FLBodoni() }
       TabelaFonte[22] := { || FLGaramond() }
       TabelaFonte[23] := { || FLParkAve() }
       TabelaFonte[24] := { || FLComputer() }
       TabelaFonte[25] := { || FLGreek() }
       TabelaFonte[26] := { || FLHebrew() }

       Set Conf Off
       Set Bell On
       Set Scor Off
       Set Wrap On
       Set Mess To 22
       Set Dele On
       Set Date Brit
       Set Deci To 2
       Set Print To
       SetCancel( .F. )
       IF XFONTE > 1
          IF VidType() > 1
             M_CsrOff()
             Cls(7, " ")
             Eval( TabelaFonte[ XFONTE ] )
             MouseInit()
          EndIF
       EndIF
       BlinkBit( .F. )
       Border( XBORDER )
       Shadowtype(1, 512, chr(255)+chr(255)+chr(255))
       SetShadow( XSOMBRA )
       Palette( XCORANTIGA, CORFUNDO )
       setattrib("y", XCOR - 1)        // Cor de Menu - 1
       setattrib("v", 12+16)           // Vermelho
       setattrib("a", 14+16)           // Amarelo
       setattrib("d", 10+16)           // Verde
       setattrib("c", 11+16)           // Ciano
       setattrib("m", 13+16)           // Magenta
       setattrib("p", CORPATTERN*16)   // Palette color
       setattrib("q", CORPATTERN*16)   // Palette color
       setattrib("z", 126)             //
       Return Self

