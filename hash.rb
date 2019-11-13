DATA = {
  enterprise: 'Homie',
  years: 4
}

def update_info(data, key, value)
    
    if data.has_key?(key)
        data[key] = value
    else  
        data.merge!({key => value})
    end
    
    data
end


update_info(DATA, :years, 5)