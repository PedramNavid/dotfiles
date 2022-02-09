local function calcAQI(Cp, lh, ll, BPh, BPI)
    local a = (lh - ll)
    local  b= (BPh - BPI)
    local c = (Cp - BPI)
    return math.floor((a/b) * c + ll)
end

