require 'slim'
require 'cells'

Tilt.register 'Slim::Template', 'slim', 'slim'

module Cell
  module Slim
    class OutputBuffer < String
    end

    def with_output_buffer(buf = nil)
      unless buf
        buf = OutputBuffer.new
      end
      self.output_buffer, old_buffer = buf, output_buffer
      yield
      output_buffer
    ensure
      self.output_buffer = old_buffer
    end

    def capture(*args,&block)
      value = nil
      buffer = with_output_buffer() { value = yield(*args) }
      if string = buffer.presence || value and string.is_a?(String)
        return string
      end
    end

    # From FormTagHelper. why do they escape every possible string? why?
    def form_tag_in_block(html_options, &block)
      content = capture(&block)
      "#{form_tag_html(html_options)}" << content << "</form>"
    end

    def form_tag_html(html_options)
      extra_tags = extra_tags_for_form(html_options)
      "#{tag(:form, html_options, true) + extra_tags}"
    end

    def tag_option(key, value, escape)
      super(key, value, false)
    end

    def content_tag_string(name, content, options, escape=true)
      super(name, content, options, false)
    end
  end

  ViewModel.class_eval do
    include Slim
  end

  ViewModel.template_engine = :slim
end
