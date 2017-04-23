require 'csv'

csv_text = File.read(Rails.root.join('support', 'merchants.csv' ))
csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    t = Merchant.new
    t.name = row[0]
    t.username = row[1]
    t.email = row[2]
    t.save
  end
