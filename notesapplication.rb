class NotesApplication
  attr_accessor :author
  def initialize(author)
    @author = author
    @notes = []
    puts "You've successfully added the author #{@author}"
  end

  def create(note_content)
    if note_content.length > 5
      @notes << note_content
      return "\nNote created successfully with ID #{@notes.length - 1}"
    else
      return "\nThe note_content is not valid."
    end
  end

  def list
    if @notes.length < 1
      puts "\nThere are no notes at this time"
    else
    	count = 0
    	while count < @notes.length
        if @notes[count].is_a?String
          puts display_note(count, @author)
        end
  	    count += 1
      end
    end
  end

  def get(note_id)
    if note_id >= 0 && note_id < @notes.length
      return display_note(note_id, @author)
    else
      return "\nThe note at #{note_id} does not exist."
    end
  end

  def search(search_text)
    if @notes.length > 0
      if search_text.length > 0
        search_string = search_text.downcase
        count = 0
        puts "\nShowing results for search '#{search_text}'\n\n"
        found = false
        while count < @notes.length
          if @notes[count].downcase.include?search_string
            found = true
            puts display_note(count, @author)
    	    end
    	    count += 1
        end
        if found
          return "Search was successful."
        end
        if !found
          puts "\nThere are no notes containing '#{search_text}'."
        end
      else
        puts "\nThe string you entered is invalid."
    	end
    else
      puts "\nYou have not written any notes at this time."
    end
  end

  def delete(note_id)
    if note_id >= 0 && note_id < @notes.length
      if @notes[note_id] == nil
        puts "\nThe note you tried to delete is already deleted."
      else
        @notes[note_id] = nil
        puts "\nNote with ID:#{note_id} deleted successfully."  
      end
    else
      puts "\nThe note you tried to delete does not exist."
    end
  end

  def edit(note_id)
    if note_id >= 0 && note_id < @notes.length
      print "Please enter your new note contents below, press 'Enter' when done\n\n"
      new_content = gets.chomp
      if new_content.length > 5
        @notes[note_id] = new_content
        puts "\nThe note with ID: #{note_id} was edited successfully."
      else
        puts "\nThe note content you just entered is invalid."
      end
    else
      puts "\nThe note you tried to edit does not exist."
    end
  end

  def display_note(id, author)
    return "Note ID: #{id}\n#{@notes[id]} \n\nBy Author #{author}\n------------------------------------------------------------------"
  end
end