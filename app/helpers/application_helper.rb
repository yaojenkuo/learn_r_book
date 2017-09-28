module ApplicationHelper
    class CustomRender < Redcarpet::Render::HTML
        def image(link, title, alt_text)
            if link =~ /^(.+?)\s*=+(\d+)(?:px|)$/
            # e.g. ![alt](url.png =100px)
            # e.g. ![alt](url.png =100)
                %(<img src="#{$1}" style="max-width: #{$2}px" alt="#{alt_text}">)
            elsif link =~ /^(.+?)\s*=+(\d+)(?:px|)x(\d+)(?:px|)$/
            # e.g. ![alt](url.png =30x50)
                %(<img src="#{$1}" style="max-width: #{$2}px; max-height: #{$3}px;" alt="#{alt_text}">)
            else
                %(<img src="#{link}" title="#{title}" alt="#{alt_text}">)
            end
        end
    end
    class HTMLwithPygments < Redcarpet::Render::HTML
        def block_code(code, language)
            Pygments.highlight(code, lexer: language)
        end
    end
    def to_markdown(content)
        renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
        options = {
            autolink:           true,
            fenced_code_blocks: true,
            lax_spacing:        true,
            no_intra_emphasis:  true,
            strikethrough:      true,
            superscript:        true,
            disable_indented_code_blocks: true
        }
        Redcarpet::Markdown.new(renderer, options).render(content).html_safe
    end
end
