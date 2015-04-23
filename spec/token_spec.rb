require 'token'

RSpec.describe Token do
  it 'is created with only one character' do
    expect {
      Token.new('abc')
    }.to raise_error
  end

  describe 'operator?' do
    it 'returns true if the token represents an operator' do
      expect_tokens '+-*/^%=(),', to_be: :operator
    end

    it 'returns false if the token is not an operator' do
      expect_tokens 'abcdefgh!@#$', to_not_be: :operator
    end
  end

  describe 'digit?' do
    it 'returns true if the token represents a digit' do
      expect_tokens '0123456789', to_be: :digit
    end

    it 'returns false if the token is not a digit' do
      expect_tokens 'abcdefgh+-*!@#$', to_not_be: :digit
    end
  end

  describe 'white_space?' do
    it 'returns true if the token is a white space' do
      expect_tokens "\n   \t", to_be: :white_space
    end

    it 'returns false if the token is not a white space' do
      expect_tokens 'abcdefgh+-*!@#$', to_not_be: :white_space
    end
  end

  describe 'identifier?' do
    it 'returns true if the token is not an operator, a digit, or a white space' do
      expect_tokens 'abcdefghijklmn!@#$&', to_be: :identifier
    end

    it 'returns false if the token is an operator, a digit or a white space' do
      expect_tokens '1239+-* ', to_not_be: :identifier
    end
  end

  def expect_tokens(tokens, options)
    expectation = options[:to_be] || options[:to_not_be]

    tokens.each_char do |c|
      token = Token.new(c)

      if options.key?(:to_not_be)
        expect(token.send("#{expectation}?")).to be false
      else
        expect(token.send("#{expectation}?")).to be true
      end
    end
  end
end
