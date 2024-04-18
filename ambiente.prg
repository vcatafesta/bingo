PUBL ISPRINTER    := 1
PUBL aPERMISSAO   := {}
PUBL XUSUARIO     := "SUPERVISOR"
PUBL XBASE        := ( cDrive )
PUBL XBASEDADOS   := ( cDrive )
PUBL HELP_CODIGO  := 0
PUBL XIMPRESSORA  := 1
PUBL GET_ATIVO    := FALSO
PUBL XDATA_PRE    := Date()   // Para verificar lancamentos pre-datados.
PUBL XPATH        := XBASE + "\" + XUSUARIO + ".CFG"
PUBL USUARIO      := SPACE(10)
PUBL ACENTO       := FALSO
//*******************************************
PUBL _CPI10    := Chr( ESC ) + Chr( 80 )
PUBL _CPI12    := Chr( ESC ) + Chr( 77 )
PUBL RESETA    := Chr( ESC ) + "@"
PUBL GD        := Chr( 14 )
PUBL PQ        := Chr( 15 )
PUBL NG        := Chr(27) + "E"
PUBL NR        := Chr(27) + "F"
PUBL CA        := Chr(20)
PUBL C18       := Chr(18)
PUBL LIGSUB    := Chr(27) + "-" + Chr(1)
PUBL DESSUB    := Chr(27) + "-" + Chr(0)
PUBL _SALTOOFF := Chr(27) + "O-"
PUBL _SPACO1_8 := Chr(27) + "0"
PUBL _SPACO1_6 := Chr(27) + "2"
//*******************************************
PUBL _Row_        := 02  // Linhas Publicas para o arquivo de Help.
PUBL _Col_        := 00  //
PUBL _Trow_       := 24  //
PUBL _TCol_       := 79  //
PUBL Selecionado  := 16
PUBL XCOR         := 31  // Cor do Menu
PUBL XCORCABEC    := 63  // Cor do Cabecalho
PUBL XSOMBRA      := FALSO
     XFRAME       := "ÚÄ¿³ÙÄÀ³"
PUBL XBORDER      := 55   // Cor da Borda
PUBL CORPATTERN   := 5
PUBL CORALERTA    := 63 // "W+/B"
PUBL _CORBOX      := 9
PUBL _CORBOXCIMA  := 143
PUBL CORFUNDO     := 11      // Cor Pano de Fundo
PUBL XFONTE       := 1       // FlReset()
PUBL PATTERNS     := { "°°°°°°°°°°±±±±±±±±±²²²²²²²²²²±±±±±±±±±±", ;
		    "°°°°°°°°°±±±±±±±±²²²²²²²²²±±±±±±±±±", ;
		    "±±°±²±²°±°±°°²°²±²±²²±±²Û²±±²°²²", ;
		    "±±°±²±²°±°±°°²°²±²±²²±±²Û²", ;
		    "±±°±²±²°±°±°°²°²±²±²²", ;
		    "°²±²±²°±²±°²°±²°²°²±", ;
		    "±±°±²±²°±°±°°²°²±²±²²±±²Û²°", ;
		    "±±±±±±±°°°°°°°°", ;
		    "²²²²²²²±±±±±±", ;
		    "²²²²²²²±±±±±", ;
                    "°±²Û²±°",;
		    " °±²Û²±°", ;
		    "  °°±±²²±±°°", ;
		    " °±²Û", ;
		    "°±²", ;
		    "Û", ;
		    "²", ;
		    "±", ;
                    "°", ;
                    "ÅÅ", ;
		    " ", ;
                    "þþþþþþþþþþþþþþ", ;
		    "ú.ù,ú'ù.';ùþùú    ", ;
                    "ú.ù.'ú.'ù.ù'", ;
                    CapFirst( ENCRYPT ) + "  ", ;
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
ConfAmbiente( XBASE )
Return

Proc ConfAmbiente( cDrive )
***************************
IF File( XPATH )
   Restore From (XPATH) Additive
EndIF
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

//Set Optimize On
Set Conf Off
Set Bell On
Set Scor Off
Set Wrap On
Set Mess To 22
Set Dele On
Set Date Brit
Set Deci To 2
Set Key F8  To AcionaSpooler()
Set Key F10 To Calc()
Set Key TECLA_ALTC To Altc( XSISTEM_1 + " " + SISTEM_VERSAO )
Set Key K_ALT_X    To Dos()
Set Key K_ALT_Y    To Comandos()
Set Key 23 To      GravaDisco()    // CTRL + END
Set Print To
SetCancel(FALSO)
IF XFONTE > 1
   IF VidType() > 1
      M_CsrOff()
      Cls(7, " ")
      Eval( TabelaFonte[ XFONTE ] )
      MouseInit()
   EndIF
EndIF
BlinkBit( FALSO )
Border( XBORDER )
shadowtype(1, 512, chr(255)+chr(255)+chr(255))
SetShadow( XSOMBRA )
M_Frame( XFRAME )
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
