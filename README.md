# Deepstate::Rails

Rails integration of [DeepState](https://github.com/ideasasylum/deepstate).

## Usage

```
class Cat < ApplicationRecord
  include DeepState::Rails

  use_deep_state_machine LifeOfACat, column: :state, as: :life, with: {}
end
```

will add a `LifeOfACat` state machine to any instance of `Cat` using the `state` column to store the state. 

Adds `model` and `cat` to the state machine context.

See [DeepState](https://github.com/ideasasylum/deepstate) for more details on how to specify a state machine

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deepstate-rails'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install deepstate-rails
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
