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
-- package org.allbinary.logic.visual.transform.info

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoHttp = require("org.allbinary.logic.visual.transform.info.TransformInfoHttp")
local TransformInfoHttpStoreInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoHttpStore = {}
TransformInfoHttpStore.__index = TransformInfoHttpStore
TransformInfoHttpStore.className = "TransformInfoHttpStore"
setmetatable(TransformInfoHttpStore, {__index = TransformInfoHttp})

function TransformInfoHttpStore:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformInfoHttpStore.new(...)
    local count = select("#", ...)
    if count == 2 then return TransformInfoHttpStore._new2(...)
    elseif count == 3 then return TransformInfoHttpStore._new3(...)
    elseif count == 3 then return TransformInfoHttpStore._new3(...)
    end
end


function TransformInfoHttpStore._new2(propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfoHttp.new(propertiesHashMap, pageContext, true), TransformInfoHttpStore)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function TransformInfoHttpStore._new3(databaseHashMap, propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfoHttp.new(databaseHashMap, propertiesHashMap, pageContext), TransformInfoHttpStore)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Database HashMap: ")
            stringBuffer:append(tostring(databaseHashMap))
            stringBuffer:append("\nProperties HashMap: ")
            stringBuffer:append(tostring(propertiesHashMap))
            self.logUtil:putF(tostring(stringBuffer), self, "Constructor(HashMap, HashMap , PageContext)")
        end
        self:setStoreName(databaseHashMap:get(StoreFrontData.getInstance().NAME))
    return self
end


function TransformInfoHttpStore._new3(storeFrontInterface, propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfoHttp.new(propertiesHashMap, pageContext), TransformInfoHttpStore)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setStoreName(storeFrontInterface:getName())
    return self
end


-- throws Exception
function TransformInfoHttpStore:getPath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(self:getStoreName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        return tostring(stringBuffer)
end


-- throws Exception
function TransformInfoHttpStore:getTemplateFilePath()
        return AbPath.new(self:getPath(), self:getTemplateFile())
end


-- throws Exception
function TransformInfoHttpStore:getObjectConfigFilePath()
        return AbPath.new(self:getPath(), self:getObjectConfigFile())
end


-- throws Exception
function TransformInfoHttpStore:getDataFilePath()
        return AbPath.new(self:getPath(), self:getDataFile())
end

return TransformInfoHttpStore

