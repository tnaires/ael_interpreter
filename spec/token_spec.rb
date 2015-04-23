require 'token'

RSpec.describe Token do
  describe 'operator?' do
    it 'returns true if the token represents an operator' do
      expect_tokens '+-*/^%=(),', to_be: :operator
    end

    it 'returns false if the token is not an operator' do
      expect_tokens 'abcdefgh!@#$', to_not_be: :operator
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
