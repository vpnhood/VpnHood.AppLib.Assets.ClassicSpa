$solutionDir = $PSScriptRoot;
$projectFile = "$solutionDir/VpnHood.AppLib.Assets.ClassicSpa/VpnHood.AppLib.Assets.ClassicSpa.cproj";

# get the latest version
$gitDir = "$solutionDir/.git";
git --git-dir=$gitDir --work-tree=$solutionDir commit -a -m "Publish";
git --git-dir=$gitDir --work-tree=$solutionDir pull;

# bump version
. "$PSScriptRoot/pub/VersionBump.ps1" -versionFile "$PSScriptRoot/pub/PubVersion.json" -bump 1;
# update project version
UpdateProjectVersion($projectFile);
# push the new version
#git --git-dir=$gitDir --work-tree=$solutionDir push;

# swtich to main branch 681
#git --git-dir=$gitDir push origin dev:main