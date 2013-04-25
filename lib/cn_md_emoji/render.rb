module CnMdEmoji
  class Render < Redcarpet::Render::HTML
    def initialize(options={})
      @options = options.merge(:no_intra_emphasis => true)
      super @options
    end

    def paragraph(text)
      text.gsub!("\n", "<br>\n") if @options[:hard_wrap]

      "<p>#{replace_emoji(text)}</p>\n"
    end

    def list_item(text, list_type)
      "<li>#{replace_emoji(text)}</li>"
    end

    # Replaces valid emoji characters, ie :smile:, with img tags
    #
    # Valid emoji charaters are listed in +MdEmoji::EMOJI+
    def replace_emoji(text)
      text.gsub(/\[(\S+?)\]/) do |emoji|
        emoji_code = emoji
        emoji      = emoji_code.gsub(/[\[\]]/, "")

        filename = nil

        if CnMdEmoji::CN_MOJI.include?(emoji)
          emoji = CnMdEmoji::CN_EN[emoji] 
          file_name    = "#{emoji}.gif"
        end

        if CnMdEmoji::EMOJI.include?(emoji)
          file_name    = "#{emoji}.png"
        end

        if file_name
          default_size = %{height="22" width="22"}
          %{<img src="/assets/emojis/#{file_name}" class="emoji" } +
            %{title="#{emoji_code}" alt="#{emoji_code}" #{default_size}>}
        else
          emoji_code
        end
      end
    end

    private

    # Returns +true+ if emoji are present in +text+, otherwise returns +false+
    def include_emoji?(text)
      text && text[/\[(\S+)\]/]
    end
  end
end
