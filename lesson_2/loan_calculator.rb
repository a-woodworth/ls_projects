# Build a mortgage calculator. You'll need three pieces of information:
# 1) the loan amount, 2) the Annual Percentage Rate (APR), 3) the loan duration

require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')
LANGUAGE = 'en'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def float?(number)
  Float(number) rescue false
end

def validate_loan(loan_amount)
  if loan_amount.to_f <= 0
    prompt(messages('loan_error', LANGUAGE))
  elsif loan_amount.to_f && loan_amount.to_f > 0
    float?(loan_amount) && loan_amount.to_f.to_s
  else # For letters/words
    prompt(messages('loan_error', LANGUAGE))
  end
end

def validate_apr(apr)
  if apr.to_f == 0
    prompt(messages('interest_free', LANGUAGE))
  elsif apr.to_f > 0
    float?(apr) && apr.to_f.to_s
  else # For letters/words
    prompt(messages('apr_error', LANGUAGE))
  end
end

def validate_years(years)
  if years.empty? || years.to_i < 0
    prompt(messages('years_error', LANGUAGE))
  elsif years.to_i > 0
    years.to_i.to_s
  else
    prompt(messages('years_error', LANGUAGE))
  end
end

def clear_screen
  system('clear') || system('cls')
end

prompt(messages('welcome', LANGUAGE))
prompt(messages('usage', LANGUAGE))
loop do
  loan_amount = ''
  apr = ''
  years = ''

  loop do # Ask user for loan amount
    prompt(messages('enter_loan_amount', LANGUAGE))
    loan_amount = gets.chomp
    loan_amount.delete!('$,') # If added, remove $ and , from value
    validate_loan(loan_amount)
    break if loan_amount.to_f > 0
  end
  prompt(messages('value_confirmation', LANGUAGE) +
    format('$%.2f', loan_amount))

  loop do # Ask user for Annual Percentage Rate
    prompt(messages('enter_apr', LANGUAGE))
    apr = gets.chomp
    apr.delete!('%') # If added, remove % from value
    validate_apr(apr)
    break if apr.to_f >= 0
  end
  prompt(messages('value_confirmation', LANGUAGE) + apr + '%.')

  prompt(messages('years_greeting', LANGUAGE))
  loop do # Ask user for number of years (loan duration)
    prompt(messages('enter_years', LANGUAGE))
    years = gets.chomp
    validate_years(years)
    break if years.to_i > 0
  end
  prompt(messages('value_confirmation', LANGUAGE) + years + ' years.')

  annual_rate = apr.to_f / 100
  monthly_rate = annual_rate / 12
  months = years.to_i * 12

  calculated_payment =  (monthly_rate * loan_amount.to_f) /
                        (1 - ((1 + monthly_rate)**-months))

  prompt(messages('payment', LANGUAGE) + format('$%.2f', calculated_payment))

  prompt(messages('instructions', LANGUAGE))
  answer = gets.chomp
  if answer.downcase.start_with?('q')
    break
  elsif answer.downcase.start_with?('y')
    prompt(messages('new_calculation', LANGUAGE))
    clear_screen
  else
    prompt(messages('instructions_help', LANGUAGE))
    break
  end
end
prompt(messages('goodbye', LANGUAGE))
