# emacs-like bindings
remap 'C-b', to: 'Left'
remap 'C-f', to: 'Right'
remap 'C-p', to: 'Up'
remap 'C-n', to: 'Down'

window class_not: %w[slack google-chrome gnome-terminal-server urxvt Focus-Proxy-Window] do
  remap 'M-b', to: 'Ctrl-Left'
  remap 'M-f', to: 'Ctrl-Right'

  remap 'C-a', to: 'Alt-C-a'
  remap 'C-e', to: 'Alt-C-e'

  remap 'C-k', to: 'Alt-C-k'

  remap 'C-d', to: 'Delete'
  remap 'M-d', to: 'Ctrl-Delete'

  remap 'C-w', to: ['Ctrl-Shift-Left', 'Delete']
end

window class_only: %w[google-chrome slack] do
  remap 'M-b', to: 'Ctrl-Left'
  remap 'M-f', to: 'Ctrl-Right'

  remap 'C-a', to: 'Home'
  remap 'C-e', to: 'End'
  remap 'C-k', to: ['Shift-End', 'Delete']
end
