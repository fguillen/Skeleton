#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Try osx_init.rg <NewProjectName>"
  exit 1
end

name = ARGV.first
puts "Initializing project '#{name}'"

def shell(command)
  puts "Executing: #{command}"
  result = Kernel.system command
  raise Exception, "Command error" if !result
end

shell "git clone --depth=1 git@github.com:fguillen/Skeleton.git #{name}"
shell "rm -rf #{name}/.git"
shell "find ./#{name}/ -type f | xargs grep 'skeleton' | xargs sed -i '' -e 's/skeleton/#{name.underscore}/'"
shell "find ./#{name}/ -type f | xargs grep 'Skeleton' | xargs sed -i '' -e 's/Skeleton/#{name}/'"