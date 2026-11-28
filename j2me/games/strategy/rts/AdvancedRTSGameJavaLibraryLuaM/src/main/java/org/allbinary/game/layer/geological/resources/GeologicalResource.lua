-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.geological.resources

local GeologicalResource = {}
package.loaded["org.allbinary.game.layer.geological.resources.GeologicalResource"] = GeologicalResource

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

-- class table GeologicalResource is declared before the requires
GeologicalResource.__index = GeologicalResource
GeologicalResource.className = "GeologicalResource"
GeologicalResource.javaClassName = "org.allbinary.game.layer.geological.resources.GeologicalResource"

function GeologicalResource:_init_fields()
    if self.total == nil then self.total = 0 end
    if self.initTotal == nil then self.initTotal = 0 end
end


function GeologicalResource._jinit(self, initTotal)
    GeologicalResource._init_fields(self)
        self.initTotal = initTotal
        self:init()
    return self
end

function GeologicalResource.new(...)
    local self = setmetatable({}, GeologicalResource)
    GeologicalResource._jinit(self, ...)
    return self
end


function GeologicalResource:init()
        self:setTotal(self.initTotal)
end


function GeologicalResource:add(value)
        local max = require("java.lang.Integer").MAX_VALUE
        if self:getTotal() + value > max then
            self:setTotal(max)
        else
            self:setTotal(self:getTotal() + value)
        end
end


function GeologicalResource:remove(value)
        if self:getTotal() - value < 0 then
            self:setTotal(0)
        else
            self:setTotal(self:getTotal() - value)
        end
end


function GeologicalResource:getTotal()
        return self.total
end


function GeologicalResource:setTotal(total)
        self.total = total
end

return GeologicalResource

