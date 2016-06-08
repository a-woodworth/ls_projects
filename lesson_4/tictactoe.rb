# Make a Tic Tac Toe game.

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

# rubocop:disable AbcSize, disable Metrics/MethodLength
def display_board(brd, score)
  clear_screen
  puts "Score is: "
  display_score(score)
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]} "
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]} "
  puts "     |     |"
  puts ""
end
# rubocop:enable AbcSize, enable Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a position to place a piece:
      #{joinor(empty_squares(brd), ', ')}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

# def computer_countermeasure(board, marker)
#   WINNING_LINES.each do |line|
#     square = find_at_risk_square(line, board, marker)
#     break if square
#   end
# end

def computer_places_piece!(brd)
  square = nil
  # offense first
  # computer_countermeasure(brd, COMPUTER_MARKER)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  # defense second
  if !square
    # computer_countermeasure(brd, PLAYER_MARKER)
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  # pick middle square
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end
  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def score_game(winner, score)
  if winner == 'Player'
    score[:player] += 1
  elsif winner == 'Computer'
    score[:computer] += 1
  end
end

def display_score(score)
  score_array = []
  score_array << score.each_pair do |key, value|
    puts "#{key.capitalize} => #{value}"
  end
end

def joinor(array, punctuation=', ', word='or')
  array[-1] = "#{word} #{array.last}" if array.length > 1
  if array.length == 2
    array.join(' ')
  else
    array.join(punctuation)
  end
end

loop do
  clear_screen
  score = { player: 0, computer: 0 }
  winning_score = 5
  prompt("Welcome to Tic Tac Toe.")
  prompt("For each round the winner gets a point.")
  prompt("First one to #{winning_score} wins!")

  loop do
    board = initialize_board

    loop do
      display_board(board, score)
      player_places_piece!(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, score)
    score_game(detect_winner(board), score)

    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
      # prompt("Final score is: ")
      display_score(score)
    else
      prompt("It's a tie!")
    end

    break if  score[:player] == winning_score ||
              score[:computer] == winning_score
  end

  prompt("Select --> Y to play again. Q to quit.")
  answer = gets.chomp
  if answer.downcase.start_with?('q')
    break
  elsif answer.downcase.start_with?('y')
    clear_screen
    prompt("OK...starting a new game.")
  else
    prompt("Hmmm...I'm not sure what to do.")
    break
  end
end
prompt("Thanks for playing Tic Tac Toe! Goodbye.")
