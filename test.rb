bus1 = {"ADHERENCE"=> "0","BLOCKID"=>"60","BLOCK_ABBR"=>"116-5","DIRECTION"=>"Westbound","LATITUDE"=>"33.7167849","LONGITUDE"=>"-84.1373047","MSGTIME"=>"6\/5\/2015 5=>02=>41 PM","ROUTE"=>"116","STOPID"=>"134088","TIMEPOINT"=>"Mall Pkwy @ Stonecrest Mall","TRIPID"=>"4614106","VEHICLE"=>"2445"}

bus2 = {"ADHERENCE"=>"0","BLOCKID"=>"324","BLOCK_ABBR"=>"26-4","DIRECTION"=>"Westbound","LATITUDE"=>"33.7860784","LONGITUDE"=>"-84.433074","MSGTIME"=>"6\/5\/2015 5=>09=>29 PM","ROUTE"=>"26","STOPID"=>"904519","TIMEPOINT"=>"Bankhead Station","TRIPID"=>"4614069","VEHICLE"=>"2541"}

bus3 = {"ADHERENCE"=>"-15","BLOCKID"=>"363","BLOCK_ABBR"=>"36-3","DIRECTION"=>"Westbound","LATITUDE"=>"33.7935967","LONGITUDE"=>"-84.2651289","MSGTIME"=>"6\/5\/2015 5=>20=>12 PM","ROUTE"=>"36","STOPID"=>"901620","TIMEPOINT"=>"Briarcliff & N. Decatur","TRIPID"=>"4634510","VEHICLE"=>"2343"}

buses = [bus1, bus2, bus3]

nearby_buses = []

nearby_buses.push(bus1)

nearby_buses.push(bus2)

puts nearby_buses[0]["ROUTE"]
