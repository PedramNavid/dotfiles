local utils = {}

function utils.convert(value, from_unit, to_unit)
  local conversionTable = {
    MiB = {
      GiB = value / 1024,
    },
    GiB = {
      MiB = value * 1024,
    },
  }

  return conversionTable[from_unit][to_unit]
end

return utils
