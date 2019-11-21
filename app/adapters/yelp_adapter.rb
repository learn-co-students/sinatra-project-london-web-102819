def restaurant_search(location, cuisine)
    response = Yelp::Fusion.client.search(location, { term: cuisine})
    rest_arr = response.businesses

    result = []

    rest_arr.each do |r|
        result << [r.name, r.rating, r.location.address1]
    end

    result
end