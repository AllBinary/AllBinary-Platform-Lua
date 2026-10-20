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
-- package org.allbinary.business.context

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbContext = {}
AbContext.__index = AbContext
AbContext.className = "AbContext"

function AbContext:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.propertiesHashMap = nil
    self.pageContext = nil
end


function AbContext.new(propertiesHashMap, pageContext)
    local self = setmetatable({}, AbContext)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, self.commonStrings.CONSTRUCTOR)
        end
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
    return self
end


function AbContext:getWeblisketSession()
        return WeblisketSession.new(self.propertiesHashMap, self.pageContext)
end


function AbContext:getPageContext()
        return self.pageContext
end


function AbContext:getPropertiesHashMap()
        return self.propertiesHashMap
end

return AbContext

