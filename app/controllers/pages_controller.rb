class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if signed_in?
      @authorizations = authorizations
      @my_authorizations = my_authorizations
    end
  end

  def authorizations
    authorizations = YAML.load_file('config/authorizations.yml')
    authorizations.extend Hashie::Extensions::DeepFind
  end

  def my_authorizations
    my_authorizations = []

    current_user.roles.each do |role|
      role.role_permissions.each do |rp|
        my_authorizations << rp.permission
      end
    end

    my_authorizations
  end
end
