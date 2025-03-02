param(
	[Parameter(Mandatory=$true)][object]$IsRelease
)

$bump = $IsRelease -eq "1" ? 1 : 2;

$solutionDir = $PSScriptRoot;
$projectFile = "$solutionDir/VpnHood.AppLib.Assets.ClassicSpa/VpnHood.AppLib.Assets.ClassicSpa.csproj";

# pulling
Write-Host "pulling..." -ForegroundColor Magenta;
git --git-dir=$gitDir --work-tree=$solutionDir pull;

# bump version
Write-Host "Increasing version..." -ForegroundColor Magenta;
. "$PSScriptRoot/pub/VersionBump.ps1" -versionFile "$PSScriptRoot/pub/PubVersion.json" -bump $bump;
UpdateProjectVersion($projectFile);

# commit
Write-Host "Commiting current branch..." -ForegroundColor Magenta;
$gitDir = "$solutionDir/.git";
git --git-dir=$gitDir --work-tree=$solutionDir commit -a -m "Publish";

# push to current branch
Write-Host "Pushing the current branch..." -ForegroundColor Magenta;
git --git-dir=$gitDir --work-tree=$solutionDir push;

# psuh to build
$branch = $IsRelease -eq "1" ? "main" : "prerelease";
Write-Host "Pushing to $branch branch..." -ForegroundColor Magenta;
git --git-dir=$gitDir --work-tree=$solutionDir push origin dev:$branch