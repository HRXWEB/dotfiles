" 显示行号
set number
set relativenumber

" 搜索时忽略大小写
set ignorecase

" 只要搜索词中包含大写字母，就自动切换回大小写敏感
set smartcase

" --- 基础设置 beg ---
" 将 vim 默认寄存器与系统剪切板共享
set clipboard=unnamed

" --- 黑洞寄存器重定向 ---
" 核心逻辑：让删除、修改操作不覆盖剪切板

" 1. 删除操作 (Delete)
nnoremap d "_d
vnoremap d "_d
nnoremap dd "_dd

" 2. 删单字操作 (x 通常用于删除光标下的字符)
nnoremap x "_x
vnoremap x "_x

" 3. 修改操作 (Change - 比如 cw, cc)
" 注意：c 会进入插入模式，但它默认也会剪切，重定向后可以保护剪切板
nnoremap c "_c
vnoremap c "_c
nnoremap cc "_cc

" 4. 可视化模式下粘贴不覆盖剪切板 (可选但推荐)
" 默认在选中区域按 p 粘贴，被替换掉的内容会进入剪切板，这行配置可以禁用此行为
vnoremap p "_dP

" --- 基础设置 end ---

" 增量搜索，输入时就开始跳转
set incsearch
