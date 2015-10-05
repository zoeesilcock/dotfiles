map <buffer> gr :Grep <C-R>=shellescape(fnamemodify(expand('%').'/'.getline('.'),':.'),1)<CR><Home><C-Right><Space>
