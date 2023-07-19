# Tiktoken tokenizer for Roseflow

[tiktoken](https://github.com/openai/tiktoken) is a fast BPE tokenizer for use with OpenAI's models. `roseflow-tiktoken` gem helps you use the tokenizer in Ruby, especially with (Roseflow)[https://github.com/ljuti/roseflow].

This gem wraps the (`tiktoken_ruby` gem)[https://github.com/IAPark/tiktoken_ruby] for convenient use in Roseflow.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
$ bundle add roseflow-tiktoken
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
$ gem install roseflow-tiktoken
```

## Usage

Encode with tokenizer.

```ruby
tokenizer = Roseflow::Tiktoken::Tokenizer.new(model: "gpt-3.5-turbo")
tokenizer.encode("Turn this string into tokens.") # => [...] array of tokens
```

Decode with tokenizer.

```ruby
tokenizer = Roseflow::Tiktoken::Tokenizer.new(model: "gpt-3.5-turbo")
tokenizer.decode([19952, 420, 925, 1139, 11460, 13]) # => "Turn this string into tokens.")
```

### Encodings

`roseflow-tiktoken` supports these encodings used by OpenAI models:

| Encoding name           | OpenAI models                                                             |
| ----------------------- | ------------------------------------------------------------------------- |
| `cl100k_base`           | ChatGPT models, `text-embedding-ada-002`                                  |
| `p50k_base`             | Code models, `text-davinci-002`, `text-davinci-003`                       |
| `p50k_edit`             | Use for edit models like `text-davinci-edit-001`, `code-davinci-edit-001` |
| `r50k_base` (or `gpt2`) | GPT-3 models like `davinci`                                               |

If a model is not provided or is unknown to the library, it will default to `cl100k_base` encoding.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/roseflow-ai/roseflow-tiktoken.

## Community

### Discord

Join us in our [Discord](https://discord.gg/roseflow).

### Twitter

Connect with the core team on Twitter.

<a href="https://twitter.com/ljuti" target="_blank">
  <img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/ljuti?logo=twitter&style=social">
</a>

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `roseflow-tiktoken` project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/roseflow-ai/roseflow-tiktoken/blob/main/CODE_OF_CONDUCT.md).
