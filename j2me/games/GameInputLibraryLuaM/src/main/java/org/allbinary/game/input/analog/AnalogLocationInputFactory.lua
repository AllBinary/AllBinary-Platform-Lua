-- Generated Code Do Not Modify
-- package org.allbinary.game.input.analog

local AnalogLocationInputFactory = {}
package.loaded["org.allbinary.game.input.analog.AnalogLocationInputFactory"] = AnalogLocationInputFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AnalogLocationInput = java_lazy("org.allbinary.game.input.analog.AnalogLocationInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AnalogLocationInputFactory is declared before the requires
AnalogLocationInputFactory.__index = AnalogLocationInputFactory
AnalogLocationInputFactory.className = "AnalogLocationInputFactory"
AnalogLocationInputFactory.javaClassName = "org.allbinary.game.input.analog.AnalogLocationInputFactory"

function AnalogLocationInputFactory:_init_fields()
    self.list = BasicArrayListD.new()
end


function AnalogLocationInputFactory.getInstance()
        return AnalogLocationInputFactory.instance_f
end


function AnalogLocationInputFactory._jinit(self)
    AnalogLocationInputFactory._init_fields(self)
    return self
end

function AnalogLocationInputFactory.new(...)
    local self = setmetatable({}, AnalogLocationInputFactory)
    AnalogLocationInputFactory._jinit(self, ...)
    return self
end


function AnalogLocationInputFactory:addPlayer(playerInputId)
        local analogLocationInput = AnalogLocationInput.NULL_ANALOG_LOCATION_INPUT
        if playerInputId < self.list:size() then
            analogLocationInput = self.list:get(playerInputId)
        end
        if analogLocationInput == AnalogLocationInput.NULL_ANALOG_LOCATION_INPUT then
            analogLocationInput = AnalogLocationInput.new(playerInputId)
            self.list:add(analogLocationInput)
        end
end


function AnalogLocationInputFactory:getInstanceForPlayer(playerInputId)
        return self.list:get(playerInputId)
end


function AnalogLocationInputFactory:getList()
        return self.list
end

AnalogLocationInputFactory.instance_f = AnalogLocationInputFactory.new()

return AnalogLocationInputFactory

