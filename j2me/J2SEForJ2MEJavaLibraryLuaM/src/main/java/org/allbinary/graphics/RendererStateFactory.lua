-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.graphics

local RendererStateFactory = {}
package.loaded["org.allbinary.graphics.RendererStateFactory"] = RendererStateFactory

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

-- class table RendererStateFactory is declared before the requires
RendererStateFactory.__index = RendererStateFactory
RendererStateFactory.className = "RendererStateFactory"
RendererStateFactory.javaClassName = "org.allbinary.graphics.RendererStateFactory"

function RendererStateFactory:_init_fields()
    self.loaded = false
    self.surfaceChanged = false
end

function RendererStateFactory._jinit(self)
    RendererStateFactory._init_fields(self)
    return self
end

function RendererStateFactory.new()
    return RendererStateFactory._jinit(setmetatable({}, RendererStateFactory))
end


function RendererStateFactory.getInstance()
        return RendererStateFactory.instance_f
end


function RendererStateFactory:setLoaded(loaded)
        self.loaded = loaded
end


function RendererStateFactory:isLoaded()
        return self.loaded
end


function RendererStateFactory:setSurfaceChanged(initialized)
        self.surfaceChanged = initialized
end


function RendererStateFactory:isSurfaceChanged()
        return self.surfaceChanged
end

RendererStateFactory.instance_f = RendererStateFactory.new()

return RendererStateFactory

