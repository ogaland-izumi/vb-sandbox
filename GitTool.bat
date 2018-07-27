@echo off

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
git symbolic-ref --short HEAD

pause

@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �bNo�b ActiveBranch:%BranchName%
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b0 �b Status
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b1 �bUpdate(Fetch)+(Merge)
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b2 �bCommit(Add) + (Commit)
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b3 �bPush
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �bQ �bQuit(�I��)
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo �b�@�@�@�@�@�@�@    �@�@����
@echo �bGit-Tool�@�@�@�@�@    ����     
@echo �b�@�@�@�@�@�@�@�@�@�@�@    ��   ogaland
@echo  �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
@echo  ���j���[No��I�����ĉ������B


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
@echo  �R�~�b�g���b�Z�[�W����͌� [ENTER]�Ō���

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

@echo  �R�~�b�g���b�Z�[�W����͂��ĉ������B
pause

GOTO MainMenu

rem /////////////////////////////////////////////

:ErrTrap


GOTO MainMenu
rem /////////////////////////////////////////////



:END_X

