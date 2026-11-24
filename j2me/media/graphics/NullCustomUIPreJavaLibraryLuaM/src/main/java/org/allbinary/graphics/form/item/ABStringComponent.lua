-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

local ABStringComponent = {}
package.loaded["org.allbinary.graphics.form.item.ABStringComponent"] = ABStringComponent

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

local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")

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

-- class table ABStringComponent is declared before the requires
ABStringComponent.__index = ABStringComponent
ABStringComponent.className = "ABStringComponent"
ABStringComponent.javaClassName = "org.allbinary.graphics.form.item.ABStringComponent"


function ABStringComponent:getBackgroundBasicColor()
        return BasicColorFactory.getInstance().WHITE
end


function ABStringComponent._jinit(self, backgroundBasicColor, foregroundBasicColor)
    return self
end

function ABStringComponent.new(...)
    local self = setmetatable({}, ABStringComponent)
    ABStringComponent._jinit(self, ...)
    return self
end


function ABStringComponent:getForegroundBasicColor()
        return BasicColorFactory.getInstance().WHITE
end


function ABStringComponent:setForegroundBasicColor(foregroundBasicColor)
end

ABStringComponent.NULL_STRING_COMPONENT = ABStringComponent.new(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)

return ABStringComponent

