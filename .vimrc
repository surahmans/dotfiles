set nocompatible                " choose no compatibility with legacy vi
syntax on
set background=dark
set regexpengine=1              " fast cursor move issue on WSL
colorscheme papercolor
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set relativenumber              " relative number
set number                      " display line numbers
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   " Save on buffer switch
set mouse=a
set showmatch
set autowriteall
" Move .swp files
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

"---------- PaperColor -----------"
let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }

"--------------Mappings-----------------"
let mapleader = "\<space>"      " <leader> diubah jadi pakai spasi

"Load ctags files
set tags+=tags,tags.modules,tags.vendors 

"Make it easy to edit Vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>

"---------VIM testing single method-------------"
"How to use? tekan mX pada inside method and go to some file and then tekan "<leader>tm
map <leader>tm mZ'X?publicwwyiw:nohlsearch<cr>:let @a=expand('%:p')<cr>'Z:!clear & ./vendor/bin/phpunit a --filter "<cr>

" Test single method in current file
map <leader>ts mm?publicwwyiw:nohlsearch<cr>:let @a=expand('%:p')<cr>'m:!clear & ./vendor/bin/phpunit a --filter "<cr>

"Test in current file
map <leader>tc ?publicwwyiw:nohlsearch<cr>:!clear & ./vendor/bin/phpunit % "<cr>
"------------------------------------------------"

"goto end line using gn
map gn $

"goto beginning line using gb
map gb ^

"VIM testing single file
nmap <leader>tf :!clear & phpunit %<cr>

"Sort PHP use statements
""http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader><leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Copy to clipboard
vnoremap <C-c> "+y

" Add simple highlight removal
nmap <leader>nh :nohlsearch<cr> 

nmap <c-t> :CtrlPBufTag<cr>
nmap <c-e> :CtrlPMRUFiles<cr>

nmap <leader>f :tag<space>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"  Buka tutup nerdtree pakai f2 pada mode normal dan insert
nmap <F2> :NERDTreeToggle<cr>
imap <F2> <esc>:NERDTreeToggle<cr>
"pakai f3 untuk buka yankring
nnoremap <silent> <F3> :YRShow<CR> 
" Tagbar toggle
nmap <F4> :TagbarToggle<CR>
" ctrlp config
let g:ctrlp_tabpage_position = 'c' "let ctrp open in current tab 
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = 'bower_components'

let g:yankring_replace_n_pkey = '<Char-172>'
imap jk <esc>                   " switch to normal mode from insert mode
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" =========== Scrolling ==========
set scrolloff=5 " Mulai scroll kalau baris dibawah udah berjarak 5
set sidescroll=1 " Aktifkan scrolf kesamping
set sidescrolloff=15 " Mulai scroll kalau jarak kesamping udah 15
set cursorline " Aktifkan posisi cursor
"" setup airline plugin
set laststatus=2                " load up as soon as you start editing a file (airline)
set t_Co=256                    " ensure the colors airline working 
set noshowmode                  " hide the default mode (INSERT, NORMAL, etc)
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

"/
"/ Greplace usind Ag
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'


"-----------------Auto-Commands---------------"
augroup autosourcing
    autocmd!
    autocmd BufwritePost .vimrc source %
augroup END

" list of plugins 
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'           " add command like Gstatus, Gpull, Gcommit
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'            " menampilkan status yang lebih interaktif
Plug 'airblade/vim-gitgutter'       
Plug 'tpope/vim-commentary'         " membuat komentar dengan gc untuk one line dan gcap untuk paragraf
Plug 'terryma/vim-expand-region'    " select region text pakai + -
Plug 'lokaltog/vim-easymotion'      " pencarian dengan \\w \\f \\s
Plug 'raimondi/delimitmate'         " automatic closing of quotes, parenthesis, brackets, etc
Plug 'tpope/vim-surround'           " cs'<strong> cst" ds"
Plug 'shougo/unite.vim'             " pencarian file dan tags
Plug 'Shougo/vimproc.vim'           " unite.vim depedency
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-tag'
Plug 'ervandew/supertab'            " Vim completion with tab
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/YankRing.vim'
Plug 'junegunn/vim-easy-align'      " align text pakai ga=
Plug 'terryma/vim-multiple-cursors'
Plug 'rstacruz/sparkup', {'rtp': 'vim'}
Plug 'eshion/vim-sync'
Plug 'tobyS/vmustache'              " PDV plugin depedency
Plug 'tobys/pdv'                    " PHP Documentor
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'        " A light and configurable statusline/tabline for Vim
Plug 'zerowidth/vim-copy-as-rtf'    " Copy vim as rich text by run :CopyRtf
Plug 'rking/ag.vim'                 " fast searching 
Plug 'skwp/greplace.vim'            " fast replace
Plug 'arnaud-lb/vim-php-namespace'  " automatic namespace
Plug 'craigemery/vim-autotag'       " re-run ctags when save 
call plug#end()
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:sparkupExecuteMapping = '<leader><leader>s'
" PHP Documentor
let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"
nnoremap <leader><leader>db :call pdv#DocumentWithSnip()<CR>

"r copy to clipboard using CTRL+C


"------------------------- lightline config ------------------------------"
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? ' '.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"------------------------- end of lightline config ------------------------------"

"-------Automatic Namespace----------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>ns <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>ns :call PhpInsertUse()<CR>


function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader><leader>ne <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader><leader>ne :call PhpExpandClass()<CR>

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
