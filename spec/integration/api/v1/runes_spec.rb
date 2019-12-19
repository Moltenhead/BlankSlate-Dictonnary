require 'swagger_helper'

describe :ApiV1RunesController, type: :request, swagger_doc: 'v1/swagger.json'  do
  ACCEPTABLE_PARAMS = [
    {name: :long_description, type: :string, required: false},
    {name: :name, type: :string, required: false},
    {name: :phonology, type: :string, required: false},
    # {name: :representation_id, type: :string, required: false},
    {name: :roman, type: :string, required: false},
    {name: :short_description, type: :string, required: false}
  ].freeze

  MUTABLE_PARAMS = [
    :long_description,
    :name,
    :phonology,
    # :representation_id,
    :roman,
    :short_description
  ].freeze

  path '/api/v1/runes' do
    post 'Creates a rune' do
      tags 'Runes'
      consumes 'application/json'
      parameter name: :rune, in: :body, required: true, schema: {
        type: :object,
        properties: {
          data: {
            schema: {
              type: :object,
              properties: {
                attributes: {
                  schema: {
                    type: :object,
                    required: true,
                    properties: MUTABLE_PARAMS.each_with_object({}) do |param_name, h|
                        param_data = ACCEPTABLE_PARAMS.find do |acceptable_param|
                            acceptable_param[:name] == param_name
                          end
                        h[param_data[:name]] = { type: param_data[:type], required: param_data[:required] }
                      end
                  }
                }
              }
            }
          }
        }
      }

      response '201', 'rune created' do
        let(:rune) do
          MUTABLE_PARAMS.each_with_object({ data: { attributes: {} } }) do |param_name, h|
            h[:data][:attributes][param_name] = rand_of_type(
              ACCEPTABLE_PARAMS.find do |acceptable_param|
                acceptable_param[:name] == param_name
              end[:type]
            )
          end
        end
        include_context 'with integration test'
      end
    end

    get 'Retrieves runes' do
      tags 'Runes'
      produces 'application/json'
      ACCEPTABLE_PARAMS.each do |param|
        parameter name: param[:name], in: :query, type: param[:type], required: false
      end
      paginator

      response '200', 'runes are displaying' do
        let(:runes) do
          create_list(
            :rune,
            rand(32),
            ACCEPTABLE_PARAMS.each_with_object({}) do |param, h|
              h[param[:name]] = rand_of_type(param[:type])
            end
          )
        end
        include_context 'with integration test'
        include_context 'with pagination test'
      end
    end
  end
end
