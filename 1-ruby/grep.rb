#!/usr/bin/env ruby

pattern = ARGV[0]
filename = ARGV[1]

i = 0
File.readlines(filename).each do |line|
    if line.index(pattern) != nil
        puts "#{i} #{line}"
    end
    i += 1
end
