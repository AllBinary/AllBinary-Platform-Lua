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

local AbFileUploadFactory = {}
package.loaded["org.allbinary.logic.communication.http.file.upload.AbFileUploadFactory"] = AbFileUploadFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local ArrayList = java_lazy("java.util.ArrayList")
-- local List = require("java.util.List")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local AbFileItemFactory = java_lazy("org.allbinary.logic.communication.http.AbFileItemFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local FileItemIterator = java_lazy("org.apache.commons.fileupload.FileItemIterator")
local FileItemStream = java_lazy("org.apache.commons.fileupload.FileItemStream")
local FileItemUtil = java_lazy("org.apache.commons.fileupload.FileItemUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbFileItem = java_lazy("org.allbinary.logic.communication.http.file.upload.AbFileItem")
local AbFileUpload = java_lazy("org.allbinary.logic.communication.http.file.upload.AbFileUpload")
local HttpFileUploadUtil = java_lazy("org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AbFileUploadFactory is declared before the requires
AbFileUploadFactory.__index = AbFileUploadFactory
AbFileUploadFactory.className = "AbFileUploadFactory"
AbFileUploadFactory.javaClassName = "org.allbinary.logic.communication.http.file.upload.AbFileUploadFactory"

function AbFileUploadFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AbFileUploadFactory.getInstance()
        return AbFileUploadFactory.instance_f
end


function AbFileUploadFactory._jinit(self)
    AbFileUploadFactory._init_fields(self)
    return self
end

function AbFileUploadFactory.new(...)
    local self = setmetatable({}, AbFileUploadFactory)
    AbFileUploadFactory._jinit(self, ...)
    return self
end


-- throws Exception
function AbFileUploadFactory:getFileItemStreamList(httpServletRequest)
        local try_ok, try_error, try_value = pcall(function()
            local fileUpload = AbFileUpload.new(AbFileItemFactory.new())
            local iterator = fileUpload:getItemIterator(httpServletRequest)
            local items = ArrayList.new()
            while iterator:hasNext() do
                local fileItemStream = iterator:next()
                HttpFileUploadUtil.log(fileItemStream)
                local fileItem = AbFileItem.new(fileItemStream:getName(), fileItemStream:getFieldName(), FileItemUtil.getInstance():getBytes(fileItemStream))
                items:add(fileItem)
            end
            do return "__jreturn", items end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "get()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function AbFileUploadFactory:getFileItemList(httpServletRequest)
        local try_ok, try_error, try_value = pcall(function()
            local abFileUpload = AbFileUpload.new(AbFileItemFactory.new())
            do return "__jreturn", abFileUpload:parseRequest(httpServletRequest) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, "get()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AbFileUploadFactory.instance_f = AbFileUploadFactory.new()

return AbFileUploadFactory

