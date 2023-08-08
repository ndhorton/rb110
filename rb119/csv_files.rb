require 'csv'

def csv_dictreader(pathname)
  rows = CSV.read(pathname)
  cols = rows.shift
  number_of_cols = cols.size
  rows.map do |row|
    row_hash = {}
    number_of_cols.times do |col_index|
      row_hash[cols[col_index].downcase.to_sym] = row[col_index]
    end
    row_hash
  end
end

def csv_dictwriter!(pathname, db)
  db_keys = db.first.keys
  data_out = db_keys.map(&:to_s).join(',') << "\n"
  db.each do |row|
    data_out << row.map { |key, field| field.to_s }.join(',') << "\n"
  end
  File.write(pathname, data_out)
end

# read csv file in as an array of hashes with each column name a key
# as in Python's DictReader method
start_time = Time.now
read_pathname = "#{__dir__}/overseas-trade-indexes-March-2023-quarter-provisional-csv.csv"
db = csv_dictreader(read_pathname)
puts "Read time: #{Time.now - start_time}"
puts "Records: #{db.size}"
puts "------------------"
# perform manipulations
db.uniq!

start_time = Time.now
# write DictReader-style object as csv file
write_pathname = "#{__dir__}/test.csv"
csv_dictwriter!(write_pathname, db)
puts "Write time: #{Time.now - start_time}"
