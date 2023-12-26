local aqi = {}

local function calc_aqi(Cp, lh, ll, BPh, BPI)
	local a = (lh - ll)
	local b = (BPh - BPI)
	local c = (Cp - BPI)
	return math.ceil((a / b) * c + ll)
end

aqi.aqi_from_pm = function(pm)
	if pm < 0 or pm > 1000 then return '-' end

	if pm == nil then return '-' end

	if pm > 350.5 then
		return calc_aqi(pm, 500, 401, 500, 350.5)
	elseif pm > 250.5 then
		return calc_aqi(pm, 400, 301, 350.4, 250.5)
	elseif pm > 150.5 then
		return calc_aqi(pm, 300, 201, 250.4, 150.5)
	elseif pm > 55.5 then
		return calc_aqi(pm, 200, 151, 150.4, 55.5)
	elseif pm > 35.5 then
		return calc_aqi(pm, 150, 101, 55.4, 35.5)
	elseif pm > 12.1 then
		return calc_aqi(pm, 100, 51, 35.4, 12.1)
	elseif pm >= 0 then
		return calc_aqi(pm, 50, 0, 12, 0)
	else
		return nil
	end
end

aqi.get_aqi_description = function(aq)
	if aq >= 401 then
		return 'Hazardous'
	elseif aq >= 301 then
		return 'Hazardous'
	elseif aq >= 201 then
		return 'Very Unhealthy'
	elseif aq >= 151 then
		return 'Unhealthy'
	elseif aq >= 101 then
		return 'Unhealthy for Sensitive Groups'
	elseif aq >= 51 then
		return 'Moderate'
	elseif aq >= 0 then
		return 'Good'
	end

	return nil
end

return aqi
