if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

filetype plugin on
filetype plugin indent on
au BufReadPost *.sv set syntax=verilog

set nocompatible " Use Vim defaults (much better!)
set bs=2 " allow backspacing over everything in insert mode
"set ts=2
"set nosta " turn off smart tab
"set noai  " turn off auto indent
set cindent
set smartindent
set autoindent
"general tab settings
set expandtab "makes tab key insert spaces
set tabstop=2
set shiftwidth=2
set nonumber

"specific tab settings
"autocmd Filetype python setlocal tabstop=4 shiftwidth=4

"nmap <tab> == au FileType * setl fo-=cro " Turn off the Auto-comments

"Highlight tabs"
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>

set showmatch
colorscheme darkblue
set mouse=a " use shift- to copy from terminal to terminal
"set backup   " keep a backup file
set viminfo='20,\"50  " read/write a .viminfo file, don't store more
      " than 50 lines of registers
"set hitory=50    " keep 50 lines of command line history
"set ruer   " show the cursor position all the time

" Map the ^ key to grep for the word under the cursor in the current working directory
nnoremap ^ :!grep -n '\<<cword>\>' *<CR>

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

hi Normal guibg=NONE ctermbg=NONE

set colorcolumn=120
" let &colorcolumn="120," " .join(range(120,999),",")
highlight ColorColumn ctermbg=232 guibg=#2c2d27

"Highlight trailing whitespaces in red while not in insert mode
highlight ExtraWhitespace ctermbg=Green guibg=Green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

highlight ExtraWhitespace ctermbg=LightCyan guibg=LightCyan
match ExtraWhitespace /^\s\+/
autocmd BufWinEnter * match ExtraWhitespace /^\s\+/
autocmd InsertEnter * match ExtraWhitespace /^\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /^\s\+/
autocmd BufWinLeave * call clearmatches()
