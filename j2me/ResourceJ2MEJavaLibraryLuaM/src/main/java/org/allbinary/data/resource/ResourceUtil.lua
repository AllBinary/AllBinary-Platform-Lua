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
-- package org.allbinary.data.resource

local ResourceUtil = {}
package.loaded["org.allbinary.data.resource.ResourceUtil"] = ResourceUtil

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

-- local InputStream = require("java.io.InputStream")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--J2ME
-- class table ResourceUtil is declared before the requires
ResourceUtil.__index = ResourceUtil
ResourceUtil.className = "ResourceUtil"
ResourceUtil.javaClassName = "org.allbinary.data.resource.ResourceUtil"

function ResourceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ResourceUtil.getInstance()
        return ResourceUtil.instance_f
end


function ResourceUtil._jinit(self)
    ResourceUtil._init_fields(self)
    return self
end

function ResourceUtil.new(...)
    local self = setmetatable({}, ResourceUtil)
    ResourceUtil._jinit(self, ...)
    return self
end


function ResourceUtil:setLoadingPaths(path, ext)
        self.logUtil:putF(CommonStrings.getInstance().NOT_IMPLEMENTED, self, "setLoadingPaths")
end


-- throws Exception
function ResourceUtil:getResourceAsStream(resource)
        local inputStream = getmetatable(resource):getResourceAsStream(resource)
        if inputStream == nil then
            inputStream = self:getResourceAsStreamAtStart(resource, 2)
            if inputStream == nil then
                inputStream = self:getResourceAsStreamAtStart(resource, 1)
                if inputStream == nil then
                    local stringMaker = StringMaker.new()
                    local index = resource:lastIndexOf("/")
                    local resourcePath = string.sub(resource, (index + 1) + 1)
                    inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                    if inputStream == nil then
                        resourcePath = string.sub(resource, (index) + 1)
                        inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                        if inputStream == nil then
                            local RES = "res"
                            resourcePath = tostring(stringMaker:append(RES):append(string.sub(resource, (index) + 1)))
                            inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                            if inputStream == nil then
                                stringMaker:delete(0, stringMaker:length())
                                resourcePath = tostring(stringMaker:append("/"):append(RES):append(string.sub(resource, (index) + 1)))
                                inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                                local COLON = CommonSeps.getInstance().COLON
                                if inputStream == nil then
                                    stringMaker:delete(0, stringMaker:length())
                                    resourcePath = tostring(stringMaker:append(RES):append(COLON):append(string.sub(resource, (index) + 1)))
                                    inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                                    if inputStream == nil then
                                        stringMaker:delete(0, stringMaker:length())
                                        resourcePath = tostring(stringMaker:append(RES):append(COLON):append(string.sub(resource, (index + 1) + 1)))
                                        inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                                        if inputStream == nil then
                                            local RESOURCE_STRING = "resource"
                                            stringMaker:delete(0, stringMaker:length())
                                            resourcePath = tostring(stringMaker:append(RESOURCE_STRING):append(COLON):append(string.sub(resource, (index) + 1)))
                                            inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                                            if inputStream == nil then
                                                stringMaker:delete(0, stringMaker:length())
                                                resourcePath = tostring(stringMaker:append(RESOURCE_STRING):append(COLON):append(string.sub(resource, (index + 1) + 1)))
                                                inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
                                                if inputStream == nil then
                                                    stringMaker:delete(0, stringMaker:length())
                                                    error(require("java.lang.Exception").new(tostring(stringMaker:append("Unable to obtain: "):append(resource))), 0)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        return inputStream
end


-- throws Exception
function ResourceUtil:getResourceAsStreamAtStart(resource, startIndex)
        local stringMaker = StringMaker.new()
        local index = ((string.find(resource, CommonSeps.getInstance().COLON, 1, true) or 0) - 1)
        local resourcePath = string.sub(resource, (index + startIndex) + 1)
        local inputStream = getmetatable(resource):getResourceAsStream(resourcePath)
        if inputStream ~= nil then
            return inputStream
        end
        return inputStream
end


function ResourceUtil:addResource(resource, value)
end

ResourceUtil.instance_f = ResourceUtil.new()

return ResourceUtil

