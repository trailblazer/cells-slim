source "https://rubygems.org"

# Specify your gem's dependencies in cells-slim.gemspec
gemspec

gem "activemodel"
gem "railties"

case ENV["GEMS_SOURCE"]
  when "local"
    gem "cells", path: "../cells"
  when "github"
    gem "cells", github: "trailblazer/cells"
end
