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
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Note: if request is destroyed or messed up this will not work. Use fileRequestParams
local RequestParams = {}
RequestParams.__index = RequestParams
RequestParams.className = "RequestParams"

function RequestParams:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.map = nil
    self.KEY = "Key: "
    self.VALUE = " Value: "
end

function RequestParams.new(...)
    local count = select("#", ...)
    if count == 0 then return RequestParams._new0(...)
    elseif count == 1 then return RequestParams._new1(...)
    elseif count == 1 then return RequestParams._new1(...)
    end
end


function RequestParams._new0()
    local self = setmetatable({}, RequestParams)
    self:_init_fields()
        self.logUtil:putF("New RequestParams Size: 0", self, self.commonStrings.CONSTRUCTOR)
    return self
end


function RequestParams._new1(request)
    local self = setmetatable({}, RequestParams)
    self:_init_fields()
        self.map = request:getParameterMap()
        self.logUtil:putF("RequestParams Size: " .. tostring(self:getMap():keySet():size()), self, self.commonStrings.CONSTRUCTOR)
    return self
end


function RequestParams._new1(pageContext)
    local self = setmetatable({}, RequestParams)
    self:_init_fields()
        self.map = pageContext:getRequest():getParameterMap()
        self.logUtil:putF("Request Params Size: " .. tostring(self:getMap():keySet():size()), self, self.commonStrings.CONSTRUCTOR)
    return self
end


function RequestParams:setMap(map)
        self.map = map
end


function RequestParams:getMap()
        return self.map
end


function RequestParams:toXmlNode(document)
        local try_ok, try_error = pcall(function()
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
            return node
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode(document)", e)
            return nil
        end
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

