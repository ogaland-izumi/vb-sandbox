@echo off
@echo Git-Tool

IF "%1" == "" (
    @ECHO �u�����`�w�肪����܂���
    pause 	
    GOTO END_X
)  

SET BranchName=%1

echo %BranchName%

:MainMenu

CLS

git checkout %BranchName%

@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b%BranchName%
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �bNo�b Menu
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b 0�b Status
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b 1�b Update(Fetch)+(Merge)
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b 2�b Commit(Add) + (Commit)
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b Q�b Quit(�I��)
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b�@�@�@�@�@�@�@    �@�@����
@echo �bGit-Tool�@�@�@�@�@    ����     
@echo �b�@�@�@�@�@�@�@�@�@�@�@    ��   ogaland
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo  ���j���[No����͂��� [ENTER]�Ō���
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

