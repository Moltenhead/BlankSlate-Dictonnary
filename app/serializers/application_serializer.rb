class ApplicationSerializer < JSONAPI::Serializable::Resource
  self.abstract_class = true

  attibutes [
    :id,
    :created_at,
    :updated_at
  ]

  def id
    @object.id.to_s
  end
end
