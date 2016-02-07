#!/usr/bin/env ruby

files = Dir['profile/src/**/*']

def matches_flags?(line)
  ARGV.each do |flag|
    if flag[/\A-/]
      return false if line.include?(flag[1..-1])
    else
      return false unless line.include?(flag)
    end
  end
  true
end


files.each do |fname|
  begin
    line = File.readlines(fname).grep(/#.*USE ON:/)[0]
  rescue Errno::EISDIR
    next
  end

  STDERR.puts "#{fname}: Header not found" unless line
  next unless line && matches_flags?(line)
  puts "# Sourced from #{fname}"
  puts File.read(fname)
end
