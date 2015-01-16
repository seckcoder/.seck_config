" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	let login = $USER
	elseif $LOGNAME != ''
	let login = $LOGNAME
	else
	let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	let hostname = $HOSTNAME
	else
	let hostname = system('hostname -f')
	if v:shell_error
	let hostname = 'localhost'
	endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
"color scheme
colorscheme freya
autocmd BufNewFile,BufRead *.cg setf cg
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
autocmd BufNewFile,BufRead *.js set syntax=jquery
autocmd BufNewFile,BufRead *.ki set syntax=racket
if(has("win32") || has("win95") || has("win64") || has("win16")) "whether it's windows
    let g:iswindows=1
else
    let g:iswindows=0
endif
"autocmd BufEnter * lcd %:p:h
set nocompatible "vim compatible with vi is unnecessary for me
syntax off
" BEGIN vundle
filetype off

" pathogen
execute pathogen#infect()
syntax on
if has("autocmd") "test autocmd support
    filetype plugin indent on
    augroup vimrcEx "autocmd group name for the following autocmd
	au!
	autocmd FileType text setlocal textwidth=78 "text width for text
	autocmd BufReadPost *
		    \ if line("'\'") > 1 && line("'\'") <= line("$") |
		    \ exe "normal! g`\"" |
		    \ endif

    augroup END
else
    set autoindent
endif

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" END vundle

set number
set ruler
set shiftwidth=4
set tabstop=4
set expandtab
set vb t_vb= "stop bell
set nowrap
set hlsearch
set incsearch
set backspace=indent,eol,start whichwrap+=<,>,[,]
set go="no menu,toolbar
if(g:iswindows==1) "允许鼠标的使用
    "防止linux终端下无法拷贝
    if has('mouse')
        set mouse=a
    endif
    au GUIEnter * simalt ~x
endif

"nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
"authorinfo
let g:vimrc_author='seckcoder'
let g:vimrc_email='seckcoder@gmail.com'
let g:vimrc_homepage='NULL'
"nmap <F3> :AuthorInfoDetect<CR>

"Doxygen
"map fg : Dox<cr>
let g:DoxygenToolkit_authorName="seckcoder"
let g:DoxygenToolkit_licenseTag="No License\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief \t"
let g:DoxygenToolkit_paramTag_pre = "@param \t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_namespaceName = "yes"
let g:DoxygenToolkit_briefTag_className = "yes"
let g:DoxygenToolkit_briefTag_structName = "yes"
let g:DoxygenToolkit_briefTag_enumName = "yes"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_post = "<++>"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
let g:DoxygenToolkit_compactOneLineDoc = "yes"
let g:DoxygenToolkit_commentType = "C++"

"Conque_term
nmap ct : ConqueTerm<space>
nmap ctb : ConqueTerm bash<cr>
nmap csb : ConqueTermSplit bash<cr>
nmap cvb : ConqueTermVSplit bash<cr>
nmap ctt : ConqueTermTab bash<cr>
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 1
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_StartMessages = 1

"encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb18030,default,latin1
"Fencview plugin
let g:fencview_autodetect=1
" map <F2> :FencView<cr>

map <C-t> :tabnew<CR>
map [t :tabprev<CR>
map ]t :tabnext<CR>

"thrift
au BufNewFile,BufRead *.thrift setf cpp
au BufNewFile,BufRead *.less setf css
au BufNewFile,BufRead YBUILD setf python

set cc=80
"set textwidth=80  "automatic newline
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#DynamicHighlighting = 1
let vimclojure#WantNailgun = 0
let vimclojure#SplitPos = "left"
let vimclojure#SplitSize = 60
let vimclojure#FuzzyIndent = 1
let vimclojure#UseErrorBuffer = 0  "check :message for errors

"nerdcommenter
let g:NERDCustomDelimiters = {
    \ 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' }
    \}

"html
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_autotags = "th,td,tr,tfoot,thead"

if has("gui_running")
    if has('win32')
        set guifont=Consolas:h11:cANSI
    elseif has('mac')
        set guifont=Menlo\ Regular:h18
    elseif has('unix')
        set guifont=Andale\ Mono\ 12
    endif
"  if has("gui_gtk2")
    "set guifont=Andale\ Mono\ 12
    "set guifont=Courier\ New\ 12
    "set guifont=Inconsolata\ 12
  "elseif has("gui_win32")
    "set guifont=Consolas:h11:cANSI
  "endif
endif

"Merlin
let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"

"ocp indent
function! PreserveExec(expr)
  let l:pos = getpos(".")
  let l:winview = winsaveview()
  try
    execute(a:expr)
  finally
    call setpos(".", l:pos)
    call winrestview(l:winview)
  endtry
endfunction

function! OcpIndentRange() range
  let l:ocp_indent_binary = exists("g:ocp_indent_binary") ? g:ocp_indent_binary : "ocp-indent"
  call PreserveExec(':%!' . l:ocp_indent_binary . ' -l ' . a:firstline . '-' . a:lastline)
endfunction

function! OcpIndentBuffer()
  let l:ocp_indent_binary = exists("g:ocp_indent_binary") ? g:ocp_indent_binary : "ocp-indent"
  call PreserveExec(':%!' . l:ocp_indent_binary)
endfunction


au FileType ocaml vnoremap <LocalLeader>i :call OcpIndentRange()<CR>
au FileType ocaml nnoremap <LocalLeader>i :call OcpIndentBuffer()<CR>
au FileType ocaml map == :call OcpIndentRange()<CR>
au FileType ocaml vnoremap = :call OcpIndentRange()<CR>
set rtp+=~/.vim/bundle/ocp-indent-vim
" Use super tab for ocaml completion
" Disabled because of conflict with neocomplete
" au FileType ocaml call SuperTabSetDefaultCompletionType("<c-x><c-o>")


"omni complete

" Enable omni complete
set omnifunc=syntaxcomplete#Complete


" Neo complete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : ''
    \}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'

" syntastic
" syntastic for ocaml is buggy and horrible
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_haskell_checkers = ['ghc']
let g:syntastic_cpp_compiler_options = "-std=c++11 -stdlib=libc++"


" haskell
"au BufEnter *.hs compiler ghc


"set spell
"set spelllang=en_us
" ~/.vimrc ends here
