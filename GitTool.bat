@echo off

IF "%1" == "" (
    @ECHO ブランチ指定がありません
    pause 	
    GOTO END_X
)  

SET LANG=ja_JP.UTF-8
SET BranchName=%1

echo %BranchName%

:MainMenu

CLS

git checkout %BranchName%
git symbolic-ref --short HEAD

@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜No｜ ActiveBranch:%BranchName%
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜0 ｜ Status
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜1 ｜Update(Fetch)+(Merge)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜2 ｜Commit(Add) + (Commit) 
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜3 ｜Push
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜9 ｜Commit(Add) + (Commit) (CRLF)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜G ｜Graph(log --graph)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜Q ｜Quit(終了)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜　　　　　　　    　　■■
@echo ｜Git-Tool　　　　　    ■■     
@echo ｜　　　　　　　　　　　    ■   ogaland
@echo  −−−−−−−−−−−−−−−−−−−−
@echo  メニューNoを選択して下さい。


set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "0" (goto Status_1)
if /i "%input%" == "1" (goto Update_1)
if /i "%input%" == "2" (goto Commit_1)
if /i "%input%" == "3" (goto Push_1)
if /i "%input%" == "9" (goto Commit_2)
if /i "%input%" == "G" (goto GRAPH_X)
if /i "%input%" == "g" (goto GRAPH_X)
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
git merge origin

pause

git checkout %BranchName%
git merge develop
git merge origin

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

git config --local core.autocrlf input
git add -A
git commit -m "%commitMessage%"

git status

pause

GOTO MainMenu
rem /////////////////////////////////////////////

:Commit_2
CLS
@echo  CRLF有効モードでコミットします
@echo  コミットメッセージを入力後 [ENTER]で決定

set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "" (goto Commit_Error)

set commitMessage=%input%

git config --local core.autocrlf false
git add -A
git commit -m "%commitMessage%"
git config --local core.autocrlf input

git status

pause

GOTO MainMenu
rem /////////////////////////////////////////////


:Push_1

git push origin %BranchName%:%BranchName%

pause

GOTO MainMenu
rem /////////////////////////////////////////////

:Commit_Error

@echo  コミットメッセージを入力して下さい。
pause

GOTO MainMenu

rem /////////////////////////////////////////////
:Graph_X

git log --graph

GOTO MainMenu
rem /////////////////////////////////////////////


:ErrTrap


GOTO MainMenu
rem /////////////////////////////////////////////



:END_X

