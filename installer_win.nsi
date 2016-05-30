; Script generated by the HM NIS Edit Script Wizard.

RequestExecutionLevel user
Unicode true

#!define BUILD_UNINSTALLER
#!define BUILD_X64_VERSION
#!define BUILD_WITH_LOGGER
#!define ENABLE_DEBUG_MESSAGES
#!define ENABLE_QT5

!macro DEBUG_MSG message
!ifdef ENABLE_DEBUG_MESSAGES
  MessageBox MB_OK "${message}"
!endif
!macroend

; HM NIS Edit Wizard helper defines
BrandingText "MEGA Limited"
!define PRODUCT_NAME "MEGAsync"

VIAddVersionKey "CompanyName" "MEGA Limited"
VIAddVersionKey "FileDescription" "MEGAsync"
VIAddVersionKey "LegalCopyright" "MEGA Limited 2016"
VIAddVersionKey "ProductName" "MEGAsync"

; Version info
VIProductVersion "2.9.5.0"
VIAddVersionKey "FileVersion" "2.9.5.0"
VIAddVersionKey "ProductVersion" "2.9.5.0"
!define PRODUCT_VERSION "2.9.5"

!define PRODUCT_PUBLISHER "Mega Limited"
!define PRODUCT_WEB_SITE "http://www.mega.nz"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\MEGAsync.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"
!define CSIDL_STARTUP '0x7' ;Startup path
!define CSIDL_LOCALAPPDATA '0x1C' ;Local Application Data path
!define CSIDL_COMMON_APPDATA '0x23'

; To be defined depending on your working environment

!ifdef BUILD_X64_VERSION
!define QT_PATH "C:\Qt\qt-4.8.7-x64-msvc2010\qt-4.8.7-x64-msvc2010\"
!else
!ifndef ENABLE_QT5
!define QT_PATH "C:\Qt\4.8.6.0\"
!else
!define QT_PATH "C:\Qt\Qt5.5.0\5.5\msvc2010"
!endif
!endif

!define BUILDPATH_X86 "Release_x32"
!define BUILDPATH_X64 "Release_x64"

!ifdef BUILD_X64_VERSION
!define SRCDIR_MEGASYNC "${BUILDPATH_X64}\MEGAsync\release"
!define SRCDIR_LOGGER "${BUILDPATH_X64}\MEGALogger\release"
!else
!define SRCDIR_MEGASYNC "${BUILDPATH_X86}\MEGAsync\release"
!define SRCDIR_LOGGER "${BUILDPATH_X86}\MEGALogger\release"
!endif

!define SRCDIR_MEGASHELLEXT_X32 "${BUILDPATH_X86}\MEGAShellExt\release"
!define SRCDIR_MEGASHELLEXT_X64 "${BUILDPATH_X64}\MEGAShellExt\release"
!define MULTIUSER_MUI
!define MULTIUSER_INSTALLMODE_COMMANDLINE
!define MULTIUSER_EXECUTIONLEVEL Standard
!define MULTIUSER_EXECUTIONLEVEL_ALLUSERS
!define MULTIUSER_INSTALLMODE_DEFAULT_CURRENTUSER

!define MEGA_DATA "mega.ini"
!define UNINSTALLER_NAME "uninst.exe"

!include "MUI2.nsh"
!include "Library.nsh"
!include "UAC.nsh"
!include "MultiUser.nsh"
!include "x64.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "installer\app_ico.ico"
!define MUI_UNICON "installer\uninstall_ico.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Settings
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "MEGAsync"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!define MUI_FINISHPAGE_RUN ;"$INSTDIR\MEGASync.exe"
!define MUI_FINISHPAGE_RUN_FUNCTION RunFunction

!define MUI_WELCOMEFINISHPAGE_BITMAP "installer\left_banner.bmp"
;!define MUI_FINISHPAGE_NOAUTOCLOSE

var APP_NAME
var ICONS_GROUP
;var INSTALLDAY
;var EXPIRATIONDAY
var USERNAME
var CURRENT_USER_INSTDIR
var ALL_USERS_INSTDIR

; Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "installer\terms.txt"
!insertmacro MULTIUSER_PAGE_INSTALLMODE
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Language files (the ones available in MEGASync, with locale code)
!insertmacro MUI_LANGUAGE "Afrikaans"       ;af
!insertmacro MUI_LANGUAGE "Albanian"
!insertmacro MUI_LANGUAGE "Arabic"          ;ar
!insertmacro MUI_LANGUAGE "Armenian"
!insertmacro MUI_LANGUAGE "Basque"          ;eu
!insertmacro MUI_LANGUAGE "Belarusian"
!insertmacro MUI_LANGUAGE "Bosnian"         ;bs
!insertmacro MUI_LANGUAGE "Breton"
!insertmacro MUI_LANGUAGE "Bulgarian"       ;bg
!insertmacro MUI_LANGUAGE "Catalan"         ;ca
!insertmacro MUI_LANGUAGE "Cibemba"
!insertmacro MUI_LANGUAGE "Croatian"        ;hr
!insertmacro MUI_LANGUAGE "Czech"           ;cs
!insertmacro MUI_LANGUAGE "Danish"          ;da
!insertmacro MUI_LANGUAGE "Dutch"           ;nl
!insertmacro MUI_LANGUAGE "Efik" 			;locale code not found
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Esperanto"
!insertmacro MUI_LANGUAGE "Estonian"
!insertmacro MUI_LANGUAGE "Farsi" 			;locale code not found
!insertmacro MUI_LANGUAGE "Finnish"         ;fi
!insertmacro MUI_LANGUAGE "French"          ;fr
!insertmacro MUI_LANGUAGE "Galician"
!insertmacro MUI_LANGUAGE "Georgian"
!insertmacro MUI_LANGUAGE "German"            ;de
!insertmacro MUI_LANGUAGE "Greek"             ;el
!insertmacro MUI_LANGUAGE "Hebrew"            ;he
!insertmacro MUI_LANGUAGE "Hindi"             ;hi
!insertmacro MUI_LANGUAGE "Hungarian"         ;hu
!insertmacro MUI_LANGUAGE "Icelandic"
!insertmacro MUI_LANGUAGE "Igbo"
!insertmacro MUI_LANGUAGE "Indonesian"        ;in
!insertmacro MUI_LANGUAGE "Irish"
!insertmacro MUI_LANGUAGE "Italian"           ;it
!insertmacro MUI_LANGUAGE "Japanese"          ;ja
!insertmacro MUI_LANGUAGE "Khmer"
!insertmacro MUI_LANGUAGE "Korean"            ;ko
!insertmacro MUI_LANGUAGE "Kurdish"
!insertmacro MUI_LANGUAGE "Latvian"           ;lv
!insertmacro MUI_LANGUAGE "Lithuanian"        ;lt
!insertmacro MUI_LANGUAGE "Luxembourgish"
!insertmacro MUI_LANGUAGE "Macedonian"        ;mk
!insertmacro MUI_LANGUAGE "Malagasy"
!insertmacro MUI_LANGUAGE "Malay"             ;ms
!insertmacro MUI_LANGUAGE "Mongolian"
!insertmacro MUI_LANGUAGE "Norwegian"         ;no
!insertmacro MUI_LANGUAGE "NorwegianNynorsk"
!insertmacro MUI_LANGUAGE "Polish"            ;pl
!insertmacro MUI_LANGUAGE "Portuguese"        ;pt
!insertmacro MUI_LANGUAGE "PortugueseBR"      ;pt_BR
!insertmacro MUI_LANGUAGE "Romanian"          ;ro
!insertmacro MUI_LANGUAGE "Russian"           ;ru
!insertmacro MUI_LANGUAGE "Serbian"
!insertmacro MUI_LANGUAGE "SerbianLatin"
!insertmacro MUI_LANGUAGE "Sesotho"
!insertmacro MUI_LANGUAGE "SimpChinese"       ;zh_CN
!insertmacro MUI_LANGUAGE "Slovak"            ;sk
!insertmacro MUI_LANGUAGE "Slovenian"         ;sl
!insertmacro MUI_LANGUAGE "Spanish"           ;es
!insertmacro MUI_LANGUAGE "SpanishInternational"
!insertmacro MUI_LANGUAGE "Swahili"
!insertmacro MUI_LANGUAGE "Swedish"          ;sv
!insertmacro MUI_LANGUAGE "Tamil"
!insertmacro MUI_LANGUAGE "Thai"             ;th
!insertmacro MUI_LANGUAGE "TradChinese"      ;zh_TW
!insertmacro MUI_LANGUAGE "Turkish"          ;tr
!insertmacro MUI_LANGUAGE "Twi"
!insertmacro MUI_LANGUAGE "Ukrainian"        ;uk
!insertmacro MUI_LANGUAGE "Uyghur"
!insertmacro MUI_LANGUAGE "Uzbek"
!insertmacro MUI_LANGUAGE "Vietnamese"       ;vn
!insertmacro MUI_LANGUAGE "Welsh"            ;cy
!insertmacro MUI_LANGUAGE "Yoruba"
!insertmacro MUI_LANGUAGE "Zulu"

; mi Maori is included in MegaSync, but not here
; ee Ewe is included in MegaSync, but not here
; tl Tagalog is included in MegaSync, but not here

; MUI end ------

Name $APP_NAME
!ifdef BUILD_UNINSTALLER
OutFile "UninstallerGenerator.exe"
!else
OutFile "MEGAsyncSetup.exe"
!endif

InstallDir "$PROGRAMFILES\MEGAsync"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails nevershow
ShowUnInstDetails nevershow

Function RunFunction
  ${UAC.CallFunctionAsUser} RunMegaSync
FunctionEnd

Function RunMegaSync
  Exec "$INSTDIR\MEGAsync.exe"
  Sleep 2000
FunctionEnd

Function RunExplorer
  ExecDos::exec /ASYNC /DETAILED /DISABLEFSR "explorer.exe"
FunctionEnd

