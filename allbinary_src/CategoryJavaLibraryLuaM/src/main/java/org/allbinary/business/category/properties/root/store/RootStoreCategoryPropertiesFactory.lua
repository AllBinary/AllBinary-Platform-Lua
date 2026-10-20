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
-- package org.allbinary.business.category.properties.root.store

-- local HashMap = require("java.util.HashMap")
local CategoryPropertiesFactoryInterface = require("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local CategoryPropertiesInterface = require("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RootStoreCategoryPropertiesFactory = {}
RootStoreCategoryPropertiesFactory.__index = RootStoreCategoryPropertiesFactory
RootStoreCategoryPropertiesFactory.className = "RootStoreCategoryPropertiesFactory"

function RootStoreCategoryPropertiesFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.categoryPropertiesInterface = nil
end

function RootStoreCategoryPropertiesFactory.new(...)
    local count = select("#", ...)
    if count == 1 then return RootStoreCategoryPropertiesFactory._new1(...)
    elseif count == 2 then return RootStoreCategoryPropertiesFactory._new2(...)
    elseif count == 2 then return RootStoreCategoryPropertiesFactory._new2(...)
    elseif count == 2 then return RootStoreCategoryPropertiesFactory._new2(...)
    end
end


function RootStoreCategoryPropertiesFactory._new1(transformInfoInterface)
    local self = setmetatable({}, RootStoreCategoryPropertiesFactory)
    self:_init_fields()
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface)
    return self
end


function RootStoreCategoryPropertiesFactory._new2(transformInfoInterface, abPath)
    local self = setmetatable({}, RootStoreCategoryPropertiesFactory)
    self:_init_fields()
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface, abPath)
    return self
end


function RootStoreCategoryPropertiesFactory._new2(transformInfoInterface, node)
    local self = setmetatable({}, RootStoreCategoryPropertiesFactory)
    self:_init_fields()
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface, node)
    return self
end


function RootStoreCategoryPropertiesFactory._new2(transformInfoInterface, categoryPropertiesHashMap)
    local self = setmetatable({}, RootStoreCategoryPropertiesFactory)
    self:_init_fields()
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface, categoryPropertiesHashMap)
    return self
end


function RootStoreCategoryPropertiesFactory:getInstance()
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

return RootStoreCategoryPropertiesFactory

