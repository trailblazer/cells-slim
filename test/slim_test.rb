require 'test_helper'

class SlimTest < MiniTest::Test

  def test_template_engine
   assert_equal 'slim', Cell::ViewModel.template_engine
  end

end
