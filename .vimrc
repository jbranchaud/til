" vimrc for til

" In order for this file to be loaded by Vim, the main `.vimrc` file must
" contain `set exrc` and optionally `set secure`. Without those lines, Vim
" will ignore this file.

function! CountTILs()
    execute '%s/^- \[//n'
endfunction

nnoremap <leader>c :call CountTILs()<cr>

augroup DisableMarkdownFormattingForTILReadme
    autocmd!
    autocmd BufRead ~/code/til/README.md autocmd! Format
augroup END

" local til_readme_group = vim.api.nvim_create_augroup('DisableMarkdownFormattingForTILReadme', { clear = true })
" vim.api.nvim_create_autocmd('BufRead', {
"   command = 'autocmd! Format',
"   group = til_readme_group,
"   pattern = vim.fn.expand '~/code/til/README.md',
" })
