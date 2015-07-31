# new_hash = {
#   language: {
#       type: [:x, :y], style: 'z'
#   }
# }

def reformat_languages(languages)
  new_hash = {}

  languages.each_pair do |style, langs|
    langs.each_pair do |language, specs|
      type = specs[:type]

      if new_hash.include? language
        new_hash[language][:style] << style
      else
        new_hash[language] = { type: type, style: [style] }
      end
    end
  end

  new_hash
end
