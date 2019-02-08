# Erb::Indent

A gem that supports [Feature #15538](https://bugs.ruby-lang.org/issues/15538).

## Installation

    $ gem install erb-indent

## Usage

```rb
require 'erb/indent'

erb = <<-ERB
1
<%| [2, 3, 4].each do |num| -%>
  <% unless num == 3 -%>
    <%= num %>
  <% end -%>
<%| end -%>
5
ERB

puts Erb::Indent.new(erb, nil, "-").result
```

```
1
2
4
5
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
