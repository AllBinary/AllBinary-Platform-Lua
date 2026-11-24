-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

local CustomDisplayable = {}
package.loaded["org.allbinary.graphics.form.CustomDisplayable"] = CustomDisplayable

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

-- class table CustomDisplayable is declared before the requires
CustomDisplayable.__index = CustomDisplayable
CustomDisplayable.className = "CustomDisplayable"
CustomDisplayable.javaClassName = "org.allbinary.graphics.form.CustomDisplayable"

function CustomDisplayable._jinit(self)
    return self
end

function CustomDisplayable.new()
    return CustomDisplayable._jinit(setmetatable({}, CustomDisplayable))
end


function CustomDisplayable:setTitle(title)
end

return CustomDisplayable

