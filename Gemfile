source "https://rubygems.org"
gemspec

case ENV["GEMS_SOURCE"]
  when "local"
    gem "cells", path: "../cells"
  when "github"
    gem "cells", github: "trailblazer/cells"
end
