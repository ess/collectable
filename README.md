## Collectable ##

So, I serialize stuff into arrays in my AR objects where it doesn't make
sense to go through the rigamaroe of actually making an empty AR model
to use for the association. This is just a bit of glue to make using
that pattern a bit easier with 

There's not much to this thing, and what's there exists only to serve the
needs that I've had for this sort of thing.

That said, pull requests are totally welcome :)

## Gem Setup ##

```ruby
gem install collectable

# Gemfile
gem 'collectable'
```
## Basic usage ##

The short version is "include the module and define some traits." That's also
the long version, as it were.

```ruby
class HairColor
  include Collectable

  trait :blonde
  trait :brown
  trait :red
  trait :black
  trait :purple
  trait :tie_dye
end
```

Then, to actually use the thing, do something like this in your view:

```erb
<%= form_for @person do |f| %>
  <%= f.collection_check_boxes(:hair_color, HairColor.collected, HairColor.value, HairColor.name) %>
<% end %>
```

## Contributing ##

Do you use git-flow? I sure do. Please base anything you do off of
[the develop branch](https://github.com/ess/absolution/tree/develop).

1. Fork it.
2. Perform some BDD magic. Seriously. Be testing.
3. Submit a pull request.

## History ##

* 0.0.2 - Renamed collected_item#val to collected_item#value
* 0.0.1 - Public release

## License ##

MIT License. Copyright 2014 Dennis Walters
