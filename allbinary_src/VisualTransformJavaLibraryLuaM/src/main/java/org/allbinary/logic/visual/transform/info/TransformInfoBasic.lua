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
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbContext = require("org.allbinary.business.context.AbContext")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local Document = require("org.w3c.dom.Document")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

--Hack class should not exist
local TransformInfoBasic = {}
TransformInfoBasic.__index = TransformInfoBasic
TransformInfoBasic.className = "TransformInfoBasic"
setmetatable(TransformInfoBasic, {__index = AbContext})

function TransformInfoBasic:_init_fields()
    self.storeFrontInterface = nil
end


function TransformInfoBasic.new(storeFrontInterface, propertiesHashMap, pageContext)
    local self = setmetatable(AbContext.new(propertiesHashMap, pageContext), TransformInfoBasic)
    self:_init_fields()
        -- super(...) made self above
        self.storeFrontInterface = storeFrontInterface
    return self
end


function TransformInfoBasic:getStoreName()
        return self.storeFrontInterface:getName()
end


function TransformInfoBasic:log()
        return self.commonStrings.NOT_IMPLEMENTED
end


function TransformInfoBasic:override(hashMap)
end


function TransformInfoBasic:getName()
        return nil
end


function TransformInfoBasic:getObjectFile()
        return nil
end


function TransformInfoBasic:getObject()
        return nil
end


function TransformInfoBasic:getObjectConfigInterface()
        return nil
end


function TransformInfoBasic:setObjectConfigInterface(transformInfoObjectConfigInterface)
end


function TransformInfoBasic:getTemplateFilePath()
        return nil
end


function TransformInfoBasic:getTemplateFile()
        return nil
end


function TransformInfoBasic:getTemplate()
        return nil
end


function TransformInfoBasic:getDataFilePath()
        return nil
end


function TransformInfoBasic:getDataFile()
        return nil
end


-- throws Exception
function TransformInfoBasic:getDataDocument()
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function TransformInfoBasic:setName(value)
end


function TransformInfoBasic:setStoreName(value)
end


function TransformInfoBasic:setObjectFile(value)
end


function TransformInfoBasic:setObject(anyType)
end


function TransformInfoBasic:setObjectConfigFile(value)
end


function TransformInfoBasic:setTemplateFile(value)
end


function TransformInfoBasic:setTemplate(value)
end


function TransformInfoBasic:setDataFile(value)
end


function TransformInfoBasic:setData(value)
end


function TransformInfoBasic:setChild()
end


function TransformInfoBasic:isChild()
        return true
end


function TransformInfoBasic:getImportUriPath()
        return nil
end


function TransformInfoBasic:setImportUriPath(importUriPath)
end


-- throws Exception
function TransformInfoBasic:getKey()
        return nil
end


-- throws Exception
function TransformInfoBasic:toVector()
        return nil
end


-- throws Exception
function TransformInfoBasic:toHashMap()
        return nil
end

return TransformInfoBasic

