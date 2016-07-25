require 'grape-swagger'

module V1
  class API < Grape::API
    version 'v1'
    format :json
    prefix :api

    mount PersonApi

    unless Rails.env.production?
      add_swagger_documentation(
        api_version: 'v1',
        mount_path: '/',
        hide_format: true,
        add_base_path: true
      )
    end
  end
end
