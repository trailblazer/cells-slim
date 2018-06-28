require "test_helper"

class SlimTest < MiniTest::Spec
  let(:song_cell) { SongCell.new }

  it("render nested cells") do
    assert_equal "<b>Questions: <strong>Yes!</strong></b>", song_cell.(:render_in_render)
  end
end
