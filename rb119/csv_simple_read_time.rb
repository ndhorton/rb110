require 'csv'
read_pathname = "/home/nicholas/launch_school/rb119/overseas-trade-indexes-March-2023-quarter-provisional-csv.csv"

start_time = Time.now
data = CSV.read(read_pathname)
puts "Time to read 100000ish records: #{Time.now - start_time}"
