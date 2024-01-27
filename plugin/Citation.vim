 " citation config
 autocmd Filetype markdown :call Deletechace()

 function Deletechace()
     silent exec "!del D:\\Zotero\\citation_vim_cache"
 endfunction

 let g:citation_vim_bibtex_file="D:\\\\Zotero\\\\m.bib"
 let g:citation_vim_mode="bibtex"

 "let g:citation_vim_reverse_order=1
 let g:citation_vim_cache_path='D:\\\\Zotero'

 "let g:citation_vim_zotero_attachment_path="D:\\\\Zotero\\\\storage"
 "let g:citation_vim_et_al_limit=2
 "let g:citation_vim_reverse_order=0

 " citation map

 nmap <leader>u [unite]
 nnoremap [unite] <nop>
 nnoremap <silent>[unite]c       :<C-u>Unite -buffer-name=citation-start-insert -default-action=append      citation/key<cr>
 nnoremap <silent>[unite]co :<C-u>Unite -input=<C-R><C-W> -default-action=start -force-immediately citation/file<cr>
 nnoremap <silent><leader>cu :<C-u>Unite -input=<C-R><C-W> -default-action=start -force-immediately citation/url<cr>
 nnoremap <silent>[unite]cf :<C-u>Unite -input=<C-R><C-W> -default-action=file -force-immediately citation/file<cr>
 nnoremap <silent>[unite]cf :<C-u>Unite -input=<C-R><C-W> -default-action=file -force-immediately citation/file<cr>
 nnoremap <silent>[unite]cs :<C-u>Unite  -default-action=yank  citation/key:<C-R><C-W><cr>


map <silent><leader>cp :!pandoc --pdf-engine=xelatex % -o %:r.pdf -V mainfont="SimSun"  --citeproc --bibliography="D:\\Zotero\\m.bib" --csl D:\personal\styles\china-national-standard-gb-t-7714-2015-author-date.csl<CR>
map <silent><F9> :!pandoc --pdf-engine=xelatex % -o %:r.html -V mainfont="SimSun"  --citeproc --bibliography="D:\\Zotero\\m.bib" --csl D:\personal\styles\american-psychological-association-7th-edition(personal).csl --css=https://benjam.info/panam/styling.css -s<CR>
map <silent><leader>cw :!pandoc --pdf-engine=xelatex % -o %:r.docx -V mainfont="SimSun"  --citeproc --bibliography="D:\\Zotero\\m.bib" --csl D:\personal\styles\china-national-standard-gb-t-7714-2015-author-date.csl<CR>
map <silent><leader>cq :!pandoc --pdf-engine=xelatex % -t beamer -o %:r.pdf -V mainfont="SimSun"  --citeproc --bibliography="D:\\Zotero\\m.bib" --csl D:\personal\styles\china-national-standard-gb-t-7714-2015-author-date.csl<CR>
