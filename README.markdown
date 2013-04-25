# CN Markdown Emoji for Rails

CN Markdown Emoji is fork from Markdown Emoji<https://github.com/elm-city-craftworks/md_emoji>


## Installation

Add the following line to your Gemfile

```
gem 'cn_md_emoji'
```

## Using

When creating a new markdown renderer, just use `CnMdEmoji::Render`

```ruby
markdown = Redcarpet::Markdown.new(CnMdEmoji::Render, :no_intra_emphasis => true)

markdown.render("Hello [呵呵] world!")
```

__Please take note__ that due to inconsistencies with the RedCarpet gem,
`:no_intra_emphasis => true` is required for emoji with multiple underscores:
`:eight_pointed_black_star:`

Emoji assets will automatically be picked up by the asset pipeline and made
available to your app at:

`/assets/emojis/<EMOJI_NAME>.png`

For a full list of supported emoji, just run `CnMdEmoji::EMOJI` in your console.

