module Cell
  module Slim::Rails
    def self.included(includer)
      includer.send :include, ActionView::Helpers::FormHelper
      includer.send :include, ::Cell::Slim::Rails::Helpers
    end

    module Helpers # include after AV helpers to override.
      def with_output_buffer(block_buffer=ViewModel::OutputBuffer.new)
        @output_buffer, old_buffer = block_buffer, @output_buffer
        yield
        @output_buffer = old_buffer

        block_buffer
      end

      def capture(*args)
        value = nil
        buffer = with_output_buffer { value = yield(*args) }

        return buffer.to_s if buffer.size > 0
        value # this applies for "Beachparty" string-only statements.
      end

      # From FormTagHelper. why do they escape every possible string? why?
      def form_tag_in_block(html_options, &block)
        content = capture(&block)
        form_tag_with_body(html_options, content)
      end

      def form_tag_with_body(html_options, content)
        "#{form_tag_html(html_options)}" << content.to_s << "</form>"
      end

      def form_tag_html(html_options)
        extra_tags = extra_tags_for_form(html_options)
        "#{tag(:form, html_options, true) + extra_tags}"
      end

      def tag_options(options, escape = true)
        super(options, true)
      end

      def content_tag_string(name, content, options, escape=true)
        super(name, content, options, false)
      end

      def concat(string)
        @output_buffer << string
        self
      end
    end
  end
end
