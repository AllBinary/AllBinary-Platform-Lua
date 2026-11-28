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

local AbeHttpRequestInfo = {}
package.loaded["org.allbinary.logic.communication.http.request.AbeHttpRequestInfo"] = AbeHttpRequestInfo

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

local Enumeration = java_lazy("java.util.Enumeration")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local AbeHttpRequestInfoData = java_lazy("org.allbinary.logic.communication.http.request.AbeHttpRequestInfoData")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

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

-- class table AbeHttpRequestInfo is declared before the requires
AbeHttpRequestInfo.__index = AbeHttpRequestInfo
AbeHttpRequestInfo.className = "AbeHttpRequestInfo"
AbeHttpRequestInfo.javaClassName = "org.allbinary.logic.communication.http.request.AbeHttpRequestInfo"

function AbeHttpRequestInfo:_init_fields()
    self.NAME = "AbeHttpRequestInfo"
    self.abeHttpRequestInfoData = AbeHttpRequestInfoData.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    if self.httpUserAgent == nil then self.httpUserAgent = nil end
    if self.remoteAddress == nil then self.remoteAddress = nil end
    if self.remoteHost == nil then self.remoteHost = nil end
    if self.remoteHostByAddr == nil then self.remoteHostByAddr = nil end
    if self.remotePort == nil then self.remotePort = nil end
    if self.requestedFilePath == nil then self.requestedFilePath = nil end
end

function AbeHttpRequestInfo._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return AbeHttpRequestInfo._new1(self, ...)
    end
    error("No constructor of AbeHttpRequestInfo takes " .. count .. " arguments")
end

function AbeHttpRequestInfo.new(...)
    local self = setmetatable({}, AbeHttpRequestInfo)
    AbeHttpRequestInfo._jinit(self, ...)
    return self
end

function AbeHttpRequestInfo._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HashMap")) then return AbeHttpRequestInfo._new1_1(self, ...) end
    return AbeHttpRequestInfo._new1_2(self, ...)
end


function AbeHttpRequestInfo._new1_1(self, hashMap)
    AbeHttpRequestInfo._init_fields(self)
        local stringUtil = StringUtil.getInstance()
        self.httpUserAgent = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.HTTP_USER_AGENT))
        self.remoteAddress = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_ADDRESS))
        self.remoteHost = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_HOST))
        self.remoteHostByAddr = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_HOST_BY_ADDRESS))
        self.remotePort = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REMOTE_PORT))
        self.requestedFilePath = stringUtil:getNonNull(hashMap:get(self.abeHttpRequestInfoData.REQUEST_FILE_PATH))
    return self
end


function AbeHttpRequestInfo._new1_2(self, httpServletRequest)
    AbeHttpRequestInfo._init_fields(self)
        local stringUtil = StringUtil.getInstance()
        self.httpUserAgent = stringUtil.EMPTY_STRING
        local enumuration = httpServletRequest:getHeaderNames()
        while enumuration:hasMoreElements() do
            local key = enumuration:nextElement()
            local value = httpServletRequest:getHeader(key)
            if ((string.find(key, "user", 1, true) or 0) - 1) >= 0 then
                self.httpUserAgent = require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("key: ") .. require("allbinary_java").to_string(key)) .. require("allbinary_java").to_string(" value: ")) .. require("allbinary_java").to_string(value)
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

