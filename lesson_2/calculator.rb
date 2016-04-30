# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# LANGUAGE = 'en'
LANGUAGE = 'es'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def selection_to_message(sel)
  case sel
  when '1'
    prompt(messages('add', LANGUAGE))
  when '2'
    prompt(messages('subtract', LANGUAGE))
  when '3'
    prompt(messages('multiply', LANGUAGE))
  when '4'
    prompt(messages('divide', LANGUAGE))
  end
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  break unless name.empty?
  prompt(messages('valid_name', LANGUAGE))
end

prompt(messages('greeting_part1', LANGUAGE) + name + messages('greeting_part2', LANGUAGE))

loop do # main loop
  first_number = ''
  loop do
    prompt(messages('valid_first_number', LANGUAGE))
    first_number = gets.chomp

    break if number?(first_number)
    prompt(messages('number_error', LANGUAGE))
  end

  second_number = ''
  loop do
    prompt(messages('valid_second_number', LANGUAGE))
    second_number = gets.chomp

    break if number?(second_number)
    prompt(messages('number_error', LANGUAGE))
  end

  prompt(messages('selection_instructions_1', LANGUAGE))
  prompt(messages('selection_instructions_2', LANGUAGE))
  prompt(messages('selection_instructions_3', LANGUAGE))
  prompt(messages('selection_instructions_4', LANGUAGE))
  prompt(messages('selection_instructions_5', LANGUAGE))

  selection = ''
  loop do
    selection = gets.chomp

    break if %w(1 2 3 4).include?(selection)
    prompt(messages('valid_selection', LANGUAGE))
  end

  prompt(selection_to_message(selection))

  result =  case selection
            when '1'
              first_number.to_f + second_number.to_f
            when '2'
              first_number.to_f - second_number.to_f
            when '3'
              first_number.to_f * second_number.to_f
            when '4'
              first_number.to_f / second_number.to_f
            end

  prompt(messages('result', LANGUAGE) + result.to_s)

  prompt(messages('keep_calculating', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye', LANGUAGE))
