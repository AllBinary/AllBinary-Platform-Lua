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
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoHttp = require("org.allbinary.logic.visual.transform.info.TransformInfoHttp")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoHttpContext = {}
TransformInfoHttpContext.__index = TransformInfoHttpContext
TransformInfoHttpContext.className = "TransformInfoHttpContext"
setmetatable(TransformInfoHttpContext, {__index = TransformInfoHttp})

function TransformInfoHttpContext:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformInfoHttpContext.new(...)
    local count = select("#", ...)
    if count == 3 then return TransformInfoHttpContext._new3(...)
    elseif count == 2 then return TransformInfoHttpContext._new2(...)
    end
end


function TransformInfoHttpContext._new3(databaseHashMap, propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfoHttp.new(databaseHashMap, propertiesHashMap, pageContext), TransformInfoHttpContext)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Database HashMap: ")
            stringBuffer:append(tostring(databaseHashMap))
            stringBuffer:append("\nProperties HashMap: ")
            stringBuffer:append(tostring(propertiesHashMap))
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setStoreName(StringUtil.getInstance().EMPTY_STRING)
    return self
end


function TransformInfoHttpContext._new2(propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfoHttp.new(propertiesHashMap, pageContext), TransformInfoHttpContext)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setStoreName(StringUtil.getInstance().EMPTY_STRING)
    return self
end


-- throws Exception
function TransformInfoHttpContext:getPath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().INSTALLPATH)
        stringBuffer:append(self:getStoreName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        return tostring(stringBuffer)
end


-- throws Exception
function TransformInfoHttpContext:getTemplateFilePath()
        return AbPath.new(self:getPath(), self:getTemplateFile())
end


-- throws Exception
function TransformInfoHttpContext:getObjectConfigFilePath()
        return AbPath.new(self:getPath(), self:getObjectConfigFile())
end


-- throws Exception
function TransformInfoHttpContext:getDataFilePath()
        return AbPath.new(self:getPath(), self:getDataFile())
end

return TransformInfoHttpContext

