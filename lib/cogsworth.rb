module Cogsworth
  class << self
    MULTIPLERS = {
      "s" => (1),
      "m" => (60),
      "h" => (60 * 60),
      "d" => (60 * 60 * 24)
    }
    
    def parse(string)
      string.gsub(' ','').downcase.scan(/(\d+)([a-zA-Z]+)/).inject(0) do |sum, pair|
        sum += pair[0].to_i * MULTIPLERS[pair[1].slice(0,1)]
      end
    end
    
    def unparse(seconds)
      "1m"
    end
  end
end
