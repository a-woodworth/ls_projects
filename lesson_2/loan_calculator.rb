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
    prompt(messages('error_message', LANGUAGE))
  elsif loan_amount = float?(loan_amount)
    loan_amount.to_f.to_s
  else # For letters/words
    prompt(messages('error_message', LANGUAGE))
    loan_amount = gets.chomp
    loan_amount.delete!('$,') # If added, remove $ and , from value
    prompt(messages('value_confirmation', LANGUAGE) +
        sprintf('$%.2f', loan_amount))
  end
end

def validate_apr(apr)
  if apr == '0'
    prompt(messages('interest_free', LANGUAGE))
  elsif apr = float?(apr)
    apr.to_f.to_s
  else # For letters/words
    prompt(messages('apr_error', LANGUAGE))
    apr = gets.chomp
    apr = validate_apr(apr)
    prompt(messages('value_confirmation', LANGUAGE) + apr.to_s + '%.')
  end
end

# Monthly interest rate
def monthly_rate
end

# Loan duration in years


# Loan duration in months
def number_of_monthly_payments
end

def calculate_payment
  loan_amount = ''
  apr = ''

  prompt(messages('welcome', LANGUAGE))
  prompt(messages('usage', LANGUAGE))

  loop do # Get loan amount
    prompt(messages('enter_loan_amount', LANGUAGE))
    loan_amount = gets.chomp
    loan_amount.delete!('$,') # If added, remove $ and , from value
    if validate_loan(loan_amount) != nil
      prompt(messages('value_confirmation', LANGUAGE) +
        sprintf('$%.2f', loan_amount))
    end
    loan_amount

    break unless loan_amount.to_f == 0
  end

  loop do # Get Annual Percentage Rate
    prompt(messages('enter_apr', LANGUAGE))
    apr = gets.chomp
    apr.delete!('%') # If added, remove % from value
    if validate_apr(apr) != nil
      prompt(messages('value_confirmation', LANGUAGE) + apr + '%.')
    end
    apr

    break if apr.to_f >= 0
  end
end

calculate_payment