Function .onInit
  !insertmacro MULTIUSER_INIT
  StrCpy $APP_NAME "${PRODUCT_NAME} ${PRODUCT_VERSION}"
  
  !ifdef BUILD_UNINSTALLER
         WriteUninstaller "$EXEDIR\${UNINSTALLER_NAME}"
         Quit
  !endif
  
  ;${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
  ;strCpy $INSTALLDAY "$2$1$0"
  ;strCpy $EXPIRATIONDAY "20140121"

  ;${if} $INSTALLDAY >= $EXPIRATIONDAY
  ;    MessageBox mb_IconInformation|mb_TopMost|mb_SetForeground "Thank you for testing MEGAsync.$\r$\nThis beta version is no longer current and has expired.$\r$\nPlease follow @MEGAprivacy on Twitter for updates."
  ;    abort
  ;${EndIf}

  UAC::RunElevated
  ${Switch} $0
  ${Case} 0
    ${IfThen} $1 = 1 ${|} Quit ${|} ;User process. The installer has finished. Quit.
    ${IfThen} $3 <> 0 ${|} ${Break} ${|} ;Admin process, continue the installation
    ${If} $1 = 3 ;RunAs completed successfully, but with a non-admin user
      ;MessageBox mb_YesNo|mb_IconExclamation|mb_TopMost|mb_SetForeground "This requires admin privileges, try again" /SD IDNO IDYES uac_tryagain IDNO 0
      Quit
    ${EndIf}
  ${Case} 1223
    ;MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "This requires admin privileges, aborting!"
    Quit
  ${Default}
    MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "This installer requires Administrator privileges. Error $0"
    Quit
  ${EndSwitch}
  
  ;MessageBox mb_IconInformation|mb_TopMost|mb_SetForeground "CAUTION: This is a private BETA version and will expire on Jan 20, 2014, 23:59. If you encounter a bug, malfunction or design flaw, please let us know by sending an e-mail to beta@mega.co.nz.$\r$\n$\r$\nIn this version, the scope of the sync engine is limited. Please bear in mind that:$\r$\n$\r$\n1. Deletions are only executed on the other side if they occur while the sync is live. Do not delete items from synced folders while this app is not running!$\r$\n2. Windows filenames are case insensitive. Do not place items a MEGA folder whose names would clash on the client. Loss of data would occur.$\r$\n3. Local filesystem items must not be exposed to the sync subsystem more than once. Any dupes, whether by nesting syncs or through filesystem links, will lead to unexpected results and loss of data.$\r$\n$\r$\nLimitiations in the current version that will be rectified in the future:$\r$\n$\r$\n1. No locking: Concurrent creation of identically named files and folders on different clients can result in server-side dupes and unexpected results.$\r$\n2. No in-place versioning: Deleted remote files can be found in the MEGA rubbish bin (SyncDebris folder), deleted local files in your computer's recycle bin.$\r$\n3. No delta writes: Changed files are always overwritten as a whole, which means that it is not a good idea to sync e.g. live database files.$\r$\n4. No direct peer-to-peer syncing: Even two machines in the same local subnet will still sync via the remote MEGA infrastructure.$\r$\n$\r$\nThank you for betatesting MEGAsync. We appreciate your pioneering spirit!"
  ;!insertmacro MUI_UNGETLANGUAGE
  !insertmacro MUI_LANGDLL_DISPLAY
  
FunctionEnd

Function GetPaths
  System::Call 'shell32::SHGetSpecialFolderPath(i $HWNDPARENT, t .r1, i ${CSIDL_COMMON_APPDATA}, i0)i.r0'
  strCpy $ALL_USERS_INSTDIR $1
  
  System::Call "advapi32::GetUserName(t .r0, *i ${NSIS_MAX_STRLEN} r1) i.r2"
  strCpy $USERNAME $0
  System::Call 'shell32::SHGetSpecialFolderPath(i $HWNDPARENT, t .r1, i ${CSIDL_LOCALAPPDATA}, i0)i.r0'
  strCpy $CURRENT_USER_INSTDIR $1
  
  WriteINIStr "$ALL_USERS_INSTDIR\megatmp.ini" section1 "M1" "$CURRENT_USER_INSTDIR"
  WriteINIStr "$ALL_USERS_INSTDIR\megatmp.ini" section1 "M2" "$USERNAME"
FunctionEnd

Section "Principal" SEC01

  !insertmacro DEBUG_MSG "Getting needed information"
  System::Call 'shell32::SHGetSpecialFolderPath(i $HWNDPARENT, t .r1, i ${CSIDL_COMMON_APPDATA}, i0)i.r0'
  strCpy $ALL_USERS_INSTDIR $1
  
  ${UAC.CallFunctionAsUser} GetPaths

readpaths:
  ReadINIStr $CURRENT_USER_INSTDIR "$ALL_USERS_INSTDIR\megatmp.ini" section1 "M1"
  ReadINIStr $USERNAME "$ALL_USERS_INSTDIR\megatmp.ini" section1 "M2"
  StrCmp $CURRENT_USER_INSTDIR "" 0 pathsreaded
  Sleep 1000
  goto readpaths

  !insertmacro DEBUG_MSG "Checking install mode"
pathsreaded:
  Delete "$ALL_USERS_INSTDIR\megatmp.ini"
  StrCmp "CurrentUser" $MultiUser.InstallMode currentuser
  !insertmacro DEBUG_MSG "Install for all"
  SetShellVarContext all
  StrCpy $INSTDIR "$ALL_USERS_INSTDIR\MEGAsync"
  goto modeselected
currentuser:
 !insertmacro DEBUG_MSG "Install for current user"
  SetShellVarContext current
  StrCpy $INSTDIR "$CURRENT_USER_INSTDIR\MEGAsync"
modeselected:

  ;SetRebootFlag true
  SetOverwrite try

  ;VC++2010 Redistributable x32
  SetOutPath "$INSTDIR"
  
  !insertmacro DEBUG_MSG "Looking for MSVC++ Redistributable 2010 SP1 (x86)"
  
  ;VC++ 2010 SP1 x86
  ClearErrors
  ReadRegDword $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{F0C3E5D1-1ADE-321E-8167-68EF0DE699A5}" "Version"
  IfErrors 0 VSRedist2010x86Installed
           ${Do}
               Pop $0
               IfErrors cslbl1
           ${Loop}
           cslbl1:
           !insertmacro DEBUG_MSG "Downloading MSVC++ Redistributable (x86)"
           ClearErrors
           inetc::get /caption "Microsoft Visual C++ 2010 SP1 Redistributable Package (x86)" "http://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe" "$INSTDIR\vcredist_x86.exe" /end
           pop $0
           StrCmp $0 "OK" dlok1
           MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "Incomplete download, aborting!"
           Abort
           dlok1:

           !insertmacro DEBUG_MSG "Checking MSVC++ Redistributable (x86)"
           md5dll::GetMD5File "$INSTDIR\vcredist_x86.exe"
           Pop $0
           ;DetailPrint "md5: [$0]"
           StrCmp $0 "cede02d7af62449a2c38c49abecc0cd3" md5x32ok
                  MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "Corrupt download, aborting!"
                  Abort
           md5x32ok:
           
           !insertmacro DEBUG_MSG "Installing MSVC++ Redistributable (x86)"
           retryvsredistx32:
                ExecDos::exec /DETAILED '"$INSTDIR\vcredist_x86.exe" /NoSetupVersionCheck /passive /showfinalerror /promptrestart'
                Pop $0
                StrCmp $0 "0" vcredist32ok
                       StrCmp $0 "5100" askforretryx32 fatalvcredistx32
                       askforretryx32:
                       MessageBox MB_RETRYCANCEL "Another installation is already in progress. Please, finish it and retry." IDRETRY retryvsredistx32 IDABORT abortx32
                       fatalvcredistx32:
                       MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "There was a problem installing Microsoft VC++ 2010 x32 ($0), aborting!"
                       abortx32:
                       Abort
           vcredist32ok:
           Delete "$INSTDIR\vcredist_x86.exe"
  VSRedist2010x86Installed:
  !insertmacro DEBUG_MSG "MSVC++ Redistributable (x86) is installed"
    
  ${If} ${RunningX64}
        !insertmacro DEBUG_MSG "Looking for MSVC++ Redistributable 2010 SP1 (x64)"
        ;VC++ 2010 SP1 x64
        SetRegView 64
        ClearErrors
        ReadRegDword $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{1D8E6291-B0D5-35EC-8441-6616F567A0F7}" "Version"
        IfErrors 0 VSRedist2010x64Installed
                ${Do}
                    Pop $0
                    IfErrors cslbl2
                ${Loop}
                cslbl2:
                
                !insertmacro DEBUG_MSG "Downloading for MSVC++ Redistributable (x64)"
                ClearErrors
                inetc::get /caption "Microsoft Visual C++ 2010 SP1 Redistributable Package (x64)" "http://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe" "$INSTDIR\vcredist_x64.exe" /end
                pop $0
                StrCmp $0 "OK" dlok2
                MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "Incomplete download, aborting!"
                Abort
                dlok2:
                 
                !insertmacro DEBUG_MSG "Checking MSVC++ Redistributable (x64)"
                md5dll::GetMD5File "$INSTDIR\vcredist_x64.exe"
                Pop $0
                ;DetailPrint "md5: [$0]"
                StrCmp $0 "cbe0b05c11d5d523c2af997d737c137b" md5x64ok
                       MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "Corrupt download, aborting!"
                       Abort
                md5x64ok:

                !insertmacro DEBUG_MSG "Installing MSVC++ Redistributable (x64)"
                retryvsredistx64:
                ExecDos::exec /DETAILED /DISABLEFSR '"$INSTDIR\vcredist_x64.exe" /NoSetupVersionCheck /passive /showfinalerror /promptrestart'
                Pop $0
                StrCmp $0 "0" vcredist64ok
                       StrCmp $0 "5100" askforretryx64 fatalvcredistx64
                       askforretryx64:
                       MessageBox MB_RETRYCANCEL "Another installation is already in progress. Please, finish it and retry." IDRETRY retryvsredistx64 IDABORT abortx64
                       fatalvcredistx64:
                       MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "There was a problem installing Microsoft VC++ 2010 x64 ($0), aborting!"
                       abortx64:
                       Abort
                vcredist64ok:
                Delete "$INSTDIR\vcredist_x64.exe"
        VSRedist2010x64Installed:
        !insertmacro DEBUG_MSG "MSVC++ Redistributable (x64) is installed"
        SetRegView 32
  ${EndIf}

  !insertmacro DEBUG_MSG "Closing MEGAsync"
  ExecDos::exec /DETAILED /DISABLEFSR "taskkill /f /IM MEGAsync.exe"
  ExecDos::exec /DETAILED /DISABLEFSR "taskkill /f /IM MEGAlogger.exe"
  
  !insertmacro DEBUG_MSG "Installing files"
  

!ifndef BUILD_UNINSTALLER  ; if building uninstaller, skip files below
!ifndef ENABLE_QT5
  ;x86_32 files
  File "${QT_PATH}\bin\QtCore4.dll"
  AccessControl::SetFileOwner "$INSTDIR\QtCore4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\QtCore4.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\bin\QtGui4.dll"
  AccessControl::SetFileOwner "$INSTDIR\QtGui4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\QtGui4.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\bin\QtNetwork4.dll"
  AccessControl::SetFileOwner "$INSTDIR\QtNetwork4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\QtNetwork4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\bin\QtXml4.dll"
  AccessControl::SetFileOwner "$INSTDIR\QtXml4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\QtXml4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\bin\QtSvg4.dll"
  AccessControl::SetFileOwner "$INSTDIR\QtSvg4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\QtSvg4.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  SetOutPath "$INSTDIR\imageformats"
  File "${QT_PATH}\plugins\imageformats\qgif4.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats" "$USERNAME" "GenericRead + GenericWrite"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qgif4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qgif4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qico4.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qico4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qico4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qjpeg4.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qjpeg4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qjpeg4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qmng4.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qmng4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qmng4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qsvg4.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qsvg4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qsvg4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qtga4.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qtga4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qtga4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qtiff4.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qtiff4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qtiff4.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  SetOutPath "$INSTDIR\accessible"
  File "${QT_PATH}\plugins\accessible\qtaccessiblecompatwidgets4.dll"
  AccessControl::SetFileOwner "$INSTDIR\accessible" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\accessible" "$USERNAME" "GenericRead + GenericWrite"
  AccessControl::SetFileOwner "$INSTDIR\accessible\qtaccessiblecompatwidgets4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\accessible\qtaccessiblecompatwidgets4.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\accessible\qtaccessiblewidgets4.dll"
  AccessControl::SetFileOwner "$INSTDIR\accessible\qtaccessiblewidgets4.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\accessible\qtaccessiblewidgets4.dll" "$USERNAME" "GenericRead + GenericWrite"
!else
  ;x86_32 files
  File "${QT_PATH}\bin\Qt5Core.dll"
  AccessControl::SetFileOwner "$INSTDIR\Qt5Core.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\Qt5Core.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\bin\Qt5Gui.dll"
  AccessControl::SetFileOwner "$INSTDIR\Qt5Gui.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\Qt5Gui.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\bin\Qt5Widgets.dll"
  AccessControl::SetFileOwner "$INSTDIR\Qt5Widgets.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\Qt5Widgets.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\bin\Qt5Network.dll"
  AccessControl::SetFileOwner "$INSTDIR\Qt5Network.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\Qt5Network.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\bin\Qt5Xml.dll"
  AccessControl::SetFileOwner "$INSTDIR\Qt5Xml.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\Qt5Xml.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\bin\Qt5Svg.dll"
  AccessControl::SetFileOwner "$INSTDIR\Qt5Svg.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\Qt5Svg.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\bin\Qt5Concurrent.dll"
  AccessControl::SetFileOwner "$INSTDIR\Qt5Concurrent.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\Qt5Concurrent.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\bin\icudt54.dll"
  AccessControl::SetFileOwner "$INSTDIR\icudt54.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\icudt54.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\bin\icuin54.dll"
  AccessControl::SetFileOwner "$INSTDIR\icuin54.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\icuin54.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\bin\icuuc54.dll"
  AccessControl::SetFileOwner "$INSTDIR\icuuc54.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\icuuc54.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  SetOutPath "$INSTDIR\imageformats"
  File "${QT_PATH}\plugins\imageformats\qdds.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats" "$USERNAME" "GenericRead + GenericWrite"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qdds.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qdds.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qgif.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qgif.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qgif.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qicns.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qicns.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qicns.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\plugins\imageformats\qico.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qico.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qico.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qjp2.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qjp2.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qjp2.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\plugins\imageformats\qjpeg.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qjpeg.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qjpeg.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qmng.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qmng.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qmng.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qsvg.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qsvg.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qsvg.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qtga.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qtga.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qtga.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qtiff.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qtiff.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qtiff.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${QT_PATH}\plugins\imageformats\qwbmp.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qwbmp.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qwbmp.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\plugins\imageformats\qwebp.dll"
  AccessControl::SetFileOwner "$INSTDIR\imageformats\qwebp.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\imageformats\qwebp.dll" "$USERNAME" "GenericRead + GenericWrite"

  SetOutPath "$INSTDIR\iconengines"
  File "${QT_PATH}\plugins\iconengines\qsvgicon.dll"
  AccessControl::SetFileOwner "$INSTDIR\iconengines" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\iconengines" "$USERNAME" "GenericRead + GenericWrite"
  AccessControl::SetFileOwner "$INSTDIR\iconengines\qsvgicon.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\iconengines\qsvgicon.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  SetOutPath "$INSTDIR\platforms"
  File "${QT_PATH}\plugins\platforms\qwindows.dll"
  AccessControl::SetFileOwner "$INSTDIR\platforms" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\platforms" "$USERNAME" "GenericRead + GenericWrite"
  AccessControl::SetFileOwner "$INSTDIR\platforms\qwindows.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\platforms\qwindows.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  SetOutPath "$INSTDIR\bearer"
  File "${QT_PATH}\plugins\bearer\qgenericbearer.dll"
  AccessControl::SetFileOwner "$INSTDIR\bearer" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\bearer" "$USERNAME" "GenericRead + GenericWrite"
  AccessControl::SetFileOwner "$INSTDIR\bearer\qgenericbearer.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\bearer\qgenericbearer.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${QT_PATH}\plugins\bearer\qnativewifibearer.dll"
  AccessControl::SetFileOwner "$INSTDIR\bearer\qnativewifibearer.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\bearer\qnativewifibearer.dll" "$USERNAME" "GenericRead + GenericWrite"
!endif
          
  SetOutPath "$INSTDIR"
  SetOverwrite on
  AllowSkipFiles off
  File "${SRCDIR_MEGASYNC}\MEGAsync.exe"
  AccessControl::SetFileOwner "$INSTDIR\MEGAsync.exe" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\MEGAsync.exe" "$USERNAME" "GenericRead + GenericWrite"
  
!ifdef BUILD_WITH_LOGGER
  File "${SRCDIR_LOGGER}\MEGAlogger.exe"
  AccessControl::SetFileOwner "$INSTDIR\MEGAlogger.exe" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\MEGAlogger.exe" "$USERNAME" "GenericRead + GenericWrite"
!endif

  File "${SRCDIR_MEGASYNC}\libeay32.dll"
  AccessControl::SetFileOwner "$INSTDIR\libeay32.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\libeay32.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${SRCDIR_MEGASYNC}\ssleay32.dll"
  AccessControl::SetFileOwner "$INSTDIR\ssleay32.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\ssleay32.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${SRCDIR_MEGASYNC}\libcurl.dll"
  AccessControl::SetFileOwner "$INSTDIR\libcurl.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\libcurl.dll" "$USERNAME" "GenericRead + GenericWrite"

  File "${SRCDIR_MEGASYNC}\cares.dll"
  AccessControl::SetFileOwner "$INSTDIR\cares.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\cares.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  File "${SRCDIR_MEGASYNC}\libuv.dll"
  AccessControl::SetFileOwner "$INSTDIR\libuv.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\libuv.dll" "$USERNAME" "GenericRead + GenericWrite"

;!ifndef BUILD_UNINSTALLER  ; if building uninstaller, skip this check
  File "${UNINSTALLER_NAME}"
  AccessControl::SetFileOwner "$INSTDIR\${UNINSTALLER_NAME}" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\${UNINSTALLER_NAME}" "$USERNAME" "GenericRead + GenericWrite"
!endif
  ExecDos::exec /DETAILED /DISABLEFSR "taskkill /f /IM explorer.exe"

  IfFileExists "$INSTDIR\ShellExtX32.dll" 0 new_installation_x32
        GetTempFileName $0
        Delete $0
        Rename "$INSTDIR\ShellExtX32.dll" $0
        Delete /REBOOTOK $0
  new_installation_x32:

  !insertmacro DEBUG_MSG "Registering DLLs"
  
  ; Register shell extension 1 (x86_32)
  !define LIBRARY_COM
  !define LIBRARY_SHELL_EXTENSION
  !insertmacro InstallLib REGDLL NOTSHARED REBOOT_NOTPROTECTED "${SRCDIR_MEGASHELLEXT_X32}\MEGAShellExt.dll" "$INSTDIR\ShellExtX32.dll" "$INSTDIR"
  !undef LIBRARY_COM
  !undef LIBRARY_SHELL_EXTENSION

  AccessControl::SetFileOwner "$INSTDIR\ShellExtX32.dll" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\ShellExtX32.dll" "$USERNAME" "GenericRead + GenericWrite"
  
  ${If} ${RunningX64}
        IfFileExists "$INSTDIR\ShellExtX64.dll" 0 new_installation_x64
                GetTempFileName $0
                Delete $0
                Rename "$INSTDIR\ShellExtX64.dll" $0
                Delete /REBOOTOK $0
        new_installation_x64:
  
        ; Register shell extension 1 (x86_64)
        !define LIBRARY_X64
        !define LIBRARY_COM
        !define LIBRARY_SHELL_EXTENSION
        !insertmacro InstallLib REGDLL NOTSHARED REBOOT_NOTPROTECTED "${SRCDIR_MEGASHELLEXT_X64}\MEGAShellExt.dll" "$INSTDIR\ShellExtX64.dll" "$INSTDIR"
        !undef LIBRARY_X64
        !undef LIBRARY_COM
        !undef LIBRARY_SHELL_EXTENSION
        
        AccessControl::SetFileOwner "$INSTDIR\ShellExtX64.dll" "$USERNAME"
        AccessControl::GrantOnFile "$INSTDIR\ShellExtX64.dll" "$USERNAME" "GenericRead + GenericWrite"
  ${EndIf}

  ${UAC.CallFunctionAsUser} RunExplorer
   
#  !insertmacro DEBUG_MSG "Adding firewall rule"
#  liteFirewall::RemoveRule "$INSTDIR\MEGAsync.exe" "MEGAsync"
#  Pop $0
#  liteFirewall::AddRule "$INSTDIR\MEGAsync.exe" "MEGAsync"
#  Pop $0

  !insertmacro DEBUG_MSG "Creating shortcuts"
  SetRebootFlag false
  StrCmp "CurrentUser" $MultiUser.InstallMode currentuser2
  SetShellVarContext all
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\MEGAsync.lnk" "$INSTDIR\MEGAsync.exe"
  CreateShortCut "$DESKTOP\MEGAsync.lnk" "$INSTDIR\MEGAsync.exe"
  WriteIniStr "$INSTDIR\MEGA Website.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\MEGA Website.lnk" "$INSTDIR\MEGA Website.url" "" "$INSTDIR\MEGAsync.exe" 1
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\${UNINSTALLER_NAME}"
  !insertmacro MUI_STARTMENU_WRITE_END
  goto modeselected2
currentuser2:
  ${UAC.CallFunctionAsUser} CreateMegaShortcuts
modeselected2:

SectionEnd

Function CreateMegaShortcuts
  SetShellVarContext current
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\MEGAsync.lnk" "$INSTDIR\MEGAsync.exe"
  CreateShortCut "$DESKTOP\MEGAsync.lnk" "$INSTDIR\MEGAsync.exe"

!ifdef BUILD_WITH_LOGGER
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\MEGAlogger.lnk" "$INSTDIR\MEGAlogger.exe"
  CreateShortCut "$DESKTOP\MEGAlogger.lnk" "$INSTDIR\MEGAlogger.exe"
!endif

  WriteIniStr "$INSTDIR\MEGA Website.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\MEGA Website.lnk" "$INSTDIR\MEGA Website.url" "" "$INSTDIR\MEGAsync.exe" 1
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\${UNINSTALLER_NAME}"
  !insertmacro MUI_STARTMENU_WRITE_END
FunctionEnd

Section -AdditionalIcons

SectionEnd

Section -Post
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\MEGAsync.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\${UNINSTALLER_NAME}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\MEGAsync.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" ""
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  
  AccessControl::SetFileOwner "$INSTDIR\MEGA Website.url" "$USERNAME"
  AccessControl::GrantOnFile "$INSTDIR\MEGA Website.url" "$USERNAME" "GenericRead + GenericWrite"
  
  Delete "$INSTDIR\NSIS.Library.RegTool*.exe"
SectionEnd

Function un.onInit
!insertmacro MULTIUSER_UNINIT
StrCpy $APP_NAME "${PRODUCT_NAME}"

ReadIniStr $0 "$ExeDir\${MEGA_DATA}" UAC first
${IF} $0 <> 1
	;SetSilent silent
	InitPluginsDir
	WriteIniStr "$PluginsDir\${MEGA_DATA}" UAC first 1
	CopyFiles /SILENT "$EXEPATH" "$PluginsDir\${UNINSTALLER_NAME}"
	ExecWait '"$PluginsDir\${UNINSTALLER_NAME}" _?=$INSTDIR' $0
	SetErrorLevel $0
	Quit
${EndIf}

UAC::RunElevated
  ${Switch} $0
  ${Case} 0
    ${IfThen} $1 = 1 ${|} Quit ${|} ;User process. The installer has finished. Quit.
    ${IfThen} $3 <> 0 ${|} ${Break} ${|} ;Admin process, continue the installation
    ${If} $1 = 3 ;RunAs completed successfully, but with a non-admin user
      ;MessageBox mb_YesNo|mb_IconExclamation|mb_TopMost|mb_SetForeground "This requires admin privileges, try again" /SD IDNO IDYES uac_tryagain IDNO 0
      Quit
    ${EndIf}
  ${Case} 1223
    ;MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "This requires admin privileges, aborting!"
    Quit
  ${Default}
    MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "This installer requires Administrator privileges. Error $0"
    Quit
  ${EndSwitch}

!insertmacro MUI_UNGETLANGUAGE
FunctionEnd

Function un.UninstallSyncs
  ExecDos::exec "$INSTDIR\MEGAsync.exe /uninstall"
FunctionEnd

Section Uninstall
  ExecDos::exec /DETAILED "taskkill /f /IM MEGASync.exe"
  Sleep 1000
  ${UAC.CallFunctionAsUser} un.UninstallSyncs
  Sleep 1000

  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\${UNINSTALLER_NAME}"

  ;QT4 files
  Delete "$INSTDIR\QtNetwork4.dll"
  Delete "$INSTDIR\QtGui4.dll"
  Delete "$INSTDIR\QtCore4.dll"
  Delete "$INSTDIR\QtSvg4.dll"
  Delete "$INSTDIR\QtXml4.dll"
  Delete "$INSTDIR\imageformats\qgif4.dll"
  Delete "$INSTDIR\imageformats\qico4.dll"
  Delete "$INSTDIR\imageformats\qjpeg4.dll"
  Delete "$INSTDIR\imageformats\qmng4.dll"
  Delete "$INSTDIR\imageformats\qsvg4.dll"
  Delete "$INSTDIR\imageformats\qtga4.dll"
  Delete "$INSTDIR\imageformats\qtiff4.dll"
  
  ;QT5 files
  Delete "$INSTDIR\Qt5Core.dll"
  Delete "$INSTDIR\Qt5Gui.dll"
  Delete "$INSTDIR\Qt5Widgets.dll"
  Delete "$INSTDIR\Qt5Network.dll"
  Delete "$INSTDIR\Qt5Xml.dll"
  Delete "$INSTDIR\Qt5Svg.dll"
  Delete "$INSTDIR\Qt5Concurrent.dll"
  Delete "$INSTDIR\icudt53.dll"
  Delete "$INSTDIR\icuin53.dll"
  Delete "$INSTDIR\icuuc53.dll"
  Delete "$INSTDIR\icudt54.dll"
  Delete "$INSTDIR\icuin54.dll"
  Delete "$INSTDIR\icuuc54.dll"
  Delete "$INSTDIR\imageformats\qdds.dll"
  Delete "$INSTDIR\imageformats\qgif.dll"
  Delete "$INSTDIR\imageformats\qicns.dll"
  Delete "$INSTDIR\imageformats\qico.dll"
  Delete "$INSTDIR\imageformats\qjp2.dll"
  Delete "$INSTDIR\imageformats\qjpeg.dll"
  Delete "$INSTDIR\imageformats\qmng.dll"
  Delete "$INSTDIR\imageformats\qsvg.dll"
  Delete "$INSTDIR\imageformats\qtga.dll"
  Delete "$INSTDIR\imageformats\qtiff.dll"
  Delete "$INSTDIR\imageformats\qwbmp.dll"
  Delete "$INSTDIR\imageformats\qwebp.dll"
  Delete "$INSTDIR\accessible\qtaccessiblecompatwidgets4.dll"
  Delete "$INSTDIR\accessible\qtaccessiblewidgets4.dll"
  Delete "$INSTDIR\iconengines\qsvgicon.dll"
  Delete "$INSTDIR\platforms\qwindows.dll"
  Delete "$INSTDIR\bearer\qgenericbearer.dll"
  Delete "$INSTDIR\bearer\qnativewifibearer.dll"
  
  ;Common files
  Delete "$INSTDIR\MEGAsync.exe"
  Delete "$INSTDIR\MEGAlogger.exe"
  Delete "$INSTDIR\libeay32.dll"
  Delete "$INSTDIR\ssleay32.dll"
  Delete "$INSTDIR\libcurl.dll"
  Delete "$INSTDIR\cares.dll"
  Delete "$INSTDIR\libuv.dll"
  Delete "$INSTDIR\NSIS.Library.RegTool*.exe"

  !define LIBRARY_COM
  !define LIBRARY_SHELL_EXTENSION
  !insertmacro UnInstallLib REGDLL NOTSHARED NOREMOVE "$INSTDIR\ShellExtX32.dll"
  !undef LIBRARY_COM
  !undef LIBRARY_SHELL_EXTENSION
  
  GetTempFileName $0
  Delete $0
  Rename "$INSTDIR\ShellExtX32.dll" $0
  Delete /REBOOTOK $0
  
  ${If} ${RunningX64}
        !define LIBRARY_X64
        !define LIBRARY_COM
        !define LIBRARY_SHELL_EXTENSION
        !insertmacro UnInstallLib REGDLL NOTSHARED NOREMOVE "$INSTDIR\ShellExtX64.dll"
        !undef LIBRARY_X64
        !undef LIBRARY_COM
        !undef LIBRARY_SHELL_EXTENSION

        GetTempFileName $0
        Delete $0
        Rename "$INSTDIR\ShellExtX64.dll" $0
        Delete /REBOOTOK $0
  ${EndIf}
  
  SetShellVarContext current
  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\MEGA Website.lnk"
  Delete "$INSTDIR\MEGA Website.url"
  Delete "$DESKTOP\MEGAsync.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\MEGAsync.lnk"
  Delete "$DESKTOP\MEGAlogger.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\MEGAlogger.lnk"
  System::Call 'shell32::SHGetSpecialFolderPath(i $HWNDPARENT, t .r1, i ${CSIDL_STARTUP}, i0)i.r0'
  Delete "$1\MEGAsync.lnk"
  Delete "$1\MEGAlogger.lnk"
  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\imageformats"
  RMDir "$INSTDIR\iconengines"
  RMDir "$INSTDIR\platforms"
  RMDir "$INSTDIR\bearer"
  RMDir "$INSTDIR"
  
  SetShellVarContext all
  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\MEGA Website.lnk"
  Delete "$INSTDIR\MEGA Website.url"
  Delete "$DESKTOP\MEGAsync.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\MEGAsync.lnk"
  Delete "$DESKTOP\MEGAlogger.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\MEGAlogger.lnk"
  System::Call 'shell32::SHGetSpecialFolderPath(i $HWNDPARENT, t .r1, i ${CSIDL_STARTUP}, i0)i.r0'
  Delete "$1\MEGAsync.lnk"
  Delete "$1\MEGAlogger.lnk"
  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\imageformats"
  RMDir "$INSTDIR\iconengines"
  RmDir "$INSTDIR\accessible"
  RMDir "$INSTDIR\platforms"
  RMDir "$INSTDIR\bearer"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
  SetRebootFlag false
SectionEnd
