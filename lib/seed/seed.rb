require 'csv'
require 'pry'

puts Dir.pwd

table = CSV.parse(File.read("./lib/seed/goodreads_library_export_katrina&jen_CLEAN.csv"), headers: true)

# binding.pry