# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

puts "There are #{Salesperson.all.count} salespeople"

# 2. insert 1-2 rows in salespeople table.

# 3. write code to display how many salespeople rows are in the database

new_salesperson = Salesperson.new
new_salesperson["first_name"] = "Alex"
new_salesperson["last_name"] = "Rose"
new_salesperson["email"] = "arose@gmail.com"
new_salesperson.save

new_salesperson = Salesperson.new
new_salesperson["first_name"] = "Sabrina"
new_salesperson["last_name"] = "Eskildsen"
new_salesperson["email"] = "seskildsen@gmail.com"
new_salesperson.save


puts "There are #{Salesperson.all.count} salespeople"
# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

sab = Salesperson.find_by({"first_name" => "Sabrina"})
puts sab.inspect
sab["email"] = "sabrina.eskildsen@kellogg.northwestern.edu"
sab.save
puts sab.inspect

#alex = Salesperson.find_by({"first_name" => "Alex"})

#alex.destroy
#puts alex.inspect
puts "There are #{Salesperson.all.count} salespeople"

# CHALLENGE:
# 5. write code to display each salesperson's full name

# ---------------------------------
puts "salespeople: #{Salesperson.all.count}"

# Salespeople: 2
all_salespeople = Salesperson.all
for salesperson in all_salespeople

# Ben Block
    first_name = salesperson["first_name"]
    last_name = salesperson["last_name"]
    email = salesperson["email"]
    puts "#{first_name} #{last_name} - #{email}"

# Brian Eng

end


#all_salespeople = Salesperson.all
#puts all_salespeople.inspect
