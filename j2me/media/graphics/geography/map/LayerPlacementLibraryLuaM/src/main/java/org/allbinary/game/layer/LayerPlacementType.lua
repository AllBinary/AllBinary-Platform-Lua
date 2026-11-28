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
-- package org.allbinary.game.layer

local LayerPlacementType = {}
package.loaded["org.allbinary.game.layer.LayerPlacementType"] = LayerPlacementType

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

-- class table LayerPlacementType is declared before the requires
LayerPlacementType.__index = LayerPlacementType
LayerPlacementType.className = "LayerPlacementType"
LayerPlacementType.javaClassName = "org.allbinary.game.layer.LayerPlacementType"

function LayerPlacementType:_init_fields()
    if self.type == nil then self.type = 0 end
end


function LayerPlacementType._jinit(self, type)
    LayerPlacementType._init_fields(self)
        self.type = type
    return self
end

function LayerPlacementType.new(...)
    local self = setmetatable({}, LayerPlacementType)
    LayerPlacementType._jinit(self, ...)
    return self
end


function LayerPlacementType:getType()
        return self.type
end


function LayerPlacementType:setType(type)
        self.type = type
end

return LayerPlacementType

