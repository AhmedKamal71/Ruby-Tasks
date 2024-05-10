require 'json'
class Inventory
    attr_accessor :arrayOfBooks
    def initialize
        @arrayOfBooks = begin
            JSON.parse(File.read('inventory.txt'))
        end
    end

    def add_book(title, author, isbn = @arrayOfBooks.length + 1)
        book = {isbn: ,title: title, author: author}
        @arrayOfBooks.push(book)
        file = File.open('inventory.txt', 'w') do |file|
            file.write(JSON.pretty_generate(@arrayOfBooks))
        end
    end

    def print_inventory
        @arrayOfBooks.each do |book|
            puts book
        end
    end

    def delete_book(isbn)
        @arrayOfBooks.each_with_index do |book, index|
            if book[:isbn] == isbn
                @arrayOfBooks.delete_at(index)
            end
        end
    end

    def search_title(title)
        @arrayOfBooks.each do |book|
            if book[:title] == title
                puts 'book found with title: #{book[:title]} and author: #{book[:author]}'
            end
        end
    end

    def search_author(author)
        @arrayOfBooks.each do |book|
            if book[:author] == author
                puts 'book found with title: #{book[:title]} and author: #{book[:author]}'
            end
        end
    end

    def search_isbn(isbn)
        @arrayOfBooks.each do |book|
            if book[:isbn] == isbn
                puts 'book found with title: #{book[:title]} and author: #{book[:author]}'
            end
        end
    end

    def user_menu
        puts '1- Add book'
        puts '2- Delete book'
        puts '3- Search by title'
        puts '4- Search by author'
        puts '5- Search by isbn'
        puts '6- Print inventory'
        puts '7- Exit'
        puts 'Enter your choice: '
        choice = gets.chomp
        case choice
        when '1'
            puts 'Enter book title: '
            title = gets.chomp
            puts 'Enter book author: '
            author = gets.chomp
            add_book(title, author)
            user_menu
        when '2'
            puts 'Enter book isbn: '
            isbn = gets.chomp
            delete_book(isbn)
            user_menu
        when '3'
            puts 'Enter book title: '
            title = gets.chomp
            search_title(title)
            user_menu
        when '4'
            puts 'Enter book author: '
            author = gets.chomp
            search_author(author)
            user_menu
        when '5'
            puts 'Enter book isbn: '
            isbn = gets.chomp
            search_isbn(isbn)
            user_menu
        when '6'
            print_inventory
            user_menu
        when '7'
            puts 'Goodbye'
        else
            puts 'Invalid choice'
            user_menu
        end
    end
end

book1 = Inventory.new
book1.user_menu
