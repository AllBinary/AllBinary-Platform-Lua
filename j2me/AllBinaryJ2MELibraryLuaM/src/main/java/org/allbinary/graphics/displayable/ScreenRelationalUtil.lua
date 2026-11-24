-- Generated Code Do Not Modify
-- package org.allbinary.graphics.displayable

local ScreenRelationalUtil = {}
package.loaded["org.allbinary.graphics.displayable.ScreenRelationalUtil"] = ScreenRelationalUtil

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

-- local Image = require("javax.microedition.lcdui.Image")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")

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

-- class table ScreenRelationalUtil is declared before the requires
ScreenRelationalUtil.__index = ScreenRelationalUtil
ScreenRelationalUtil.className = "ScreenRelationalUtil"
ScreenRelationalUtil.javaClassName = "org.allbinary.graphics.displayable.ScreenRelationalUtil"

function ScreenRelationalUtil._jinit(self)
    return self
end

function ScreenRelationalUtil.new()
    return ScreenRelationalUtil._jinit(setmetatable({}, ScreenRelationalUtil))
end


function ScreenRelationalUtil.getInstance()
        return ScreenRelationalUtil.instance_f
end


function ScreenRelationalUtil:getScaleImage(image)
        return self:getScaleWH(image:getWidth(), image:getHeight())
end


function ScreenRelationalUtil:getScaleWH(aWidth, aHeight)
        return self:getScaleWHA(aWidth, aHeight, 20)
end


function ScreenRelationalUtil:getScaleWHA(aWidth, aHeight, add)
        local displayInfoSingleton = DisplayInfoSingleton.getInstance()
        local last = displayInfoSingleton:getLast()
        local width = (last[displayInfoSingleton.WIDTH + 1] + 0.0)
        local height = (last[displayInfoSingleton.HEIGHT + 1] + 0.0)
        local largestSize = width
        if largestSize < height then
            largestSize = height
        end
        local scale = (largestSize) / (aWidth + 0.0)
        return scale
end


function ScreenRelationalUtil:getScaledHeight(aWidth, aHeight)
        return java_int((self:getScaleWH(aWidth, aHeight) * (aHeight + 0.0)))
end


function ScreenRelationalUtil:getScaledHeightAdd(aWidth, aHeight, add)
        return java_int((self:getScaleWHA(aWidth, aHeight, add) * (aHeight + 0.0)))
end

ScreenRelationalUtil.instance_f = ScreenRelationalUtil.new()

return ScreenRelationalUtil

