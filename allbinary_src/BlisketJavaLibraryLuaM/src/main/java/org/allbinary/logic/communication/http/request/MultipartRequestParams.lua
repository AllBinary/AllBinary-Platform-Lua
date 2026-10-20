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
-- package org.allbinary.logic.communication.http.request

-- local HashMap = require("java.util.HashMap")
-- local List = require("java.util.List")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbFileUploadFactory = require("org.allbinary.logic.communication.http.file.upload.AbFileUploadFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local FileItem = require("org.apache.commons.fileupload.FileItem")
local InvalidContentTypeException = require("org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultipartRequestParams = {}
MultipartRequestParams.__index = MultipartRequestParams
MultipartRequestParams.className = "MultipartRequestParams"
setmetatable(MultipartRequestParams, {__index = RequestParams})

function MultipartRequestParams:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.special = false
end

function MultipartRequestParams.new(...)
    local count = select("#", ...)
    if count == 1 then return MultipartRequestParams._new1(...)
    elseif count == 1 then return MultipartRequestParams._new1(...)
    end
end


function MultipartRequestParams._new1(request)
    local self = setmetatable(RequestParams.new(), MultipartRequestParams)
    self:_init_fields()
        -- super(...) made self above
        self:processMultipartRequest(request)
    return self
end


function MultipartRequestParams._new1(pageContext)
    local self = setmetatable(RequestParams.new(), MultipartRequestParams)
    self:_init_fields()
        -- super(...) made self above
        self:processMultipartRequest(pageContext:getRequest())
    return self
end


function MultipartRequestParams:setSpecial()
        self.special = true
end


function MultipartRequestParams:processMultipartRequest(request)
        local try_ok, try_error = pcall(function()
            local specialRequest = StdUtil.getInstance():createHashMap()
            local multipartRequestList = AbFileUploadFactory.getInstance():getFileItemStreamList(request)
            if multipartRequestList ~= nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("FileItem List Size: " .. tostring(multipartRequestList:size()), self, "processMultipartRequest()")
                end
                local fileItemArray = multipartRequestList:toArray()
                local size = (fileItemArray.n or #fileItemArray)
                for index = 0, size - 1 do
                    local fileItem = fileItemArray[index + 1]
                    local name = fileItem:getName()
                    if StringValidationUtil.getInstance():isEmpty(name) then
                        specialRequest:put(fileItem:getFieldName(), fileItem:getString())
                    else
                        specialRequest:put(fileItem:getFieldName(), fileItem)
                    end
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Special Request Data: " .. tostring(specialRequest), self, "processMultipartRequest()")
                end
                self:setSpecial()
                self:setMap(specialRequest)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                self.logUtil:putF("Using Normal RequestParams", self, "processMultipartRequest()")
            end
            RequestParams.setMap(self, request:getParameterMap())
        end
end


-- throws Exception
function MultipartRequestParams:toHashMap()
        if self.special then
            return self:getMap()
        else
            return RequestParams.toHashMap(self)
        end
end

return MultipartRequestParams

