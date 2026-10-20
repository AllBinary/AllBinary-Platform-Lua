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
-- package org.allbinary.logic.communication.http.file.upload

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ClassUtil = require("org.allbinary.logic.java.anyType.clazz.ClassUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local FileItem = require("org.apache.commons.fileupload.FileItem")
local FileItemStream = require("org.apache.commons.fileupload.FileItemStream")

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

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local HttpFileUploadUtil = {}
HttpFileUploadUtil.__index = HttpFileUploadUtil
HttpFileUploadUtil.className = "HttpFileUploadUtil"

function HttpFileUploadUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function HttpFileUploadUtil.getInstance()
        return HttpFileUploadUtil.instance
end


function HttpFileUploadUtil.new()
    local self = setmetatable({}, HttpFileUploadUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function HttpFileUploadUtil:isValid(anyType)
        if anyType ~= nil and not (java_instanceof(anyType, String)) then
            if java_instanceof(anyType, FileItem) then
                return true
            else
                error(java_exception("Exception", "Object Not Instance Of FileItem but is: " .. tostring(ClassUtil.viewAll(anyType, CommonSeps.getInstance().NEW_LINE))), 0)
            end
        end
        return false
end


-- throws Exception
function HttpFileUploadUtil.log(fileItem)
        local logUtil = LogUtil.getInstance()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append("FileItem Log:")
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Content Type:")
        stringBuffer:append(fileItem:getContentType())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Field Name:")
        stringBuffer:append(fileItem:getFieldName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Name:")
        stringBuffer:append(fileItem:getName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Size:")
        stringBuffer:append(" Not Calculated Yet")
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTP) then
            logUtil:putF(tostring(stringBuffer), HttpFileUploadUtil.getInstance(), "log()")
        end
end


-- Java overloaded method: Lua keeps the last definition
function HttpFileUploadUtil.log(fileItem)
        local logUtil = LogUtil.getInstance()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append("FileItem Log:")
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Content Type:")
        stringBuffer:append(fileItem:getContentType())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Field Name:")
        stringBuffer:append(fileItem:getFieldName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Name:")
        stringBuffer:append(fileItem:getName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Size:")
        stringBuffer:appendlong(java_int(fileItem:getSize()))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            logUtil:putF(tostring(stringBuffer), HttpFileUploadUtil.getInstance(), "log()")
        end
end

HttpFileUploadUtil.instance = HttpFileUploadUtil.new()

return HttpFileUploadUtil

