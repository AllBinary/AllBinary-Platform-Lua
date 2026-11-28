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
-- package org.allbinary.game.rts.technology

local RepairTechnology = {}
package.loaded["org.allbinary.game.rts.technology.RepairTechnology"] = RepairTechnology

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

local RTSInterface = java_lazy("org.allbinary.game.layer.RTSInterface")
local UnitTechnologySingletonFactory = java_lazy("org.allbinary.game.rts.technology.UnitTechnologySingletonFactory")

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

-- class table RepairTechnology is declared before the requires
RepairTechnology.__index = RepairTechnology
RepairTechnology.className = "RepairTechnology"
RepairTechnology.javaClassName = "org.allbinary.game.rts.technology.RepairTechnology"
RepairTechnology.java_implements = " RTSInterface "
RepairTechnology.java_interfaces = function() return {RTSInterface} end

function RepairTechnology:_init_fields()
    if self.level == nil then self.level = 0 end
    if self.maxLevel == nil then self.maxLevel = 0 end
end


function RepairTechnology._jinit(self, maxLevel)
    RepairTechnology._init_fields(self)
        self.maxLevel = maxLevel
    return self
end

function RepairTechnology.new(...)
    local self = setmetatable({}, RepairTechnology)
    RepairTechnology._jinit(self, ...)
    return self
end


function RepairTechnology:isCompleted()
        return false
end


function RepairTechnology:getPercentComplete()
        return 0
end


function RepairTechnology:getLevel()
        return self.level
end


function RepairTechnology:getMaxLevel()
        return self.maxLevel
end


function RepairTechnology:getCost()
        return 0
end


function RepairTechnology:downgrade()
end


function RepairTechnology:getDowngradeCost()
        return 0
end


function RepairTechnology:isDowngradeable()
        return false
end


function RepairTechnology:getUpgradeCost()
        return (self:getLevel() * self:getLevel()) * 1000
end


function RepairTechnology:isUpgradeable()
        if self:getLevel() < self:getMaxLevel() then
            return true
        else
            return false
        end
end


function RepairTechnology:upgrade()
        self.level = self.level + 1
        local unitTechnologySingletonFactory = UnitTechnologySingletonFactory.getInstance()
        unitTechnologySingletonFactory:setRepair(unitTechnologySingletonFactory:getRepair() + (self:getLevel() * 10))
end


function RepairTechnology:isSelfUpgradeable()
        return false
end

return RepairTechnology

