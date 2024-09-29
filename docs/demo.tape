Set Shell bash
Set FontSize 20
Set FontFamily "Hack Nerd Font"
Set Width 1280
Set Height 720
Set WindowBar Colorful
Set Margin 20
Set MarginFill "#FFFFFF"
Set BorderRadius 5
Set Framerate 60
Type "cd ~/git/ansible_meetup/"
Enter
Type "source .venv/bin/activate"
Enter
Type "cd ansible/"
Enter
Type "ansible-navigator run tasks/main.yml --limit 'servers' -v"
Enter
Set PlaybackSpeed 1.6
Sleep 60.0s
Set PlaybackSpeed 1.0
Type "deactivate"
Enter
Output ansible_linux_macos.gif
Output ansible_linux_macos.mp4
