A Vim Plugin for Reek
========

Runs the reek style checker on the current file or files in the current
directory on down.


Installation
------------

1. Install [pathogen](https://github.com/tpope/vim-pathogen) if you're not using it already.

2. Clone this repository into your bundle directory:

    ```bash
    cd ~/.vim/bundle
    git clone https://github.com/lad/vim-reek.git ./vim-reek
    ```

3. If you want to use a specific config file set g:reek_config

    ```vim
    let g:reek_config = "~/git/dev/roux/etc/config.reek"
    ```

4. Setup whatever shortcuts you want to invoke ReekThis (current file) or ReekAll.

    ```vim
    nnoremap    <leader>Y       :ReekThis<CR>
    nnoremap    <leader>U       :ReekAll<CR>
    ```
