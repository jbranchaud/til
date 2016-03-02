# Switch to spec file with rails.vim

With the excellent plugin by @tpope [rails.vim](https://github.com/tpope/vim-rails) 
you can easily switch to the alternate file with `:A`.

But on a project on old file we have `_test.rb` and `_spec.rb`. 
By default it goes to `_test.rb` file. To fixe that you have
to use a **projection**.

```viml
let g:rails_projections = {
      \  'app/*.rb': {
      \     'alternate': 'spec/{}_spec.rb'
      \   },
      \  'spec/*_spec.rb': {
      \     'alternate': 'app/{}.rb'
      \   }
      \}
```

To get more infos about projections you can do `:help rails-projections`
