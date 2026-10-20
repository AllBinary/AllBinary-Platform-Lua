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
-- package org.allbinary.business.category.properties

-- local HashMap = require("java.util.HashMap")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Node = require("org.w3c.dom.Node")
local CategoryPropertiesFactoryInterface = require("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CategoryPropertiesFactory = {}
CategoryPropertiesFactory.__index = CategoryPropertiesFactory
CategoryPropertiesFactory.className = "CategoryPropertiesFactory"

function CategoryPropertiesFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.categoryPropertiesInterface = nil
end

function CategoryPropertiesFactory.new(...)
    local count = select("#", ...)
    if count == 1 then return CategoryPropertiesFactory._new1(...)
    elseif count == 1 then return CategoryPropertiesFactory._new1(...)
    elseif count == 1 then return CategoryPropertiesFactory._new1(...)
    end
end


function CategoryPropertiesFactory._new1(name)
    local self = setmetatable({}, CategoryPropertiesFactory)
    self:_init_fields()
        self.categoryPropertiesInterface = CategoryProperties.new(name)
    return self
end


function CategoryPropertiesFactory._new1(node)
    local self = setmetatable({}, CategoryPropertiesFactory)
    self:_init_fields()
        self.categoryPropertiesInterface = CategoryProperties.new(node)
    return self
end


function CategoryPropertiesFactory._new1(categoryPropertiesHashMap)
    local self = setmetatable({}, CategoryPropertiesFactory)
    self:_init_fields()
        self.categoryPropertiesInterface = CategoryProperties.new(categoryPropertiesHashMap)
    return self
end


function CategoryPropertiesFactory:getInstance()
        local try_ok, try_error = pcall(function()
            return self.categoryPropertiesInterface
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end

return CategoryPropertiesFactory

