-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.input.automation.actions.script

local JTreeInterfaceFactory = {}
package.loaded["org.allbinary.input.automation.actions.script.JTreeInterfaceFactory"] = JTreeInterfaceFactory

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

local JTreeInterface = java_lazy("org.allbinary.input.automation.actions.script.JTreeInterface")

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

-- class table JTreeInterfaceFactory is declared before the requires
JTreeInterfaceFactory.__index = JTreeInterfaceFactory
JTreeInterfaceFactory.className = "JTreeInterfaceFactory"
JTreeInterfaceFactory.javaClassName = "org.allbinary.input.automation.actions.script.JTreeInterfaceFactory"

function JTreeInterfaceFactory:_init_fields()
    if self.jTreeInterface == nil then self.jTreeInterface = nil end
end

function JTreeInterfaceFactory._jinit(self)
    JTreeInterfaceFactory._init_fields(self)
    return self
end

function JTreeInterfaceFactory.new()
    return JTreeInterfaceFactory._jinit(setmetatable({}, JTreeInterfaceFactory))
end


function JTreeInterfaceFactory.getInstance()
        return JTreeInterfaceFactory.instance_f
end


function JTreeInterfaceFactory:set(jTreeInterface)
        self.jTreeInterface = jTreeInterface
end


function JTreeInterfaceFactory:getJTreeInterface()
        return self.jTreeInterface
end

JTreeInterfaceFactory.instance_f = JTreeInterfaceFactory.new()

return JTreeInterfaceFactory

