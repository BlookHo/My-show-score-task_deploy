## Leaderboard Challenge

This is a bare-bones Rails app that we've put together to see how you think.

We hesitate even to call it a "challenge" or a "test" because this isn't designed to stump you. We just want to see what your instincts are with respect to applying Rails' abstractions to a specific and realistic problem.

So without further ado...

Please begin by running bundler.

````
  bundle install
````

Then run migrations to create the schema (the development-default Sqlite3 will be used. You're welcome to swap in another DBMS if you want, but there isn't much point).

````
  bin/rake db:migrate
````

Finally, seed the database:
````
  bin/rake db:seed
````

The schema consists of "shows" and "reviews". We've dropped corresponding models into app/models and set up the relation between them (a show has many reviews). The seeds script that you've run will have populated the database with twenty randomly-named shows and a couple hundred random reviews (with different numbers of reviews per show, and each review giving the show a score between 0 and 100).

### Your task is simply this:

Build a page that displays the top 10 shows by average score (in descending order, with the highest-rated show at the top of the list). The interface should display the show title, its average score (you can limit the decimals to 1, i.e. "score: 70.5") and its review count.

Even though this is a simple demo app that we're running in a development environment, if there are any special tricks you would use to increase the performance of an interface like this in a production environment (caching strategies, for instance, or special ActiveRecord functions) feel free to show those off.

You can share your work with us either by opening a pull request on the repository (https://bitbucket.org/nzaillian/leaderboard-challenge/overview) or by sending your project tree to us by email in a compressed directory.

########################

### Some notes

##### In model Show:

1. Two new attributes have been added to schema: `:review_count` and `:ave_value`.
The data calculation and the filling of `:review_count` and `:ave_value` should be done after every new review submit on the fly.
This will increase rendering speed when sorting a show reviews list.

2. At the moment this is done while model seeding. See comments in `seeds.rb`.

3. For a `scope :top_scores` one small TODO is left: 
```
TODO: To delete '.order(ave_score: :desc)' from this scope. This is left here from Step 1 - just to show
```
4. See comments in `/model/show.rb`.

5. Validations: TODO + Rspec. Should be done together with a UI front-end.

##### API

Server side end-point is organized in a versioned API.

##### front-end

1. `app/views/reviews/_reviews_list.html.haml` was made in `Haml`: , since it was not strictly determined in a task.

2. 
:action => 'reviews_list', :controller=>'api/v1/reviews', 

  - cache(:expires_in => 15.seconds)do
