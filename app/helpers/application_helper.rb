module ApplicationHelper
  def AutorizationsToHTML(authorizations, permissions, level = 'all')
    return unless authorizations.is_a?(Hash)

    li = "<li id='%s' class='%s'>"

    out = '<ul>'
    authorizations.each do |key, value|
      puts 'passou'
      out += (li % ["#{level}.#{key}", 'achado']) + key

      if value.is_a?(Hash)
        out += AutorizationsToHTML(value, permissions, "#{level}.#{key}")
      elsif value.is_a?(Array)
        out += '<ul>'
        value.each do |v|
          out += (li % ["#{level}.#{key}.#{v}", 'achado']) + v + '</li>'
        end
        out += '</ul>'
      else
        out += (li % ["#{level}.#{key}.#{value}", 'achado']) + value + '</li>'
      end
    end

    out += "</li></ul>"
  end

  def HashToHTML(hash, opts = {})
    return if !hash.is_a?(Hash)

    indent_level = opts.fetch(:indent_level) { 0 }

    out = " " * indent_level + "<ul>\n"

    hash.each do |key, value|
      out += " " * (indent_level + 2) + "<li><strong>#{key}:</strong>"

      if value.is_a?(Hash)
        out += "\n" + HashToHTML(value, :indent_level => indent_level + 2) + " " * (indent_level + 2)
      elsif value.is_a?(Array)
        value.each do |v|
          out += " - #{v}"
        end
      else
        out += " <span>#{value}</span>"
      end
    end

    out += "</li>\n" * indent_level + "</ul>\n"
  end

  def permission_humanize(permission)
    return 'CAN' if permission

    'CANNOT'
  end
end
