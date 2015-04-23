class Lexer
  def lex(input)
    input.chars.reduce([]) do |tokens, c|
      token = Token.new(c)
      tokens << token unless token.white_space?
      tokens
    end
  end
end
