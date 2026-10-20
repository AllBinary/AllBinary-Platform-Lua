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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbContext = require("org.allbinary.business.context.AbContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = require("org.allbinary.logic.communication.sql.AbSqlData")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")
local TransformInfo = require("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoHttp = {}
TransformInfoHttp.__index = TransformInfoHttp
TransformInfoHttp.className = "TransformInfoHttp"
setmetatable(TransformInfoHttp, {__index = TransformInfo})

function TransformInfoHttp:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abContext = nil
end

function TransformInfoHttp.new(...)
    local count = select("#", ...)
    if count == 3 then return TransformInfoHttp._new3(...)
    elseif count == 3 then return TransformInfoHttp._new3(...)
    elseif count == 3 then return TransformInfoHttp._new3(...)
    elseif count == 2 then return TransformInfoHttp._new2(...)
    elseif count == 1 then return TransformInfoHttp._new1(...)
    end
end


function TransformInfoHttp._new3(propertiesHashMap, pageContext, crud)
    local self = setmetatable(TransformInfo.new(), TransformInfoHttp)
    self:_init_fields()
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HashMap, PageContext, boolean)")
        end
        self:override(propertiesHashMap)
    return self
end


function TransformInfoHttp._new3(request, propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfo.new(), TransformInfoHttp)
    self:_init_fields()
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HttpServletRequest, HashMap, PageContext)")
        end
        self:set(RequestParams.new(request):toHashMap())
        self:override(propertiesHashMap)
    return self
end


function TransformInfoHttp._new3(databaseHashMap, propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfo.new(), TransformInfoHttp)
    self:_init_fields()
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HashMap, HashMap, PageContext)")
        end
        self:set(databaseHashMap)
    return self
end


function TransformInfoHttp._new2(propertiesHashMap, pageContext)
    local self = setmetatable(TransformInfo.new(), TransformInfoHttp)
    self:_init_fields()
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HashMap, PageContext)")
        end
        self:set(propertiesHashMap)
    return self
end


function TransformInfoHttp._new1(parentViewOfThisTransformInfoInterface)
    local self = setmetatable(TransformInfo.new(), TransformInfoHttp)
    self:_init_fields()
        -- super(...) made self above
        self.abContext = AbContext.new(parentViewOfThisTransformInfoInterface:getPropertiesHashMap(), parentViewOfThisTransformInfoInterface:getPageContext())
    return self
end


-- throws Exception
function TransformInfoHttp:set(hashMap)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(hashMap), self, "set()")
        end
        local transformInfoData = TransformInfoData.getInstance()
        self:setName(hashMap:get(transformInfoData.NAME))
        self:setStoreName(hashMap:get(StoreFrontData.getInstance().NAME))
        self:setObjectFile(hashMap:get(transformInfoData.OBJECTFILENAME))
        self:setObject(hashMap:get(transformInfoData.OBJECT))
        local stringValidationUtil = StringValidationUtil.getInstance()
        local objectConfigString = hashMap:get(transformInfoData.OBJECTCONFIG)
        if stringValidationUtil:isValidRequired(objectConfigString, 10, AbSqlData.MAXBLOB) then
            self:setObjectConfig(objectConfigString)
        else
            self:setObjectConfig(tostring(TransformInfoObjectConfig.new(self)))
        end
        if not stringValidationUtil:isEmpty(hashMap:get(transformInfoData.OBJECTCONFIGFILENAME)) then
            self:setObjectConfigFile(hashMap:get(transformInfoData.OBJECTCONFIGFILENAME))
        end
        self:setTemplateFile(hashMap:get(transformInfoData.TEMPLATEFILENAME))
        self:setTemplate(hashMap:get(transformInfoData.TEMPLATE))
        self:setDataFile(hashMap:get(transformInfoData.DATAFILENAME))
        self:setData(hashMap:get(transformInfoData.DATA))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
            self.logUtil:putF(self:log(), self, "set()")
        end
end


function TransformInfoHttp:getWeblisketSession()
        return self.abContext:getWeblisketSession()
end


function TransformInfoHttp:getPageContext()
        return self.abContext:getPageContext()
end


function TransformInfoHttp:getPropertiesHashMap()
        return self.abContext:getPropertiesHashMap()
end


-- throws Exception
function TransformInfoHttp:getTemplateFilePath()
        return AbPath.new(self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH, self:getTemplateFile())
end


-- throws Exception
function TransformInfoHttp:getObjectConfigFilePath()
        return AbPath.new(self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH, self:getObjectConfigFile())
end


-- throws Exception
function TransformInfoHttp:getDataFilePath()
        return AbPath.new(self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH, self:getDataFile())
end

return TransformInfoHttp

