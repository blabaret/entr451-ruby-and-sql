# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

puts "There are #{Activity.all.count} activities"

sabrina = Salesperson.find_by({"first_name" => "Sabrina"})
puts sabrina.inspect
tim = Contact.find_by({"first_name" => "Tim"})
puts tim.inspect

activity = Activity.new
activity["salesperson_id"] = sabrina["id"]
activity["contact_id"] = tim["id"]
activity["note"] = "great lunch. billed to co"
activity.save

jeff = Contact.find_by({"first_name" => "Jeff"})

activity = Activity.new
activity["salesperson_id"] = sabrina["id"]
activity["contact_id"] = jeff["id"]
activity["note"] = "great lunch. billed to co"
activity.save

puts "There are #{Activity.all.count} activities"

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

puts "Activities between #{sabrina.first_name} and #{tim.first_name}: #{Activity.count}"

activities = Activity.where({"salesperson_id" => sabrina["id"], "contact_id" => tim["id"]})
for activity in activities
    puts "- #{activity["note"]}"
end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
