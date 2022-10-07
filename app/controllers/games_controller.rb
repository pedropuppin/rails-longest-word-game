require 'json'
require 'open-uri'

class GamesController < ApplicationController
  VOWELS = %w(a e i o u y)

  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (Array('a'..'z') - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @user_input = params[:word] || ""
    @is_in_array = include?(@user_input, @letters)
    @is_english_word = is_english?(@user_input)
  end

  private

  # 1-check if word is inside array
  def include?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  # 2-check if word exist using API
  def is_english?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_response = URI.open(url).read
    word = JSON.parse(word_response)
    word['found']
  end
end
