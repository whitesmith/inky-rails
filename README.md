# Inky-Rails

**Inky-Rails** allows you to render HTML e-mails from an
[Inky]https://github.com/zurb/inky) template.

An example template might look like:

```erb
<!-- TODO -->
```

And the partial `_info.inky`:

```erb
<!-- TODO -->
```

* Notice you can use ERb and partials inside the template.

Your `user_mailer.rb` might look like this::

```ruby
# ./app/mailers/user_mailer.rb
class UserMailer < ActionMailer::Base
  def user_signup_confirmation()
    mail(to: 'test@example.com', subject: 'test') do |format|
      format.text
      format.inky
    end
  end
end
```

## Installation

Add it to your Gemfile.

```ruby
gem 'inky-rails'
```

Run the following command to install it:

```console
bundle install
```

Install the Inky CLI parser (optional -g to install it globally):

```console
npm install -g inky-cli@^1.0
```

## Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as
much information as possible to help us fixing the possible bug. We also
encourage you to help even more by forking and sending us a pull request.

[github.com/whitesmith/inky-rails/issues](https://github.com/whitesmith/inky-rails/issues)

## License

MIT License. Copyright 2016 Whitesmith. [whitesmith.co](http://www.whitesmith.co)

Lovingly built on [github.com/sighmon/mjml-rails](https://github.com/sighmon/mjml-rails)
which was previously based on [github.com/plataformatec/markerb](https://github.com/plataformatec/markerb)
