class GamesController < ApplicationController
  def new
    @letters = generate_rand_letters
  end

  def score
    @user_input = params[:word]
    @user_word = validate_user_input(@user_input)
  end

  private

  def generate_rand_letters
    charset = Array('a'..'z')
    Array.new(10) { charset.sample }
  end

  def validate_user_input(word)
    # 1-check if word is inside array
    # 2-check if word exist using API
    # 3-congratulate user
    word
  end
end
