
def longname
  name = fullname
  return name unless organization_id
  return name unless Organization.lookup(id: organization_id)
  name += "(#{organization.name})"
end