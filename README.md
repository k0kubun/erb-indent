# Erb::Indent

A gem that supports [Feature #15538](https://bugs.ruby-lang.org/issues/15538).

## Installation

    $ gem install erb-indent

## Usage

```rb
require 'erb/indent'

erb = <<-ERB
<#-- <% hello %> --#>
hello
ERB

Erb::Indent.new(erb).result #=> "\nhello\n"
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
