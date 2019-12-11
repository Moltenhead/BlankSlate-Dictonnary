class ApplicationSerializer < JSONAPI::Serializable::Resource
  attributes(
    :id,
    :created_at,
    :updated_at
  )

  def id
    @object.id.to_s
  end
end
