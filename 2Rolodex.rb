class Rolodex
	def initialize 
		@id_counter = 1000
		@contacts = []
	end

	def add_new_contact(contact)
		contact.id = @id_counter
		@contacts << contact
		@id_counter += 1
	end

	def display_all_contacts
		@contacts.each do |contact|
		puts "#{contact.id} - #{contact}"
		end
	end

	def perform_modification(contact_selection, modify_options_selection, modification)
		array_location = contact_selection - 1000

		case modify_options_selection
		when 1 then @contacts[array_location].first_name = modification
		when 2 then @contacts[array_location].last_name = modification
		when 3 then @contacts[array_location].email = modification
		when 4 then @contacts[array_location].note = modification
		end
	end

	def display_a_contact(contact_selection)
		array_location = contact_selection - 1000
		puts @contacts[array_location]
	end

	def delete_a_contact(contact_selection)
		array_location = contact_selection - 1000
		@contacts.delete(@contacts[array_location])
	end

	def display_attribute(attribute_selection)
		@contacts.each do |contact|

			case attribute_selection
			when 1 then puts contact.first_name
			when 2 then puts contact.last_name
			when 3 then puts contact.email
			when 4 then puts contact.note
			end
		end
	end

end

