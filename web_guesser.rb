require "sinatra"
require "sinatra/reloader"


@@secret_number = rand(100) + 1
message = ""
@@background_color = "grey"



def check_guess(guess)
  if guess > @@secret_number
    if (guess - @@secret_number) > 10
    message = "You're over 10 off too high, try again."
    else
    message = "You're close, but still to high, try again"
    end
  elsif guess.to_i < @@secret_number
    if (@@secret_number - guess) > 10
      message = "That number is over 10 too low, try again."
    else
    message = "You're close, but too low, try again."
    end
  else
    @@background_color = "green"
    message = "Nailed it! #{@@secret_number} was the secret number!"
    #background_color = "Green"
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => @@secret_number, :message => message, :background_color => @@background_color,}

end







