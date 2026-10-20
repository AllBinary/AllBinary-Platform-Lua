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

-- local ArrayList = require("java.util.ArrayList")
-- local List = require("java.util.List")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local AbFileItemFactory = require("org.allbinary.logic.communication.http.AbFileItemFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local FileItemIterator = require("org.apache.commons.fileupload.FileItemIterator")
local FileItemStream = require("org.apache.commons.fileupload.FileItemStream")
local FileItemUtil = require("org.apache.commons.fileupload.FileItemUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbFileUploadFactory = {}
AbFileUploadFactory.__index = AbFileUploadFactory
AbFileUploadFactory.className = "AbFileUploadFactory"

function AbFileUploadFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AbFileUploadFactory.getInstance()
        return AbFileUploadFactory.instance
end


function AbFileUploadFactory.new()
    local self = setmetatable({}, AbFileUploadFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function AbFileUploadFactory:getFileItemStreamList(httpServletRequest)
        local try_ok, try_error = pcall(function()
            local fileUpload = AbFileUpload.new(AbFileItemFactory.new())
            local iterator = fileUpload:getItemIterator(httpServletRequest)
            local items = ArrayList.new()
            while iterator:hasNext() do
                local fileItemStream = iterator:next()
                HttpFileUploadUtil.log(fileItemStream)
                local fileItem = AbFileItem.new(fileItemStream:getName(), fileItemStream:getFieldName(), FileItemUtil.getInstance():getBytes(fileItemStream))
                items:add(fileItem)
            end
            return items
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "get()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function AbFileUploadFactory:getFileItemList(httpServletRequest)
        local try_ok, try_error = pcall(function()
            local abFileUpload = AbFileUpload.new(AbFileItemFactory.new())
            return abFileUpload:parseRequest(httpServletRequest)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, "get()", e)
            end
            error(e, 0)
        end
end

AbFileUploadFactory.instance = AbFileUploadFactory.new()

return AbFileUploadFactory

