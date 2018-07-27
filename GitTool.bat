@echo off
rem chcp 65001

IF "%1" == "" (
    @ECHO ブランチ指定がありません
    pause 	
    GOTO END_X
)  

SET BranchName=%1

echo %BranchName%

:MainMenu

CLS

git checkout %BranchName%

@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜ ActiveBranch:%BranchName%
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜0: Status
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜1: Update(Fetch)+(Merge)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜2: Commit(Add) + (Commit)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜3: Push
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜Q: Quit(終了)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜　　　　　　　    　　■■
@echo ｜Git-Tool　　　　　    ■■     
@echo ｜　　　　　　　　　　　    ■   ogaland
@echo  −−−−−−−−−−−−−−−−−−−−
@echo  Select-MenuID

git symbolic-ref --short HEAD

set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "0" (goto Status_1)
if /i "%input%" == "1" (goto Update_1)
if /i "%input%" == "2" (goto Commit_1)
if /i "%input%" == "3" (goto Push_1)
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
@echo  コミットメッセージを入力後 [ENTER]で決定

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

:Push_1

git push

pause

GOTO MainMenu
rem /////////////////////////////////////////////

:Commit_Error

@echo  コミットメッセージを入力して下さい。
pause

GOTO MainMenu

rem /////////////////////////////////////////////

:ErrTrap


GOTO MainMenu
rem /////////////////////////////////////////////



:END_X

