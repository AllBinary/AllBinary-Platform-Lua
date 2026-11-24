-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.input.motion.button

local TouchButtonResource = {}
package.loaded["org.allbinary.input.motion.button.TouchButtonResource"] = TouchButtonResource

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

-- class table TouchButtonResource is declared before the requires
TouchButtonResource.__index = TouchButtonResource
TouchButtonResource.className = "TouchButtonResource"
TouchButtonResource.javaClassName = "org.allbinary.input.motion.button.TouchButtonResource"

function TouchButtonResource:_init_fields()
    if self.RESOURCE == nil then self.RESOURCE = nil end
    if self.HINT == nil then self.HINT = nil end
end


function TouchButtonResource._jinit(self, resource, hint)
    TouchButtonResource._init_fields(self)
        self.RESOURCE = resource
        self.HINT = hint
    return self
end

function TouchButtonResource.new(...)
    local self = setmetatable({}, TouchButtonResource)
    TouchButtonResource._jinit(self, ...)
    return self
end

return TouchButtonResource

