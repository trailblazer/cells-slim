class SongCell < Cell::ViewModelSlim
  self.view_paths = ["test/cells"]

  def render_in_render
    render
  end
end
