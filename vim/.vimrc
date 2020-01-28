" init.vim : .nvimrc
" location of init.vim : ~/.config/nvim/

" Vim-Plug 설정 ------------------------------------------------------------------
" 아래와 같이 설정한 다음 :PlugInstall<CR> 해주면 된다.
call plug#begin('~/.vim/plugged')

    Plug 'mhinz/vim-startify'           " 시작 화면을 꾸며준다. MRU가 있어 편리하다.
    Plug 'tpope/vim-repeat' " . 으로 다양한 반복이 가능하게 해주는 Tim Pope 님의 플러그인

    " tags
    Plug 'ludovicchabant/vim-gutentags' " 자동으로 tags 파일을 갱신해 준다.
    Plug 'majutsushi/tagbar'

    " file browser
    Plug 'scrooloose/nerdtree'
        Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

    " editing
    Plug 'tpope/vim-surround'   " surround 문법을 vim에 추가한다
    Plug 'bling/vim-airline'           " BUFFER navigator, status line 을 제공한다.

    " color scheme
    Plug 'johngrib/FlatColor-johngrib'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax enable
colorscheme flatcolor-johngrib
filetype plugin indent on

set number " 왼쪽에 라인 넘버가 보이게 한다
set nofixeol    " vim이 end of line 문자를 바꾸지 않게 한다
set conceallevel=0  " vim이 자기 맘대로 글자를 숨기지 않게 한다
set nocompatible        " 지금은 2020년입니다.
set mouse=a		" 지금은 2020년입니다.
set nopaste		" vim의 paste 모드를 사용하지 않습니다. 다양한 플러그인과 충돌할 수 있습니다.
set smartcase ignorecase hlsearch incsearch	" 검색 편의를 위한 설정들
set ruler            	" 현재 커서 위치 (row, col) 좌표 출력
set noerrorbells     	" 에러 알림음 끄기
set laststatus=2     	" 상태바를 언제나 표시할 것
set showmatch        	" 일치하는 괄호 하이라이팅
set cursorline       " highlight current line
set lazyredraw       " redraw only when we need to.
set showcmd          " airline 플러그인과 충돌 가능성 있음.
set wildmenu wildignorecase	" command 모드 명령 자동 완성
set wildmode=full

" 짜증나는 swp, backup 파일 안 만들기
set noswapfile
set nobackup

set noerrorbells visualbell t_vb= " 사운드 벨, 비주얼 벨 비활성화


set bs=indent,eol,start  " backspace 키 사용 가능
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab " 탭 사이즈를 지정한다.

" 공백 문자를 가시화한다.
set list listchars=tab:·\ ,trail:·,extends:>,precedes:<
set cindent autoindent smartindent  " 자동 인덴트 설정
set history=200 undolevels=2000     " command history, undo history stack size

set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz

set virtualedit=block   " visual block mode를 쓸 때 문자가 없는 곳도 선택 가능하다
set autoread            " 파일이 변경되면 알아서 읽는다

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
    let s:vimDir = '$HOME/.vim'
    let &runtimepath.=','.s:vimDir
    let s:undoDir = expand(s:vimDir . '/undodir')

    call system('mkdir ' . s:vimDir)
    call system('mkdir ' . s:undoDir)

    let &undodir = s:undoDir
    set undofile
endif

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 텍스트를 잘라 내린다
nnoremap K i<CR><Esc>

" copy , paste , select 기능 보완
let mapleader = "\<Space>"
let maplocalleader = "\\"
nnoremap Y y$
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+yg_
vnoremap <Leader>y "+y
nnoremap <Leader>d "+d
nnoremap <Leader>D "+yD
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

iabbr __email woohyun@gmail.com
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __date strftime("%Y-%m-%d")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')
iabbr <expr> __branch system("git rev-parse --abbrev-ref HEAD")
iabbr <expr> __uuid system("uuidgen")

runtime! vim-include/*.vim
