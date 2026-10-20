-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScreenInfo = {}
ScreenInfo.__index = ScreenInfo
ScreenInfo.className = "ScreenInfo"

function ScreenInfo:_init_fields()
    self.SMALL_WIDTH = 320
    self.SMALL_HEIGHT = 240
    self.MEDIUM_WIDTH = 800
    self.MEDIUM_HEIGHT = 600
end

function ScreenInfo.new()
    local self = setmetatable({}, ScreenInfo)
    self:_init_fields()
    return self
end


function ScreenInfo.getInstance()
        return ScreenInfo.instance
end

ScreenInfo.instance = ScreenInfo.new()

return ScreenInfo

