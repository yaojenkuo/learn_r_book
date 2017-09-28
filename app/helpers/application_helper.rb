module ApplicationHelper
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
