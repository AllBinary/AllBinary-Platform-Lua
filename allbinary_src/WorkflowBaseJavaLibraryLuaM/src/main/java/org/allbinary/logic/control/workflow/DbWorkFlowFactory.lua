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
-- package org.allbinary.logic.control.workflow

-- local HashMap = require("java.util.HashMap")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DbWorkFlowFactory = {}
DbWorkFlowFactory.__index = DbWorkFlowFactory
DbWorkFlowFactory.className = "DbWorkFlowFactory"

function DbWorkFlowFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function DbWorkFlowFactory.getInstance()
        return DbWorkFlowFactory.instance
end


function DbWorkFlowFactory.new()
    local self = setmetatable({}, DbWorkFlowFactory)
    self:_init_fields()
    return self
end


-- throws Exception, LicensingException
-- Java overloaded method: Lua keeps the last definition
function DbWorkFlowFactory:getInstance(abeClientInformation, hashMap)
        local try_ok, try_error = pcall(function()
            local className = hashMap:get(DynamicObjectData.NAME)
            local params = java_new_array(nil, 1)
            local classes = java_new_array(nil, 1)
            classes[1] = getmetatable(hashMap)
            params[1] = hashMap
            local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, className, classes, params)
            return WorkFlowWrapper.new(anyType)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getInstance(HashMap)", e)
            end
            error(e, 0)
        end
end

DbWorkFlowFactory.instance = DbWorkFlowFactory.new()

return DbWorkFlowFactory

