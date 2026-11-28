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

local RequestParams = {}
package.loaded["org.allbinary.logic.communication.http.request.RequestParams"] = RequestParams

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
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local RequestData = java_lazy("org.allbinary.logic.communication.http.request.RequestData")

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

--Note: if request is destroyed or messed up this will not work. Use fileRequestParams
-- class table RequestParams is declared before the requires
RequestParams.__index = RequestParams
RequestParams.className = "RequestParams"
RequestParams.javaClassName = "org.allbinary.logic.communication.http.request.RequestParams"

function RequestParams:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.map == nil then self.map = nil end
    self.KEY = "Key: "
    self.VALUE = " Value: "
end

function RequestParams._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return RequestParams._new0(self, ...)
    elseif count == 1 then return RequestParams._new1(self, ...)
    end
    error("No constructor of RequestParams takes " .. count .. " arguments")
end

function RequestParams.new(...)
    local self = setmetatable({}, RequestParams)
    RequestParams._jinit(self, ...)
    return self
end

function RequestParams._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) then return RequestParams._new1_1(self, ...) end
    return RequestParams._new1_2(self, ...)
end


function RequestParams._new0(self)
    RequestParams._init_fields(self)
        self.logUtil:putF("New RequestParams Size: 0", self, self.commonStrings.CONSTRUCTOR)
    return self
end


function RequestParams._new1_1(self, request)
    RequestParams._init_fields(self)
        self.map = request:getParameterMap()
        self.logUtil:putF(require("allbinary_java").to_string("RequestParams Size: ") .. require("allbinary_java").to_string(self:getMap():keySet():size()), self, self.commonStrings.CONSTRUCTOR)
    return self
end


function RequestParams._new1_2(self, pageContext)
    RequestParams._init_fields(self)
        self.map = pageContext:getRequest():getParameterMap()
        self.logUtil:putF(require("allbinary_java").to_string("Request Params Size: ") .. require("allbinary_java").to_string(self:getMap():keySet():size()), self, self.commonStrings.CONSTRUCTOR)
    return self
end


function RequestParams:setMap(map)
        self.map = map
end


function RequestParams:getMap()
        return self.map
end


function RequestParams:toXmlNode(document)
        local try_ok, try_error, try_value = pcall(function()
            local node = document:createElement(RequestData.REQUEST)
            local stringBuffer = StringMaker.new()
            local keys = self.map:keySet()
            local keyArray = keys:toArray()
            local size = (keyArray.n or #keyArray)
            for i = 0, size - 1 do
                local key = keyArray[i + 1]
                local values = self.map:get(key)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.KEY)
                stringBuffer:append(key)
                stringBuffer:append(self.VALUE)
                stringBuffer:append(values[1])
                self.logUtil:putF(tostring(stringBuffer), self, "toXmlNode(document)")
                node:appendChild(ModDomHelper.createNameValueNodes(document, RequestData.PARAMETER, tostring(key), tostring(values[1])))
            end
            do return "__jreturn", node end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode(document)", e)
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function RequestParams:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        local keys = self.map:keySet()
        local keyArray = keys:toArray()
        local size = (keyArray.n or #keyArray)
        local stringBuffer = StringMaker.new()
        for i = 0, size - 1 do
            local key = keyArray[i + 1]
            local values = self.map:get(key)
            hashMap:put(tostring(key), tostring(values[1]))
        end
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append("RequestParams: ")
        stringBuffer:append(tostring(self.map))
        stringBuffer:append("\ntoHashMap: ")
        stringBuffer:append(tostring(hashMap))
        self.logUtil:putF(tostring(stringBuffer), self, "toHashMap()")
        return hashMap
end

return RequestParams

