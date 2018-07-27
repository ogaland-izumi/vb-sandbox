@echo off
@echo Git-Tool

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
@echo Åb%BranchName%
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo ÅbNoÅb Menu
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb 0Åb Status
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb 1Åb Update(Fetch)+(Merge)
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb 2Åb Commit(Add) + (Commit)
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo Åb QÅb Quit(èIóπ)
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo ÅbÅ@Å@Å@Å@Å@Å@Å@    Å@Å@Å°Å°
@echo ÅbGit-ToolÅ@Å@Å@Å@Å@    Å°Å°     
@echo ÅbÅ@Å@Å@Å@Å@Å@Å@Å@Å@Å@Å@    Å°   ogaland
@echo  Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|Å|
@echo  ÉÅÉjÉÖÅ[NoÇì¸óÕÇµÇƒ [ENTER]Ç≈åàíË
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

