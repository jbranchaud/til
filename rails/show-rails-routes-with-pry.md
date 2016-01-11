# Show Rails Routes With Pry

In [Show Rails Models With Pry](show-rails-models-with-pry.md), I showed
that [`pry-rails`](https://github.com/rweng/pry-rails) comes with some handy
console commands. In addition to being able to list all your Rails models,
you can list all the routes for your application using `show-routes`.

I get the following output by using that command in a small blog project:

```
> show-routes
              Prefix Verb   URI Pattern                     Controller#Action
                root GET    /                               application#index
markdownify_articles POST   /articles/markdownify(.:format) articles#markdownify
            articles POST   /articles(.:format)             articles#create
         new_article GET    /articles/new(.:format)         articles#new
        edit_article GET    /articles/:id/edit(.:format)    articles#edit
             article GET    /articles/:id(.:format)         articles#show
                     PATCH  /articles/:id(.:format)         articles#update
                     PUT    /articles/:id(.:format)         articles#update
               users POST   /users(.:format)                users#create
            new_user GET    /users/new(.:format)            users#new
                user GET    /users/:id(.:format)            users#show
            sessions POST   /sessions(.:format)             sessions#create
         new_session GET    /sessions/new(.:format)         sessions#new
             session DELETE /sessions/:id(.:format)         sessions#destroy
              signin GET    /signin(.:format)               sessions#new
                     POST   /signin(.:format)               sessions#create
              signup GET    /signup(.:format)               users#new
```
