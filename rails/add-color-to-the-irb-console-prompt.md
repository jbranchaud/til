# Add Color To The IRB Console Prompt

IRB has a little-known [`Color`
module](https://docs.ruby-lang.org/en/3.2/IRB/Color.html) with some helpers for
adding a splash of color to the IRB prompt. I like to clearly differentiate the
environment I'm in when connecting to the `rails console`, so I have a
customize the prompt to display and colorize the current environment.

I can wrap any string in ANSI escape codes that instruct the terminal to style
the text with color. For instance, here is how I can style the word `DEV` to be
inverted against a blue background.

```ruby
IRB::Color.colorize("DEV", [:BLUE, :BOLD, :REVERSE])
```

which will clearly stand out from `PROD` against a red background:

```ruby
IRB::Color.colorize("PROD", [:RED, :BOLD, :REVERSE])
```

Here is a full example of customizing the prompt from the
`config/application.rb` file.

```ruby
module MyApp 
  class Application < Rails::Application
    # ...

    console do
      # Get the application module name and convert to kebab-case
      app_name = Rails.application.class.module_parent.name
      kebab_name = app_name.underscore.dasherize

      # Environment color coding
      env_colors = {
        "development" => IRB::Color.colorize("DEV", [:BLUE, :BOLD, :REVERSE]),
        "production" => IRB::Color.colorize("PROD", [:RED, :BOLD, :REVERSE]),
        "test" => IRB::Color.colorize("TEST", [:YELLOW, :BOLD, :REVERSE]),
      }

      colored_env = "(#{env_colors[Rails.env]})"

      # Docs: https://docs.ruby-lang.org/en/3.2/IRB.html#module-IRB-label-Customizing+the+IRB+Prompt
      IRB.conf[:PROMPT][:RAILS_APP] = {
        PROMPT_I: "#{kebab_name}#{colored_env}> ",
        PROMPT_N: "#{kebab_name}#{colored_env}* ",
        PROMPT_S: "#{kebab_name}#{colored_env}% ",
        PROMPT_C: "#{kebab_name}#{colored_env}? ",
        RETURN: "=> %s\n"
      }

      # Set it as the current prompt
      IRB.conf[:PROMPT_MODE] = :RAILS_APP
    end
  end
end
```

The Ruby docs have more about [IRB Prompt
Customization](https://docs.ruby-lang.org/en/3.2/IRB.html#module-IRB-label-Customizing+the+IRB+Prompt).
