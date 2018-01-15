#!/usr/bin/pwsh
$deinDirectoryName = 'dein'
$deinInstallerURL = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'

$editorConfigGitRepository = 'https://github.com/editorconfig/editorconfig-core-c.git'

function Install-EditorConfig () {
    git clone $editorConfigGitRepository /tmp/editorconfig
    New-Item -Path /tmp/editorconfig/build -Name build -ItemType Directory
    Push-Location /tmp/editorconfig/build
    cmake ..
    make
    sudo make install
    Pop-Location
}

# Install dein
curl -o - $deinInstallerURL | bash -s -- $deinDirectoryName

# Install editorconfig
Install-EditorConfig

exit 0