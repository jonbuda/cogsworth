module Cogsworth
  class << self
    MULTIPLIERS = {
      "s" => (1),
      "m" => (60),
      "h" => (60 * 60),
      "d" => (60 * 60 * 24)
    }
    
    def parse(string)
      string.gsub(' ','').downcase.scan(/(\d+)([a-zA-Z]+)/).inject(0) do |sum, pair|
        sum += pair[0].to_i * MULTIPLIERS[pair[1].slice(0,1)]
      end
    end
    
    def unparse(seconds, strings=[])
      return strings.join(' ') if seconds == 0
      
      ['d','h','m','s'].each do |unit|
        times = seconds/MULTIPLIERS[unit]
        return unparse(seconds%MULTIPLIERS[unit], strings << "#{times}#{unit}") if times > 0
      end
      
      return unparse(seconds, strings)
    end
  end
end
