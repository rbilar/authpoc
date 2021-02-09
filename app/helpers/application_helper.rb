module ApplicationHelper
  def AutorizationsToHTML(authorizations, permissions, level = 'all')
    return unless authorizations.is_a?(Hash)

    li = "<li id='%s' class='%s'>"

    out = '<ul>'
    authorizations.each do |key, value|
      out += (li % ["#{level}.#{key}", permission_class("#{level}.#{key}", permissions)]) + key

      if value.is_a?(Hash)
        out += AutorizationsToHTML(value, permissions, "#{level}.#{key}")
      elsif value.is_a?(Array)
        out += '<ul><li>'
        value.each do |v|
          out += "<span id='#{level}.#{key}.#{v}' class='#{permission_class("#{level}.#{key}.#{v}", permissions)}'>#{v}</span> | "
        end
        out += '</ul></li>'
      else
        out += (li % ["#{level}.#{key}.#{value}", permission_class("#{level}.#{key}.#{value}", permissions)]) + value + '</li>'
      end
    end

    out += "</li></ul>"
  end

  def permission_class(autorization, permissions)
    return 'with_permission' if permission_path?(autorization, permissions)

    'without_permission'
  end

  def permission_path?(autorization, permissions)
    puts "- - - - - - - - - - - - "

    permissions.each do |permission|
      auth = ''
      autorization.split('.').each_with_index do |a, i|
        if (i.positive?)
          auth += '.' + a
          puts permission + " | " + auth
          return true if auth.start_with? permission
        else
          auth += a
        end
      end
    end

    false
  end

  def permission_humanize(permission)
    return 'CAN' if permission

    'CANNOT'
  end
end
