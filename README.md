ruby-handlebars
===============

[![Build status](https://github.com/mvz/ruby-handlebars/actions/workflows/ruby.yml/badge.svg)](https://github.com/mvz/ruby-handlebars/actions/workflows/ruby.yml)

Pure Ruby library for [Handlebars](http://handlebarsjs.com/) template system.
This should become an alternative for using the Handlebars javascript library via
[handlebars.rb](https://github.com/cowboyd/handlebars.rb).

Installing
----------

Simply run:

```shell
gem install mvz-ruby-handlebars
```

No need for libv8, ruby-racer or any JS related tool.

Using
-----

A very simple case:

```ruby

require 'ruby-handlebars'

hbs = Handlebars::Handlebars.new
hbs.compile("Hello {{name}}").call({name: 'world'})
# Gives: "Hello world", how original ...
```

You can also use partials:

```ruby
hbs.register_partial('full_name', "{{person.first_name}} {{person.last_name}}")
hbs.compile("Hello {{> full_name}}").call({person: {first_name: 'Pinkie', last_name: 'Pie'}})
# Gives: "Hello Pinkie Pie"
```

Partials support parameters:
```ruby
hbs.register_partial('full_name', "{{fname}} {{lname}}")
hbs.compile("Hello {{> full_name fname='jon' lname='doe'}}")
# Gives: "Hello jon doe"
```

You can also register inline helpers:

```ruby
hbs.register_helper('strip') {|context, value| value.strip}
hbs.compile("Hello {{strip name}}").call({name: '                       world     '})
# Will give (again ....): "Hello world"
```

or block helpers:

```ruby
hbs.register_helper('comment') do |context, commenter, block|
  block.fn(context).split("\n").map do |line|
    "#{commenter} #{line}"
  end.join("\n")
end

hbs.compile("{{#comment '//'}}My comment{{/comment}}").call
# Will give: "// My comment"
```

Note that in any block helper you can use an ``else`` block:

```ruby
hbs.register_helper('markdown') do |context, block, else_block|
  html = md_to_html(block.fn(context))
  html.nil? : else_block.fn(context) : html
end

template = [
  "{{#markdown}}",
  "  {{ description }}",
  "{{else}}",
  "  Description is not valid markdown, no preview available",
  "{{/markdown}}"
].join("\n")

hbs.compile(template).call({description: my_description})
# Output will depend on the validity of the 'my_description' variable
```

Default helpers:
----------------

Three default helpers are provided: ``each``, ``if`` and ``unless``.

The each helper let you walk through a list. You can either use the basic notation and referencing the current item as ``this``:

```
  {{#each items}}
    {{{ this }}}
  {{else}}
    No items
  {{/each}}
```

or the "as |name|" notation:

```
  {{#each items as |item| }}
    {{{ item }}}
  {{else}}
    No items
  {{/each}}
```

The ``if`` helper can be used to write conditionnal templates:

```
  {{#if my_condition}}
    It's ok
  {{else}}
    or maybe not
  {{/if}}
```

The ``unless`` helper works the opposite way to ``if``:

```
  {{#unless my_condition}}
    It's not ok
  {{else}}
    or maybe it is
  {{/unless}}
```

Currently, if you call an unknown helper, it will raise an exception. You can override that by registering your own version of the ``helperMissing`` helper. Note that only the name of the missing helper will be provided.

For example:

```ruby
hbs.register_helper('helperMissing') do |context, name|
  puts "No helper found with name #{name}"
end
```

Limitations and roadmap
-----------------------

This gem does not reuse the real Handlebars code (the JS one) and not everything is handled yet (but it will be someday ;) ):

 - the parser is not fully tested yet, it may complain with spaces ...
 - parsing errors are, well, not helpful at all

Aknowledgements
---------------

This is a fork of the [ruby-handlebars]("https://github.com/vincent-psarga/ruby-handlebars") gem. Eventually I hope to have all my changes accepted upstream so I can abandon this fork.
