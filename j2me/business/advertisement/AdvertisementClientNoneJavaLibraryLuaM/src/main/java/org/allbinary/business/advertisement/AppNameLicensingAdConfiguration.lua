-- Generated Code Do Not Modify
-- package org.allbinary.business.advertisement

local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AdConfiguration = require("org.allbinary.business.advertisement.AdConfiguration")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AppNameLicensingAdConfiguration = {}
AppNameLicensingAdConfiguration.__index = AppNameLicensingAdConfiguration
AppNameLicensingAdConfiguration.className = "AppNameLicensingAdConfiguration"
setmetatable(AppNameLicensingAdConfiguration, {__index = AdConfiguration})


function AppNameLicensingAdConfiguration.new()
    local self = setmetatable(AdConfiguration.new({StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING}), AppNameLicensingAdConfiguration)
        -- super(...) made self above
    return self
end

return AppNameLicensingAdConfiguration

