" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Set numbered lines
set number relativenumber

" I don't know
set completeopt=menuone,noinsert,noselect

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Cursor hack

set guicursor=
set cursorline
set cursorcolumn
set splitbelow
set splitright

set history=200

highlight Search ctermbg=DarkRed
highlight Search ctermfg=LightYellow
highlight Whitespace ctermfg=DarkRed
highlight NonText ctermfg=DarkRed
highlight CursorLine ctermbg=LightRed
highlight CursorColumn ctermbg=LightRed

set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set listchars=eol:¬,trail:↦,extends:>,precedes:<,space:·,tab:» 
set list

set nowrap
set path+=**
set noshowmode

let mapleader = ","

let NERDTreeShowHidden=1

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

call plug#begin()

" lightline
Plug 'itchyny/lightline.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust vim support
Plug 'rust-lang/rust.vim'

" Swift vim support
Plug 'keith/swift.vim'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Kotlin
Plug 'udalov/kotlin-vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

"Mode Settings

let &t_SI.="\e[3 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[3 q" "EI = NORMAL mode (ELSE)

"Coc Diagnostics highlighting
highlight CocErrorSign ctermfg=Red cterm=bold
highlight CocErrorFloat ctermfg=Red cterm=bold ctermbg=LightRed
highlight CocErrorLine ctermbg=LightRed cterm=bold
highlight CocWarningSign ctermfg=DarkYellow cterm=bold
highlight CocWarningLine ctermbg=LightYellow cterm=bold
highlight CocWarningFloat ctermfg=DarkYellow ctermbg=LightYellow cterm=bold
highlight CocInfoSign ctermfg=White cterm=bold
highlight CocInfoLine ctermbg=LightGrey cterm=bold
highlight CocInfoFloat ctermfg=White cterm=bold ctermbg=LightGrey
highlight CocHintSign ctermfg=Green cterm=bold
highlight CocHintLine ctermbg=LightBlue cterm=bold
highlight CocHintFloat ctermfg=Green ctermbg=LightBlue cterm=bold

"Coc Highlight Text colors
highlight CocHighlightText ctermbg=Black cterm=bold
highlight CocHighlightRead ctermbg=DarkCyan ctermfg=DarkRed cterm=bold
highlight CocHighlightWrite ctermbg=DarkRed ctermfg=DarkCyan cterm=bold

"GitGutter highlights
highlight GitGutterAdd ctermbg=DarkBlue cterm=bold
highlight GitGutterChange ctermbg=Cyan cterm=bold
highlight GitGutterDelete ctermbg=DarkRed cterm=bold
highlight GitGutterAddLine ctermbg=DarkBlue cterm=bold
highlight GitGutterChangeLine ctermbg=Cyan cterm=bold
highlight GitGutterDeleteLine ctermbg=DarkRed cterm=bold
highlight GitGutterChangeDeleteLine ctermbg=DarkMagenta cterm=bold

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" sync syntax highlight for large javascript and typescript files
autocmd BufEnter *.{js,jsx,ts,tsx,swift,rs} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,swift,rs} :syntax sync clear

" set tab rules for files
autocmd BufEnter *.{js,jsx,json,ts,tsx,graphql} setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufEnter *.{markdown,md} setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufEnter *.{rust,swift} setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

" Coc global extensions
let g:coc_global_extensions = [
            \ 'coc-tsserver'
            \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
endif
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}%{FugitiveStatusline()}
let g:lightline ={
    \ 'active': {
    \  'left': [ [ 'mode', 'paste'], [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \  'component_function': {
    \    'cocstatus': 'coc#status',
    \    'gitbranch': 'FugitiveHead',
    \  },
    \ }

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :CocCommand explorer<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:rustfmt_autosave=1

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

cnoremap <expr> %% getcmptype() == ':' ? expand('&:h').'/' : '%%'
set noexpandtab

" Reload init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>

augroup jsoncFtdetect
    autocmd!

    " Recognize some extensions known to have JSON with comments
    " Note: If conflicts are found, please report them.

    " https://github.com/mohae/cjson
    autocmd BufNewFile,BufRead *.cjsn setfiletype jsonc
    " https://github.com/mohae/cjson
    autocmd BufNewFile,BufRead *.cjson setfiletype jsonc
    " https://github.com/Microsoft/vscode/issues/48969
    " https://komkom.github.io/
    " https://github.com/mochajs/mocha/issues/3753
    autocmd BufNewFile,BufRead *.jsonc setfiletype jsonc

    " Recognize some files known to support JSON with comments
    " Entries sorted by pattern

    " https://eslint.org/docs/user-guide/configuring
    autocmd BufNewFile,BufRead .eslintrc.json setlocal filetype=jsonc
    " https://jshint.com/docs/
    autocmd BufNewFile,BufRead .jshintrc setlocal filetype=jsonc
    " https://mochajs.org/#configuring-mocha-nodejs
    autocmd BufNewFile,BufRead .mocharc.json setlocal filetype=jsonc
    autocmd BufNewFile,BufRead .mocharc.jsonc setlocal filetype=jsonc
    " https://github.com/neoclide/coc.nvim
    "autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc
    " https://github.com/clutchski/coffeelint/pull/407
    autocmd BufNewFile,BufRead coffeelint.json setlocal filetype=jsonc
    " https://github.com/microsoft/TypeScript/pull/5450
    autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
    " https://github.com/Alexays/Waybar/wiki/Configuration
    autocmd BufNewFile,BufRead */waybar/config setlocal filetype=jsonc
augroup END
