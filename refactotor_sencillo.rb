def longname
  name = fullname
  return unless organization_id
  organization = Organization.lookup(id: organization_id)
  return unless organization
  name += "(#{organization.name})"
end
