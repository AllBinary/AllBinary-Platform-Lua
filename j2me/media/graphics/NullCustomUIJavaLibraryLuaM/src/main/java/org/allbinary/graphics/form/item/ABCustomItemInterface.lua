-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

local ABCustomItemInterface = {}
package.loaded["org.allbinary.graphics.form.item.ABCustomItemInterface"] = ABCustomItemInterface

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")

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

-- Java interface
-- class table ABCustomItemInterface is declared before the requires
ABCustomItemInterface.__index = ABCustomItemInterface
ABCustomItemInterface.className = "ABCustomItemInterface"
ABCustomItemInterface.javaClassName = "org.allbinary.graphics.form.item.ABCustomItemInterface"


function ABCustomItemInterface:getMinimumWidth()
    error("abstract method getMinimumWidth")
end


function ABCustomItemInterface:getMinimumHeight()
    error("abstract method getMinimumHeight")
end


function ABCustomItemInterface:getLabel()
    error("abstract method getLabel")
end


function ABCustomItemInterface:paintXY(graphics, x, y)
    error("abstract method paintXY")
end


function ABCustomItemInterface:paintUnselected(graphics, x, y)
    error("abstract method paintUnselected")
end

return ABCustomItemInterface

