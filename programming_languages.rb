# new_hash = {
#   language: {
#       type: [:x, :y], style: 'z'
#   }
# }

# old_hash = {
#   type: {
#     language: {
#       style: 'z'
#     }
#   }
# }

# style_arr = [
#   :oo,
#   { ruby:       { type: 'interpreted' },
#     javascript: { type: 'interpreted' },
#     python:     { type: 'interpreted' },
#     java:       { type: 'compiled'    }
#   }
# ]

def reformat_languages(languages)
  languages.each_with_object({}) do |style_arr, new_hash|
    style = style_arr.first
    langs = style_arr.last

    langs.each_pair do |language, specs|
      if new_hash.include? language
        new_hash[language][:style] << style
      else
        new_hash[language] = { type: specs[:type], style: [style] }
      end
    end
  end
end
