#!/usr/local/bin/ruby
# Program: Example2.rb
require "gtk2"

def transform(str)
  str.delete!("^A-Za-z")
  str.downcase!
  str.split("").sort.join
end

def test_phrases(v1, v2, lab)
  if transform(v1) == transform(v2)
    lab.text = "These are anagrams."
  else
    lab.text = "These are not anagrams." 
  end
end

def clear_all(e1, v1, v2, lab)
  v1 = ""
  v2 = ""
  lab.text = ""
  e1.grab_focus
end

def start
root = Gtk::Window.new(Gtk::Window::TOPLEVEL)

root.set_title "Anagram Tester" #Set the title of the window
root.border_width = 10
root.set_size_request(500, -1) #putting a -1 in these values will have it dynamiclly 
#size to fit the objects inside it.
root.resizable=(false)
root.signal_connect('delete_event') {Gtk.main_quit}
#if we hit the X button, it calls main_quit and closes everything

#lets create a table 
$table = Gtk::Table.new(4,2,false) #first # is the num of rows, next is columns
root.add($table) #fill up the root window with the table
#Note: Always use the .add in the root window. Use the other attachment methods for the other containers.

$lab1 = Gtk::Label.new("Phrase 1")
$table.attach($lab1,0,1,0,1) 
#object, left border, right border, top border, bottom border

$ent1 = Gtk::Entry.new
$table.attach($ent1,0,1,1,2) 


$lab2 = Gtk::Label.new("Phrase 2")
$table.attach($lab2,1,2,0,1) 

$ent2 = Gtk::Entry.new
$table.attach($ent2,1,2,1,2) 


$labResult = Gtk::Label.new(" ")
$table.attach($labResult,0,2,2,3) #note this one's right is 2, thus it will take up both cells 


#so we have a table that is two columns wide, but we want to have 3 buttons
#next to each other. What to do? 
# let's put a 3 column table in the space of the other table that only had 2 columns!
$tableInner = Gtk::Table.new(1,3,false) #first # is the num of rows, next is columns
$table.attach($tableInner,0,2,3,4)

$btnTest = Gtk::Button.new("Test")
$btnTest.signal_connect("clicked"){test_phrases($ent1.text,$ent2.text,$labResult)}  
$tableInner.attach($btnTest,0,1,0,1)

$btnClear = Gtk::Button.new("Clear")
$btnClear.signal_connect("clicked"){clear_all($ent1,$ent1.text,$ent2.text,$labResult)}  
$tableInner.attach($btnClear,1,2,0,1)

$btnExit = Gtk::Button.new("Exit")
$btnExit.signal_connect("clicked"){Gtk.main_quit}  
$tableInner.attach($btnExit,2,3,0,1)


root.show_all #activate the window on the screen

end

start()
Gtk.main
