class Hangman

    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
        @correct_guesses = []
        @word_teaser
        
        @word.first.size.times do 
            @word_teaser += "_ "
        end
    end

    def words
        [
            ["cricket", "A game played by gentlemen"],
            ["jogging", "We are not walking..."],
            ["celebrate", "Remembering special moments"],
            ["continent", "There are 7 of these"],
            ["exotic", "Not from around here"],
        ]
    end

    def print_teaser(last_guess)
        update_teaser unless last_guess.nil?
        puts @word_teaser
    end

    def update_teaser
        new_teaser = @word_teaser.split
        new_teaser.each_with_index do |letter, index| 
            if letter == '_'
        end
    end

    def make_guess
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp

            good_guess = @word.first.include? guess

            if good_guess
                puts "Good guess!"
                @correct_guesses << guess

                @letters.delete(guess)

                print_teaser(guess)
                make_guess
            else
                @lives -= 1
                puts "Sorry... you have #{ @lives } left. Try again!"
                make_guess
            end

        else
            puts "Game Over!"
        end
    end

    def begin
        puts "New game has started... your word is #{ @word.first.size } characters."
        print_teaser

        puts "Clue: #{ @word.last }."

        make_guess
    end

end

game = Hangman.new 
game.begin