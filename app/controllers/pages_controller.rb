class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @authorizations = YAML.load_file('config/authorizations.yml')
    @authorizations.extend Hashie::Extensions::DeepFind

    @my_authorizations = []
    
    if signed_in?
      current_user.roles.each do |role|
        role.role_permissions.each do |rp|
          @my_authorizations << rp.permission
        end
      end
    end
  end


  def HashToArray(hash, item = 'all')
    return unless hash.is_a?(Hash)

    itens = []
    hash.each do |key, value|
      if value.is_a?(Hash)
        itens.concat HashToArray(value, "#{item}.#{key}")
      elsif value.is_a?(Array)
        value.each { |v| itens << "#{item}.#{key}.#{v}" }
      else
        itens << "#{item}.#{key}.#{value}"
      end
    end

    itens
  end
end
