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

local NameSpaceRequestParam = {}
package.loaded["org.allbinary.logic.communication.http.request.NameSpaceRequestParam"] = NameSpaceRequestParam

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

local HashMap = java_lazy("java.util.HashMap")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Tokenizer = java_lazy("org.allbinary.logic.string.tokens.Tokenizer")
local HtmlNameMathData = java_lazy("org.allbinary.logic.visual.dhtml.html.name.HtmlNameMathData")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local NameSpaceRequestParamData = java_lazy("org.allbinary.logic.communication.http.request.NameSpaceRequestParamData")

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

-- class table NameSpaceRequestParam is declared before the requires
NameSpaceRequestParam.__index = NameSpaceRequestParam
NameSpaceRequestParam.className = "NameSpaceRequestParam"
NameSpaceRequestParam.javaClassName = "org.allbinary.logic.communication.http.request.NameSpaceRequestParam"

function NameSpaceRequestParam:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.nameSpaceVector == nil then self.nameSpaceVector = nil end
    if self.nameSpacePropertiesHashMap == nil then self.nameSpacePropertiesHashMap = nil end
    if self.value == nil then self.value = nil end
end


function NameSpaceRequestParam._jinit(self, nameSpace, value)
    NameSpaceRequestParam._init_fields(self)
        self.nameSpaceVector = BasicArrayListD.new()
        self.nameSpacePropertiesHashMap = StdUtil.getInstance():createHashMap()
        self.value = value
        local beginIndex = ((string.find(nameSpace, NameSpaceRequestParamData.NAME, 1, true) or 0) - 1)
        if beginIndex < 0 then
            error(require("java.lang.Exception").new("Not a NameSpaceRequest"), 0)
        end
        local packages = string.sub(nameSpace, (beginIndex + NameSpaceRequestParamData.NAME:length() + NameSpaceRequestParamData.SEP:length()) + 1)
        local sepTokenizer = Tokenizer.new(NameSpaceRequestParamData.SEP)
        local nameSpaceWithPropertiesVector = sepTokenizer:getTokensFromString(packages, BasicArrayListD.new())
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF("\nSep Tokens: " .. tostring(nameSpaceWithPropertiesVector), self, "NameSpaceRequestParam()")
        end
        local nameSpaceAndPropertiesTokenizer = Tokenizer.new(NameSpaceRequestParamData.PROPERTIES)
        local packageIndex = 0
        local list = BasicArrayListD.new()
        local index = 0
        local size = nameSpaceWithPropertiesVector:size()
        while index < size do
            local nameSpaceWithProperties = nameSpaceWithPropertiesVector:get((function() local value = index index = value + 1 return value end)())
            list:clear()
            local nameSpaceAndPropertiesVector = nameSpaceAndPropertiesTokenizer:getTokensFromString(nameSpaceWithProperties, list)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                self.logUtil:putF("\nPackageName and PackageName Properties Tokens: " .. tostring(nameSpaceAndPropertiesVector), self, "NameSpaceRequestParam()")
            end
            if nameSpaceAndPropertiesVector:size() > 0 then
                local packageName = nameSpaceAndPropertiesVector:get(0)
                if packageName == nil then
                    error(require("java.lang.Exception").new("Package Name Is Null"), 0)
                end
                self.nameSpaceVector:add(packageName)
                if nameSpaceAndPropertiesVector:size() > 1 then
                    local properties = nameSpaceAndPropertiesVector:get(1)
                    local packagePropertiesHashMap = self:generatePackagePropertiesHashMap(properties)
                    self.nameSpacePropertiesHashMap:put(tostring(packageIndex), packagePropertiesHashMap)
                end
                packageIndex = packageIndex + 1
            end
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF("NameSpace: " .. tostring(self.nameSpaceVector), self, "NameSpaceRequestParam()")
        end
    return self
end

function NameSpaceRequestParam.new(...)
    local self = setmetatable({}, NameSpaceRequestParam)
    NameSpaceRequestParam._jinit(self, ...)
    return self
end


function NameSpaceRequestParam:getPackages()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF("NameSpace: " .. tostring(self.nameSpaceVector), self, "getPackages()")
        end
        return self.nameSpaceVector
end


function NameSpaceRequestParam:getPackageProperties(packageIndex)
        local packagePropertiesHashMap = self.nameSpacePropertiesHashMap:get(tostring(packageIndex))
        if packagePropertiesHashMap == nil then
            packagePropertiesHashMap = StdUtil.getInstance():createHashMap()
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF("Package Properties: " .. tostring(packagePropertiesHashMap), self, "getPackagesProperties()")
        end
        return packagePropertiesHashMap
end


function NameSpaceRequestParam:getValue()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF("\nValue: " .. self.value, self, "getValue()")
        end
        return self.value
end


-- throws Exception
function NameSpaceRequestParam:generatePackagePropertiesHashMap(properties)
        local propertiesTokenizer = Tokenizer.new(NameSpaceRequestParamData.PROPERTIESSEPARATOR)
        local packagePropertiesHashMap = StdUtil.getInstance():createHashMap()
        local propertyVector = propertiesTokenizer:getTokensFromString(properties, BasicArrayListD.new())
        local list = BasicArrayListD.new()
        local propertyTokenizer = Tokenizer.new(HtmlNameMathData.getInstance().EQUALS)
        local index = 0
        local size = propertyVector:size()
        while index < size do
            local property = propertyVector:get(index)
            list:clear()
            local propertyNameValueVector = propertyTokenizer:getTokensFromString(property, list)
            local index2 = 0
            while index2 < propertyNameValueVector:size() do
                local propertyName = propertyNameValueVector:get((function() local value = index2 index2 = value + 1 return value end)())
                if propertyNameValueVector:size() > 1 then
                    local propertyValue = propertyNameValueVector:get((function() local value = index2 index2 = value + 1 return value end)())
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                        self.logUtil:putF("\nProperty Name: " .. propertyName .. "\nProperty Value: " .. propertyValue, self, "generatePackagePropertiesHashMap()")
                    end
                    packagePropertiesHashMap:put(propertyName, propertyValue)
                else
                    packagePropertiesHashMap:put(propertyName, StringUtil.getInstance().EMPTY_STRING)
                end
            end
        end
        return packagePropertiesHashMap
end

return NameSpaceRequestParam

