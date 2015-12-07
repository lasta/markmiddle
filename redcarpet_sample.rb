#! /usr/bin/env ruby
require 'redcarpet'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

input_file = File.open(ARGV[0], 'r') do |io|
  puts markdown.render(io.read)
end
