# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'api/public' => 'api/public#public'
  get 'api/private' => 'api/private#private'
  get 'api/private-scoped' => 'api/private#private_scoped'
end