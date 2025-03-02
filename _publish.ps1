param(
	[Parameter(Mandatory=$true)][object]$IsRelease
)

$bump = $IsRelease -eq "1" ? 1 : 2;

$solutionDir = $PSScriptRoot;
$projectFile = "$solutionDir/VpnHood.AppLib.Assets.ClassicSpa/VpnHood.AppLib.Assets.ClassicSpa.csproj";

# get the latest version
Write-Host "Commit and get pull the lastest" -ForegroundColor Magenta;
$gitDir = "$solutionDir/.git";
git --git-dir=$gitDir --work-tree=$solutionDir commit -a -m "Publish";
git --git-dir=$gitDir --work-tree=$solutionDir pull;

# bump version
Write-Host "Increasing version" -ForegroundColor Magenta;
. "$PSScriptRoot/pub/VersionBump.ps1" -versionFile "$PSScriptRoot/pub/PubVersion.json" -bump $bump;
UpdateProjectVersion($projectFile);

# push the new version
Write-Host "Push to current branch" -ForegroundColor Magenta;
git --git-dir=$gitDir --work-tree=$solutionDir push;

# psuh to build
Write-Host "Pushing to main branch" -ForegroundColor Magenta;
$branch = $IsRelease -eq "1" ? "main" : "prerelease";
git --git-dir=$gitDir push origin dev:$branch