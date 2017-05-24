#!/usr/bin/env ruby

$stdout.sync = true
require 'bundler/setup'
Bundler.require(:default)

require 'fileutils'

def log(msg)
  puts msg
end

source_dir = ARGV[0] || Dir.pwd
out_dir = File.expand_path("./public")
FileUtils.mkdir_p out_dir
# copy static assets
system("cp _static/* public/")

source_files = Dir[File.join(source_dir, "**/*.md")]

log "building #{source_files.count} tils"

require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'
class TILRenderer < Redcarpet::Render::HTML
  include ::Rouge::Plugins::Redcarpet
end


renderer = Redcarpet::Markdown.new(TILRenderer, autolink: true, tables: true, no_intra_emphasis: true, fenced_code_blocks: true)

require 'erb'
tmpl = ERB.new(File.read("_layout/index.html.erb"))

all_files = []

source_files.each do |source_file|
  next if source_file[0] == "_"
  log "building #{source_file}"
  source = File.read(source_file)
  title = source.lines.first.to_s.gsub(/#+/, '')
  content = renderer.render(source.lines.drop(1).join)
  relative_path = source_file.gsub(source_dir, '').gsub(/\.md$/, '.html')
  out_file = File.join(out_dir, relative_path)
  # create base dir
  FileUtils.mkdir_p File.dirname(out_file)
  _ = content
  File.write(out_file, tmpl.result(binding))
  all_files << [ title,  relative_path]
  log "built #{out_file}"
end

def get_cat(filename)
  filename = filename.gsub(/^\//, '')
  idx = filename.index('/')
  if idx
    filename[0, idx]
  else
    'Root'
  end
end

# TODO: index file
categorized_files = all_files.group_by{|x| get_cat(x.last)}
home_tmpl = ERB.new(File.read("_layout/home.html.erb"))
title = "TIL Home"
content = home_tmpl.result(binding)
_ = categorized_files
_ = title
_ = content
File.write("public/index.html", tmpl.result(binding))

log 'DONE'
