# Fish git prompt features
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'git'
set __fish_git_prompt_showcolorhints 'yes'

# Fish git prompt separators
set __fish_git_prompt_char_stateseparator '/'
set __fish_git_prompt_char_upstream_prefix '/'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_ahead '↓'

function fish_prompt
  printf '%s ' (date "+%H:%M:%S")

  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s $ ' (__fish_git_prompt)

  set_color normal
end
