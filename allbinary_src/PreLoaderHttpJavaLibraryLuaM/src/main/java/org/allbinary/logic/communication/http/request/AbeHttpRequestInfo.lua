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

-- local Enumeration = require("java.util.Enumeration")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeHttpRequestInfo = {}
AbeHttpRequestInfo.__index = AbeHttpRequestInfo
AbeHttpRequestInfo.className = "AbeHttpRequestInfo"

function AbeHttpRequestInfo:_init_fields()
    self.NAME = "AbeHttpRequestInfo"
    self.abeHttpRequestInfoData = AbeHttpRequestInfoData.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.httpUserAgent = nil
    self.remoteAddress = nil
    self.remoteHost = nil
    self.remoteHostByAddr = nil
    self.remotePort = nil
    self.requestedFilePath = nil
end

function AbeHttpRequestInfo.new(...)
    local count = select("#", ...)
    if count == 1 then return AbeHttpRequestInfo._new1(...)
    elseif count == 1 then return AbeHttpRequestInfo._new1(...)
    end
end


function AbeHttpRequestInfo._new1(hashMap)
    local self = setmetatable({}, AbeHttpRequestInfo)
    self:_init_fields()
        local stringUtil = StringUtil.getInstance()
        self.httpUserAgent = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.HTTP_USER_AGENT))
        self.remoteAddress = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_ADDRESS))
        self.remoteHost = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_HOST))
        self.remoteHostByAddr = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_HOST_BY_ADDRESS))
        self.remotePort = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_PORT))
        self.requestedFilePath = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REQUEST_FILE_PATH))
    return self
end


function AbeHttpRequestInfo._new1(httpServletRequest)
    local self = setmetatable({}, AbeHttpRequestInfo)
    self:_init_fields()
        local stringUtil = StringUtil.getInstance()
        self.httpUserAgent = stringUtil.EMPTY_STRING
        local enumuration = httpServletRequest:getHeaderNames()
        while enumuration:hasMoreElements() do
            local key = enumuration:nextElement()
            local value = httpServletRequest:getHeader(key)
            if ((string.find(key, "user", 1, true) or 0) - 1) >= 0 then
                self.httpUserAgent = "key: " .. key .. " value: " .. value
            end
        end
        self.remoteHostByAddr = stringUtil.EMPTY_STRING
        self.remoteAddress = httpServletRequest:getRemoteAddr()
        self.remoteHost = httpServletRequest:getRemoteHost()
        self.requestedFilePath = httpServletRequest:getServletPath()
        self.remotePort = tostring(httpServletRequest:getRemotePort())
    return self
end


function AbeHttpRequestInfo:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(self.abeHttpRequestInfoData.HTTP_USER_AGENT, self.httpUserAgent)
        hashMap:put(self.abeHttpRequestInfoData.REMOTE_ADDRESS, self.remoteAddress)
        hashMap:put(self.abeHttpRequestInfoData.REMOTE_HOST, self.remoteHost)
        hashMap:put(self.abeHttpRequestInfoData.REMOTE_HOST_BY_ADDRESS, self.remoteHostByAddr)
        hashMap:put(self.abeHttpRequestInfoData.REMOTE_PORT, self.remotePort)
        hashMap:put(self.abeHttpRequestInfoData.REQUEST_FILE_PATH, self.requestedFilePath)
        return hashMap
end


function AbeHttpRequestInfo:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.httpUserAgent)
        vector:add(self.remoteAddress)
        vector:add(self.remoteHost)
        vector:add(self.remoteHostByAddr)
        vector:add(self.remotePort)
        vector:add(self.requestedFilePath)
        return vector
end


function AbeHttpRequestInfo:toString()
        return tostring(StringMaker.new():append(self.NAME):append(self.commonSeps.COLON_SEP):append(self.abeHttpRequestInfoData.HTTP_USER_AGENT):append(self.commonSeps.COLON_SEP):append(self.httpUserAgent):append(self.commonSeps.SPACE):append(self.abeHttpRequestInfoData.REMOTE_ADDRESS):append(self.commonSeps.COLON_SEP):append(self.remoteAddress):append(self.commonSeps.SPACE):append(self.abeHttpRequestInfoData.REMOTE_HOST):append(self.commonSeps.COLON_SEP):append(self.remoteHost):append(self.commonSeps.SPACE):append(self.abeHttpRequestInfoData.REMOTE_HOST_BY_ADDRESS):append(self.commonSeps.COLON_SEP):append(self.remoteHostByAddr):append(self.commonSeps.SPACE):append(self.abeHttpRequestInfoData.REMOTE_PORT):append(self.commonSeps.COLON_SEP):append(self.remotePort):append(self.commonSeps.SPACE):append(self.abeHttpRequestInfoData.REQUEST_FILE_PATH):append(self.commonSeps.COLON_SEP):append(self.requestedFilePath))
end
AbeHttpRequestInfo.__tostring = function(self) return self:toString() end

return AbeHttpRequestInfo

