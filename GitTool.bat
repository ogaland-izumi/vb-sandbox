@echo off
rem chcp 65001

IF "%1" == "" (
    @ECHO ÉuÉâÉìÉ`éwíËÇ™Ç†ÇËÇ‹ÇπÇÒ
    pause 	
    GOTO END_X
)  

SET BranchName=%1

echo %BranchName%

:MainMenu

CLS

git checkout %BranchName%

@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb ActiveBranch:%BranchName%
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb0: Status
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb1: Update(Fetch)+(Merge)
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb2: Commit(Add) + (Commit)
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb3: Push
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo ÅbQ: Quit(èIóπ)
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo ÅbÅ@Å@Å@Å@Å@Å@Å@    Å@Å@Å°Å°
@echo ÅbGit-ToolÅ@Å@Å@Å@Å@    Å°Å°     
@echo ÅbÅ@Å@Å@Å@Å@Å@Å@Å@Å@Å@Å@    Å°   ogaland
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
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
@echo  ÉRÉ~ÉbÉgÉÅÉbÉZÅ[ÉWÇì¸óÕå„ [ENTER]Ç≈åàíË

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

@echo  ÉRÉ~ÉbÉgÉÅÉbÉZÅ[ÉWÇì¸óÕÇµÇƒâ∫Ç≥Ç¢ÅB
pause

GOTO MainMenu

rem /////////////////////////////////////////////

:ErrTrap


GOTO MainMenu
rem /////////////////////////////////////////////



:END_X

