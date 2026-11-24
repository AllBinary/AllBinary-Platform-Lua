--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.logic.math.vector

local Vertex = {}
package.loaded["org.allbinary.logic.math.vector.Vertex"] = Vertex

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

local BasicDecimal = java_lazy("org.allbinary.logic.math.BasicDecimal")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table Vertex is declared before the requires
Vertex.__index = Vertex
Vertex.className = "Vertex"
Vertex.javaClassName = "org.allbinary.logic.math.vector.Vertex"

function Vertex:_init_fields()
    self.x = BasicDecimal.new(0)
    self.y = BasicDecimal.new(0)
    self.z = BasicDecimal.new(0)
end


function Vertex._jinit(self)
    Vertex._init_fields(self)
    return self
end

function Vertex.new(...)
    local self = setmetatable({}, Vertex)
    Vertex._jinit(self, ...)
    return self
end


function Vertex:toString()
        local stringBuffer = StringMaker.new()
        local positionStrings = PositionStrings.getInstance()
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:append(tostring(self.x))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:append(tostring(self.y))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:append(tostring(self.z))
        return tostring(stringBuffer)
end
Vertex.__tostring = function(self) return self:toString() end

return Vertex

