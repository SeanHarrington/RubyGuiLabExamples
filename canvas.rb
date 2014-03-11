 #!/usr/bin/ruby
require "gtk2"

#### A better way to read methods, alphabetical!
#### Just call the method and pass it an object.
#### Ruby can be conquered if you can quickly 
####   find the right methods and this helps!
#example:   sMethods(@canvas) 
def sMethods(pObject)
	sean = Array.new
	sean = pObject.methods
	sean = sean.sort
	puts sean
end


class RubyApp < Gtk::Window
	def initialize
		super
		set_title "This is Good"
		signal_connect "destroy" do
			Gtk.main_quit
		end
		init_ui
		set_default_size 460,460
		set_window_position Gtk::Window::POS_CENTER
		show_all
	end

	def init_ui
	@canvas = Gtk::DrawingArea.new
	@canvas.signal_connect "expose-event" do
		on_expose
		end
	add(@canvas)
	end
	
	def on_expose
		n = 21
		srand(15110)
		memory = Array.new(n)
		for i in 0..n-1 do
			memory[i] = Array.new(n)
			for j in 0..n-1 do
				memory[i][j] = rand(4)
			end
		end
		cr = @canvas.window.create_cairo_context
		draw_colors(cr,memory)
	end
	
	def draw_colors(cr,memory)
		nrows = memory.length
		ncols = memory[0].length
		colors = ["red","lightgreen","green","darkgreen"]
		for row in 0..nrows -1 do
			for col in 0..ncols -1 do
				    if memory[row][col] == 0 #red
						cr.set_source_rgb 1, 0, 0
				    elsif memory[row][col] == 1 #light green
						cr.set_source_rgb 0, 0.33, 0
				    elsif memory[row][col] == 2 #green
						cr.set_source_rgb 0, 0.66, 0
				    else #darkgreen
				    	cr.set_source_rgb 0, 1, 0
				    end
				    cr.rectangle (col +1)*20, (row+1)*20, 19, 19
					cr.fill
    		end
		end
    end
end


Gtk.init
window = RubyApp.new
Gtk.main
