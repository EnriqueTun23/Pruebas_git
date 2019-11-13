DATA = {
  enterprise: 'Homie',
  years: 4,
}
def update_info(data, key, value)
  return data.merge!({key => value}) if !data.has_key?(key)
  data[key ] = value
  
  data
end

update_info(DATA, :years, 5)