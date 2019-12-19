require 'rails_helper'
 
shared_context 'with integration test' do
  run_test!
  after do |example|
    ap local_variables
    example.metadata[:response][:examples] =
      { 'application/json' => json }
  end
end

shared_context 'with pagination test' do
  run_test!
  after do |example|
    page ||= {}
    page_size = page&.fetch('size', 15)
    expect(json.length).to be page_size
  end
end
