require 'watchr'

watch( '.*\.rb' ) do
  system 'ruby -r minitest/pride *test.rb'
end
