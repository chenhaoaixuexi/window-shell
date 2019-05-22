Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
function chgit 
{
	git add .
	git  commit 
	git push
}