" original from here: https://github.com/vim-pandoc/vim-pandoc-syntax/blob/master/syntax/pandoc.vim
syn match myListItem /^>\=\s*[*]\s/ skipempty display
syn match listItemBullet /^>\=\s*\zs[*]/ contained containedin=myListItem conceal cchar=‣

syn match myListItem /^>\=\s*[+]\s/ skipempty display
syn match listItemBullet /^>\=\s*\zs[+]/ contained containedin=myListItem conceal cchar=◆

syn match myListItem /^>\=\s*[-]\s/ skipempty display
syn match listItemBullet /^>\=\s*\zs[-]/ contained containedin=myListItem conceal cchar=•

" ••◉●◆‣
