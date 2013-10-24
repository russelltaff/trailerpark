module MoviesHelper

def hash_list_tag(hash)
  html = content_tag(:ul) {
    ul_contents = ""
    ul_contents << content_tag(:li, hash[:parent])
    hash[:children].each do |child|
      ul_contents << hash_list_tag(child)
    end

    ul_contents.html_safe
  }.html_safe
end
end 