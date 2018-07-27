@echo off
rem chcp 65001

IF "%1" == "" (
    @ECHO ƒuƒ‰ƒ“ƒ`w’è‚ª‚ ‚è‚Ü‚¹‚ñ
    pause 	
    GOTO END_X
)  

SET BranchName=%1

echo %BranchName%

:MainMenu

CLS

pause

git checkout %BranchName%


@echo ActiveBranch:%BranchName%
@echo @
@echo 0: Status
@echo 1: Update(Fetch)+(Merge)
@echo 2: Commit(Add) + (Commit)
@echo Q: Quit(I—¹)
rem @echo  ||||||||||||||||||||
rem @echo b@@@@@@@    @@¡¡
rem @echo bGit-Tool@@@@@    ¡¡     
rem @echo b@@@@@@@@@@@    ¡   ogaland
rem @echo  ||||||||||||||||||||
@echo  Select-MenuID

git symbolic-ref --short HEAD


set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "0" (goto Status_1)
if /i "%input%" == "1" (goto Update_1)
if /i "%input%" == "2" (goto Commit_1)
if /i "%input%" == "Q" (goto END_X)
if /i "%input%" == "q" (goto END_X)

goto MainMenu

:Status_1

git checkout %BranchName%
git status

pause

goto MainMenu

:Update_1

git checkout develop
git fetch
git merge

git checkout %BranchName%
git merge develop

pause

GOTO MainMenu
rem /////////////////////////////////////////////

:Commit_1
CLS
@echo  ƒRƒ~ƒbƒgƒƒbƒZ[ƒW‚ğ“ü—ÍŒã [ENTER]‚ÅŒˆ’è

set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "" (goto Commit_Error)

set commitMessage=%input%

git add -A
git commit -m "%commitMessage%"

git status

pause

GOTO MainMenu
rem /////////////////////////////////////////////

:Commit_Error



GOTO MainMenu
rem /////////////////////////////////////////////

:ErrTrap


GOTO MainMenu
rem /////////////////////////////////////////////



:END_X

