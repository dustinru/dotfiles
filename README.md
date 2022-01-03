# dotfiles

Terminal Theme(s): One Dark (Atom), Nord, Dracula
*One Dark:*
[Colors]
DefaultColorScheme=0
Black=33,37,43
BoldBlack=33,37,43
Red=224,108,117
BoldRed=224,108,117
Green=152,195,121
BoldGreen=152,195,121
Yellow=229,192,123
BoldYellow=229,192,123
Blue=97,175,239
BoldBlue=97,175,239
Magenta=198,120,221
BoldMagenta=198,120,221
Cyan=86,182,194
BoldCyan=86,182,194
White=171,178,191
BoldWhite=171,178,191
ForegroundColour=171,178,191
BackgroundColour=33,37,43
CursorColour=171,178,191
SyntaxType=2

Configure your terminal to use this font:
- **iTerm2**: Type `p10k configure` and answer `Yes` when asked whether to install
     *Meslo Nerd Font*. Alternatively, open *iTerm2 → Preferences → Profiles → Text* and set *Font* to
     `MesloLGS NF`.
- **Visual Studio Code**: Open *File → Preferences → Settings* (PC) or
     *Code → Preferences → Settings* (Mac), enter `terminal.integrated.fontFamily` in the search box at
     the top of *Settings* tab and set the value below to `MesloLGS NF`.
     Consult [this screenshot](
       https://raw.githubusercontent.com/romkatv/powerlevel10k-media/389133fb8c9a2347929a23702ce3039aacc46c3d/visual-studio-code-font-settings.jpg)
     to see how it should look like or see [this issue](
       https://github.com/romkatv/powerlevel10k/issues/671) for extra information.
- **MobaXterm**: Open *Settings* → *Configuration* → *Terminal* → (under *Terminal look and feel*)
     and change *Font* to `MesloLGS NF`.
- **Windows Terminal** by Microsoft (the new thing): Open `settings.json` (<kbd>Ctrl+Shift+,</kbd>),
     search for `fontFace` and set the value to `MesloLGS NF` for every profile. If you don't find
     `fontFace`, add it under *profiles → defaults*. See [this settings file](
       https://raw.githubusercontent.com/romkatv/dotfiles-public/aba0e6c4657d705ed6c344d700d659977385f25c/dotfiles/microsoft-terminal-settings.json)
     for example.
