# Cogsworth: Natural Language Time Parser for Ruby

An attempt to make a natural language time parser for Ruby so you can convert from something like "1 hour 20 min" to value in seconds.

## Usage

    Cogsworth.parse('2 hours 30 minutes') => 9000
    
## Acceptable Formats

    '2 days 1 hour 35 minutes 25 seconds'
    '2days 1hr 35min 25sec'
    '2d1h35m25s'
    
The name of this gem is derived from Cogsworth, the character from Beauty and the Beast who is a clock.