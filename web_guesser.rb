require "sinatra"
require "sinatra/reloader"


SECRET_NUMBER = rand(100) + 1


def check_guess(guess)
  if guess.to_i > SECRET_NUMBER
    message = "That number is too high, try again."
  elsif guess.to_i < SECRET_NUMBER
    message = "That number is too low, try again."
  else
    message = "You got it! The secret number was #{SECRET_NUMBER}!"
  end
end

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}

end







