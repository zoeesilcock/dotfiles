if expand("%") =~# '_spec\.rb$' |
  compiler rspec | setl makeprg=rspec\ $*|
else |
  compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
endif
