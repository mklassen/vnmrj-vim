if did_filetype()
   finish
endif

let s:line1 = getline(1)

if s:line1 =~ '[vV][nN][mM][rR]'
   set ft=magical
elseif s:line1 =~ '[mM][aA][gG][iI][cC][aA][lL]'
   set ft=magical
elseif s:line1 =~ '[vV]arian'
   set ft=magical
elseif s:line1 =~ '@(#)'
   set ft=magical
endif

unlet s:line1
