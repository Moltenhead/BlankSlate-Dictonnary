require 'rails_helper'
 
shared_context 'with integration test' do
  run_test!
  after do |example|
    example.metadata[:response][:examples] =
      { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
  end
end

shared_context 'with pagination test' do
  run_test!
  after do |example|
    page ||= {}
    page_size = page&.fetch('size', 15)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json.length).to be page_size
  end
end
