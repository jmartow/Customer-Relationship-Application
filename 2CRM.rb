require_relative '2Contacts'
require_relative '2Rolodex'

class CRM

	def self.run
		my_CRM = CRM.new
		my_CRM.main_menu
	end

	def initialize
		@rolodex = Rolodex.new
	end

	def main_menu
		print_main_menu
		main_menu_selection = gets.chomp.to_i
		main_menu_process(main_menu_selection)
	end

	def print_main_menu
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Display a contact"
		puts "[4] Delete a contact"
		puts "[5] Display all contacts"
 		puts "[6] Display an attribute"
 		puts "[7] Exit"
 		puts "Enter a number: "
	end

	def main_menu_process(main_menu_selection)
		case main_menu_selection
		when 1 then get_new_contact_info
		when 2 then get_modify_info
		when 3 then select_contact_to_display
		when 4 then select_contact_to_delete
		when 5 then @rolodex.display_all_contacts
			main_menu
		when 6 then display_attribute_selection
		when 7 then	puts "Goodbye" 
		else 
			puts "Invalid option. Try again." 
			main_menu
		end
	end

	def get_new_contact_info
		puts "First name: "
		first_name = gets.chomp

		puts "Last name: "
		last_name = gets.chomp

		puts "Email address: "
		email = gets.chomp

		puts "Note: "
		note = gets.chomp

		@rolodex.add_new_contact(Contact.new(first_name, last_name, email, note))
		main_menu
	end

	def display_attribute_choices
		puts "[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email Address"
		puts "[4] Note"
 		puts "Enter a number: "
	end

	def select_contact
		@contact_selection = gets.chomp.to_i
	end

	def get_modify_info
		puts "Which contact would you like to modify?"
		@rolodex.display_all_contacts

		select_contact

		puts "What attribute would you like to modify?"
		display_attribute_choices
		@modify_options_selection = gets.chomp.to_i #error if not 1-4
		get_modification
	end

	def get_modification
		puts "What would you like to change this to?"
		@modification = gets.chomp
		perform_modification
	end

	def perform_modification
		@rolodex.perform_modification(@contact_selection, @modify_options_selection, @modification)
		main_menu
	end

	def select_contact_to_display
		puts "Which contact would you like to display?"
		contact_selection = gets.chomp.to_i
		@rolodex.display_a_contact(contact_selection)
	end

	def select_contact_to_delete
		puts "Which contact would you like to delete?"
		contact_selection = gets.chomp.to_i
		@rolodex.delete_a_contact(contact_selection)
		main_menu
	end

	def display_attribute_selection
		puts "Which attribute would you like to display?"
		display_attribute_choices
		attribute_selection = gets.chomp.to_i
		@rolodex.display_attribute(attribute_selection)
	end

end

CRM.run

