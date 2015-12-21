require "slim"
require "cells"

module Cell
  module Slim
    def render_template(*)
      old_output_buffer = @output_buffer
      super
    ensure
      @output_buffer = old_output_buffer
    end

    def template_options_for(options)
      {
        template_class: ::Slim::Template,
        suffix:         "slim",
        disable_escape: true,
        escape_code:    false,
        use_html_safe:  false,
        buffer:         "@output_buffer"
      }
    end

    if Object.const_defined?(:ActionView)
      require "cell/slim/rails"
      include Cell::Slim::Rails
    end
  end
end
