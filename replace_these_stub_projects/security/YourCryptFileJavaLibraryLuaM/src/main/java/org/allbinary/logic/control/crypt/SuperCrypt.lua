-- Generated Code Do Not Modify
-- package org.allbinary.logic.control.crypt

local SuperCrypt = {}
package.loaded["org.allbinary.logic.control.crypt.SuperCrypt"] = SuperCrypt

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

-- class table SuperCrypt is declared before the requires
SuperCrypt.__index = SuperCrypt
SuperCrypt.className = "SuperCrypt"
SuperCrypt.javaClassName = "org.allbinary.logic.control.crypt.SuperCrypt"


function SuperCrypt._jinit(self, key)
    return self
end

function SuperCrypt.new(...)
    local self = setmetatable({}, SuperCrypt)
    SuperCrypt._jinit(self, ...)
    return self
end


function SuperCrypt:encrypt(value)
        return nil
end


function SuperCrypt:decrypt(value)
        return nil
end

SuperCrypt.KEYMAX = 0

return SuperCrypt

