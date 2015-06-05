if test -d "/usr/local/bin"
  set --universal fish_user_paths "/usr/local/bin" $fish_user_paths
end

if test -d "/usr/local/heroku/bin"
  set --universal fish_user_paths "/usr/local/heroku/bin" $fish_user_paths
end

if test -d "/Users/zoee/Library/Android/sdk/platform-tools"
  set --universal fish_user_paths "/Users/zoee/Library/Android/sdk/platform-tools" $fish_user_paths
end
