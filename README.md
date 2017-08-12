# Cells::Slim

Support for Slim templates with Cells.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cells-slim'
```

## Usage

Outside of Rails, you need to include `Cell::Slim` in your cell.

```ruby
class CommentCell < Cell::ViewModel
  include Cell::Slim
```

## Important

Cells Slim change default settings for Slim and disables escaping in templates.
To re-enable it, you can use below snippet:

It can be changed easy by override **template_options_for** from **Cells::Slim**:
```ruby
module Cell
  module Slim
    def template_options_for(options)
      {
          template_class: ::Slim::Template,
          suffix: 'slim',
          disable_escape: false,
          escape_code: false,
          use_html_safe: false, # set true for Rails
          buffer: '@output_buffer'
      }
    end
  end
end
```

This can be put in **config/application.rb**.

**Remember** that you need to use '==' instead of '=' ([reference in Slim docs](http://www.rubydoc.info/gems/slim/frames#Output_without_HTML_escaping___)) in your templates for code which should not be escaped, for example form_builder (notice that only from_for line require '=='):
```
== form_for model, url: users_path, method: method do |f|
  = f.text_field :first_name
  = f.text_field :last_name
```

## Documentation

[More documentation](http://trailblazer.to/gems/cells/templates.html) can be found on the Trailblazer page.
