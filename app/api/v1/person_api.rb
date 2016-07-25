require 'action_controller/metal/strong_parameters'

module V1
  class PersonApi < Grape::API

  	helpers do
  		def person_params
        ActionController::Parameters.new(params).permit(:firstname, :lastname)
      end
  	end

    desc 'create a Person'
    
    params do
      requires :firstname, type: String, allow_blank: false, desc: 'Firstname of the user'
      requires :lastname, type: String, allow_blank: false, desc: 'Lastname of the user'
    end

    post '/people', http_codes: [
      [201, 'Create was successful'],
      [404, 'Create was unsuccessful']
    ] do
      
      person = Person.new(person_params);
      if person.save        
        status 201
        person
      else
        status 404
      end
    end

    desc 'A list of available people'

    get '/liste' do
      Person.all
    end

  end
end
