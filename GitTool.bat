@echo off
@echo Git-Tool

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
@echo ｜%BranchName%
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜No｜ Menu
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜ 0｜ Status
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜ 1｜ Update(Fetch)+(Merge)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜ 2｜ Commit(Add) + (Commit)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜ Q｜ Quit(終了)
@echo  −−−−−−−−−−−−−−−−−−−−
@echo ｜　　　　　　　    　　■■
@echo ｜Git-Tool　　　　　    ■■     
@echo ｜　　　　　　　　　　　    ■   ogaland
@echo  −−−−−−−−−−−−−−−−−−−−
@echo  メニューNoを入力して [ENTER]で決定
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

goto MainMenu

:Commit_1





goto MainMenu

GOTO END_X

:ErrTrap


:END_X

