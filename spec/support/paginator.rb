def paginator
  parameter name: :page, in: :query, required: false, schema: {
    type: :object,
    properties: {
      number: { type: :integer },
      size: { type: :integer }
    }
  }
end
