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

-- local File = require("java.io.File")
-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
-- local UnsupportedEncodingException = require("java.io.UnsupportedEncodingException")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local FileItem = require("org.apache.commons.fileupload.FileItem")
local FileItemHeaders = require("org.apache.commons.fileupload.FileItemHeaders")
local FileItemUtil = require("org.apache.commons.fileupload.FileItemUtil")

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

local AbFileItem = {}
AbFileItem.__index = AbFileItem
AbFileItem.className = "AbFileItem"

function AbFileItem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.name = nil
    self.fieldName = nil
    self.byteArray = nil
end


function AbFileItem.new(name, fieldName, byteArray)
    local self = setmetatable({}, AbFileItem)
    self:_init_fields()
        self.name = name
        self.fieldName = fieldName
        self.byteArray = byteArray
    return self
end


-- throws IOException
function AbFileItem:getInputStream()
        error(java_exception("IOException", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AbFileItem:getContentType()
        return nil
end


function AbFileItem:getName()
        return self.name
end


function AbFileItem:isInMemory()
        return true
end


function AbFileItem:getSize()
        return (self.byteArray.n or #self.byteArray)
end


function AbFileItem:get()
        return self.byteArray
end


-- throws UnsupportedEncodingException
function AbFileItem:getString(encoding)
        return string.char(table.unpack(self.byteArray, encoding))
end


-- Java overloaded method: Lua keeps the last definition
function AbFileItem:getString()
        local try_ok, try_error = pcall(function()
            return FileItemUtil.getInstance():getString(self.byteArray)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getString", e)
            end
            return StringUtil.getInstance().EMPTY_STRING
        end
end


-- throws Exception
function AbFileItem:write(file)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbFileItem:write(file)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AbFileItem:delete()
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, "delete()")
end


function AbFileItem:getFieldName()
        return self.fieldName
end


function AbFileItem:setFieldName(name)
        self.fieldName = name
end


function AbFileItem:isFormField()
        if StringValidationUtil.getInstance():isEmpty(self.fieldName) then
            return false
        else
            return true
        end
end


function AbFileItem:setFormField(state)
end


-- throws IOException
function AbFileItem:getOutputStream()
        error(java_exception("IOException", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AbFileItem:getHeaders()
        error(java_exception("RuntimeException", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AbFileItem:setHeaders(fih)
        error(java_exception("RuntimeException", self.commonStrings.NOT_IMPLEMENTED), 0)
end

return AbFileItem

