if test -d "~/Projects/mndx-dev/bin"
  set --universal fish_user_paths "~/Projects/mndx-dev/bin" $fish_user_paths
end

if test -d "~/Projects/mndx/bin"
  alias mnd "bash ~/Projects/mnd/bin/mnd"
end
