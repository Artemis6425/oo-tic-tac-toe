class TicTacToe
    def initialize()
        @board = Array.new(9," ")
        @currentmove = 0
    end
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(num)
        num.to_i-1
    end
    def move(index, token)
        @board[index] = token
    end
    def position_taken?(index)
        @board[index] == " " ? false : true
    end
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index) ? true : false
    end
    def turn_count
        @board.count{|thing| thing != " "}
    end
    def current_player
        turn_count.even? ? "X" : "O"
    end
    def turn
        puts "Where do you want to go 1-9?"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            self.turn
        end
    end
    def won?
        WIN_COMBINATIONS.any? {|combo|
            if combo.all? { |temp| @board[temp] == "X"}
                return combo
            elsif combo.all? { |temp| @board[temp] == "O"}
                return combo
            end
        }
    end
    def full?
        @board.all? { |i| i =="X" || i == "O"}
    end
    def draw?
        self.won? == false && self.full? == true ? true : false
    end
    def over?
        won? || full? || draw? ? true : false
    end
    def winner
        temp = won?
        if temp == false
            nil
        else
            return @board[temp.first]
        end
    end
    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end