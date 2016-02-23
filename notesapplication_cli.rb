require_relative 'NotesApplication'

puts "Welcome to Note Taker written by IMAM Mubarak\nPress crtl-Z to exist(at any stage)\n"
#Takes in author name
print "Please enter your name: "
signed_in = false
while !signed_in
  name = gets.chomp
  if name.length >= 2
    Author1 = NotesApplication.new(name)
    print "Hi #{name}, thank you for enrolling, please press enter to start working"
    signed_in = true
  else
    print "The name you entered is not allowed.\nPlease re-enter your name: "
  end
end
gets.chomp

situation = true

while situation
  print "\nWhat do you want to do?\n1: Create note\t2: List notes\t3: Get note\n4: Edit note\t5: Delete Note\t6: Search notes\n\t\t"
  result = gets.chomp.to_i
  case result
    when 1
      print "Please enter your note contents below, please use '\\n' for line breaks, press 'Enter' when done.\n\n"
      puts Author1.create(gets.chomp)

    when 2
      Author1.list

    when 3
      note_id = nil
      until note_id.is_a?(Fixnum) do
        print "Please enter an integer for the note ID you want to get: "
        note_id = Integer(gets) rescue nil
      end
      puts Author1.get(note_id)

    when 4
      note_id = nil
      until note_id.is_a?(Fixnum) do
        print "Please enter an integer for the note ID you want to edit: "
        note_id = Integer(gets) rescue nil
      end
      Author1.edit(note_id)
        
    when 5
      note_id = nil
      until note_id.is_a?(Fixnum) do
        print "Please enter an integer for the note ID you want to delete: "
        note_id = Integer(gets) rescue nil
      end
      Author1.delete(note_id)

    when 6
      print "Please enter your search string: "
      search_string = gets.chomp
      Author1.search(search_string)

    else
      print "Are you sure you want to exit? Yes/No: "
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
        situation = false
        puts "Thank you for using this App.\nSee you some other time."
      end
  end
end