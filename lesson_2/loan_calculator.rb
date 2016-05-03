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
  if loan_amount == '0'
    prompt(messages('loan_error', LANGUAGE))
    prompt(get_loan_amount)
  elsif loan_amount = float?(loan_amount)
    loan_amount.to_f.to_s
  else # For letters/words
    prompt(messages('loan_error', LANGUAGE))
    prompt(get_loan_amount)
  end
end

def validate_apr(apr)
  if apr == '0'
    prompt(messages('interest_free', LANGUAGE))
  elsif apr = float?(apr)
    apr.to_f.to_s
  else # For letters/words
    prompt(messages('apr_error', LANGUAGE))
    prompt(get_apr)
  end
end

def validate_years(years)
  if years == '0'
    prompt(messages('years_error', LANGUAGE))
    prompt(get_years)
  elsif years = float?(years)
    years.to_f.to_s
  else
    prompt(messages('years_error', LANGUAGE))
    prompt(get_years)
  end
end

# Get loan amount
def get_loan_amount
  prompt(messages('enter_loan_amount', LANGUAGE))
  loan_amount = gets.chomp
  loan_amount.delete!('$,') # If added, remove $ and , from value
  if validate_loan(loan_amount) != nil
    prompt(messages('value_confirmation', LANGUAGE) +
      sprintf('$%.2f', loan_amount))
  end
end

# Get Annual Percentage Rate
def get_apr
  prompt(messages('enter_apr', LANGUAGE))
  apr = gets.chomp
  apr.delete!('%') # If added, remove % from value
  if validate_apr(apr) != nil
    prompt(messages('value_confirmation', LANGUAGE) + apr + '%.')
    prompt(messages('monthly_rate', LANGUAGE) + monthly_rate(apr).to_s + '%.')
  end
end

# Monthly interest rate
def monthly_rate(apr)
  apr = apr.to_f
  rate = apr / 1200
  rate.round(6)
end

# Get loan duration in years
def get_years
  prompt(messages('enter_years', LANGUAGE))
  years = gets.chomp
  if validate_years(years) != nil
    prompt(messages('value_confirmation', LANGUAGE) + years + ' years.')
  end
end

# Loan duration in months
def number_of_monthly_payments
end

def calculate_payment
  loan_amount = ''
  apr = ''
  monthly_rate = 0
  years = ''

  prompt(messages('welcome', LANGUAGE))
  prompt(messages('usage', LANGUAGE))

  loop do # Ask user for loan amount
    prompt(get_loan_amount)
    break unless loan_amount.to_f > 0
  end

  loop do # Ask user for APR
    prompt(get_apr)
    break if apr.to_f >= 0
  end

  prompt(messages('years_greeting', LANGUAGE))
  loop do # Ask user for number of years (loan duration)
    prompt(get_years)
    break unless years.to_f > 0
  end
end

calculate_payment
