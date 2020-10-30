# MagicWords

I often come across code that has been refactored by some well meaning engineers to as to avoid the usage of plain string literals. For example imagine some http request handling code.

```ruby
request.add_headers({"Content-Type" => "application/json"})
```

While this code may _appear_ simple and straightforward is is clearly in need of refactoring to avoid string literals.

```ruby
# ideally in a separate far-away file like lib/mygem/http/consts.rb
CONTENT_TYPE = "Content-Type"
APPLICATION_JSON = "application/json"

# much easier to maintain
request.add_headers({CONTENT_TYPE => APPLICATION_JSON})
```

However a major issue many developers run into when refactoring is the need to maintain said `const.rb` file(s) in a sufficiently indirect location. The purpose of the `magic_words` gem is to make managing such constants simple, automated, and abstract.

## Usage

Using `magic_words` is simple. We have some predefined dictionaries of commonly used consts, and otherwise you can add new dictionaries either by array or by file. Lets take a look at an example in practice.

```ruby
# Oh no, a "magic" string literal out in the wild!
puts "Thou shalt not create a constant whose value can't be anything else by definition."

require "magic_words"
require "active_support/all" # for String#titleize

# Load up the english dictionary
MagicWords::Dict.from_file("english", "/usr/share/dict/words")

# Much better
puts MagicWords::Dict::ENGLISH::THOU.titleize + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::SHALT + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::NOT + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::CREATE + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::A + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::CONSTANT + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::WHOSE + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::VALUE + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::CAN + MagicWords::Punctuation::SINGLE_QUOTE + MagicWords::Letters::T + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::BE + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::ANYTHING + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::ELSE + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::BY + MagicWords::Whitespace::SPACE +
     MagicWords::Dict::ENGLISH::DEFINITION + MagicWords::Punctuation::PERIOD
```

Couldn't be easier to avoid those pesky string literals floating around your codebase!

## Contributing

If you're interested in helping expand the feature set of `magic_words` please let me know. I'm currently looking for help with the following.

* A tool to automatically refactor existing repos to use `magic_words`.
* Internationalization.
* Remedial education for developers who mindlessly apply overgeneralizations such as "avoid hard coded string literals".

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
