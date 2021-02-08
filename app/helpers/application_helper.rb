module ApplicationHelper
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
