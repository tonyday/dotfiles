
" -------------------- Start Vundle specific copied from https://github.com/gmarik/vundle --------------------

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

" git wrapper plugin
"---------- Bundle 'tpope/vim-fugitive'
" https://github.com/tpope/vim-fugitive

" Syntax highlighting plugin
"---------- Bundle 'scrooloose/syntastic'
" https://github.com/scrooloose/syntastic

" Easy navigation within document
"---------- Bundle 'Lokaltog/vim-easymotion'
" https://github.com/Lokaltog/vim-easymotion

" HTML expansion plugin
"---------- Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" https://github.com/rstacruz/sparkup

" Rails support
"---------- Bundle 'tpope/vim-rails.git'
" https://github.com/tpope/vim-rails

" vim-scripts repos

" Vim-script library for vim programming - seems to be needed by other plugins
"---------- Bundle 'L9'
" https://github.com/vim-scripts/L9

" Quickly search for buffer/file/command/bookmark/tag
"---------- Bundle 'FuzzyFinder'
" https://github.com/vim-scripts/FuzzyFinder

" non github repos

" Search for files/buffers
"---------- Bundle 'git://git.wincent.com/command-t.git'
" git://git.wincent.com/command-t.git


" git repos on your local machine (ie. when working on your own plugin)
" Just an example
" Bundle 'file:///Users/gmarik/path/to/plugin'

" ...

" -------------------- Start Tony Day bundles --------------------
" Solarized color schemes
Bundle 'altercation/vim-colors-solarized'
" https://github.com/altercation/vim-colors-solarized
" -------------------- End Tony Day bundles --------------------

" Vim-script library for vim programming - seems to be needed by other plugins
Bundle 'L9'
" https://github.com/vim-scripts/L9

" Quickly search for buffer/file/command/bookmark/tag
Bundle 'FuzzyFinder'
" https://github.com/vim-scripts/FuzzyFinder

" Surround text with stuff (tags, quotes, barckets whatever)
Bundle 'tpope/vim-surround'
" https://github.com/tpope/vim-surround

" Comment stuff real easy like
Bundle 'scrooloose/nerdcommenter'
" https://github.com/scrooloose/nerdcommenter
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" -------------------- End Vundle specific copied from https://github.com/gmarik/vundle --------------------

" -------------------- Start Tony Day specific --------------------

set hidden
autocmd ColorScheme * highlight DangerWillRobinson ctermbg=red guibg=red
syntax enable
command! Dw %s/\s\+$//gc
set background=dark
set guifont=Monaco:h14
set cursorline
set number
colorscheme solarized

" Highlight trailing spaces (in the hope that we might fix them)
match DangerWillRobinson /\s\+$/
autocmd WinEnter * match DangerWillRobinson /\s\+$/

" Highlight non-ascii characters so that we might delete the nasty blighters.
2match DangerWillRobinson /[^ -~]/
autocmd WinEnter * 2match DangerWillRobinson /[^ -~]/

" -------------------- End Tony Day specific --------------------

" Stole this from http://stackoverflow.com/questions/4132956/is-there-an-easy-way-to-exclude-files-for-which-fuzzyfinder-searches
" FuzzyFinder should ignore all files in .gitignore
function! IgnoreFiles ()
  let ignorefile = ".gitignore"
  if filereadable(ignorefile)

    let ignore = '\v\~$'
    for line in readfile(ignorefile)
      let line = substitute(line, '\.', '\\.', 'g')
      let line = substitute(line, '\*', '.*', 'g')
      let ignore .= '|^' . line
    endfor

    let g:fuf_coveragefile_exclude = ignore
  endif
endfunction

autocmd BufEnter * call IgnoreFiles()

" ---------- Start Tony Day keyboard mappings ----------
map <leader>b :FufBuffer<cr>
map <leader>f :FufCoverageFile<cr>
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>
map <D-F4> :bd<CR>
imap <D-F4> <Esc>:bd<CR>
map  <S-D-F4> :bd!<CR>
imap <S-D-F4> <Esc>:bd!<CR>
" ---------- End Tony Day keyboard mappings ----------
