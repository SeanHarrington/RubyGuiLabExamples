#!/usr/local/bin/ruby
# Program: Example1.rb
require "gtk2"

def myproc
  puts "I am in method myproc"
end

def myproc2(x)
  puts "myproc2: " + x
end


def start
root = Gtk::Window.new(Gtk::Window::TOPLEVEL)

root.set_title "Sample" #Set the title of the window
root.border_width = 10
root.set_size_request(500, -1) #putting a -1 in these values will have it dynamiclly 
#size to fit the objects inside it.
root.resizable=(false)
root.signal_connect('delete_event') {Gtk.main_quit}
#if we hit the X button, it calls main_quit and closes everything

######Create a Vertical Arrangement Box###########
$v1 = Gtk::VBox.new true, 3 #creates a Box where things are arranged Vrt
$v1.border_width = 3 #borderwidth 3
$v1.set_size_request(200, 350)
$v1.set_name("test")

######Create a Horizontal Arrangement Box###########
$h1 = Gtk::HBox.new true, 3 #creates a Box where widgets are arranged Hzt
$h1.border_width = 3 
$h1.set_size_request(100, 150)
$h1.set_name("test")

######Create a Horizontal Arrangement Box###########
$h2 = Gtk::HBox.new true, 3 #creates a Box where widgets are arranged Hzt
$h2.border_width = 3 #borderwidth 3
$h2.set_size_request(100, 100)
$h2.set_name("test")


######Create a Label###########
$lab1 = Gtk::Label.new("temp")
$lab1.text = "Phrase 1"  #oh look, we accidently called it 'temp'
#let's redefine it's text to "Phrase 1"

######Create a Button###########
$button1 = Gtk::Button.new("Button1")#Creates a Button Widget
$button1.signal_connect("clicked"){myproc}  
#when the button is clicked, calls the myproc function

######Create a Button###########
$button2 = Gtk::Button.new("Button2")#Creates a Button Widget
$button2.signal_connect("clicked"){myproc2($ent1.text)}  
#when the button is clicked, calls the myproc2 function passing the currrent value of the text in the entry field

######Create a Button###########
$button3 = Gtk::Button.new("Quit")#Creates a Button Widget
$button3.signal_connect("clicked"){Gtk.main_quit}  
#when the button is clicked, calls exit on the main window
  
######Create a Text Entry Field###########  
$ent1 = Gtk::Entry.new #This creates an entry widget

#set button 1's background color to red!
#you can set any widget's color like this. 
#be careful not to confuse a container and a widget.
#containers are not visible and so can't be colored!
color = Gdk::Color.parse("red")
$button1.modify_bg(Gtk::STATE_NORMAL, color)


root.add($v1)
#fill the root with the vertical box

$v1.pack_start($h1, expand = true, fill = true, padding = 0)
$v1.pack_start($h2, expand = true, fill = true, padding = 0)
#fill the vertical box with the two HZ boxes stacked vertically

$h1.pack_start($lab1, expand = true, fill = true, padding = 0)
#fill the first HZ box with the label

$h2.pack_start($button1, expand = true, fill = true, padding = 0)
$h2.pack_start($button2, expand = true, fill = true, padding = 0)
$h2.pack_start($button3, expand = true, fill = true, padding = 0)
$h2.pack_start($ent1, expand = true, fill = true, padding = 0)
#fill the 2nd hz box with the buttons and entry

root.show_all #activate the window on the screen

end

start()
Gtk.main



