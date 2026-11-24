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
-- package org.allbinary.graphics.j2me.workarea

local WorkAreaDom = {}
package.loaded["org.allbinary.graphics.j2me.workarea.WorkAreaDom"] = WorkAreaDom

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

local DomHelper = java_lazy("org.allbinary.dom.DomHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")

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

-- class table WorkAreaDom is declared before the requires
WorkAreaDom.__index = WorkAreaDom
WorkAreaDom.className = "WorkAreaDom"
WorkAreaDom.javaClassName = "org.allbinary.graphics.j2me.workarea.WorkAreaDom"

function WorkAreaDom:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.canvasNodeList == nil then self.canvasNodeList = nil end
end


function WorkAreaDom._jinit(self, document)
    WorkAreaDom._init_fields(self)
        local workAreaNodeList = document:getElementsByTagName(self.WORKAREA)
        if workAreaNodeList ~= nil then
            local numberOfworkAreas = workAreaNodeList:getLength()
            if numberOfworkAreas == 1 then
                local numberOfNodes = workAreaNodeList:getLength()
                local nameNode = DomHelper.getInstance():searchNodeList(self.NAME, workAreaNodeList:item(0):getChildNodes())
                local nameTextNode = nameNode:getFirstChild()
                self.name_f = nameTextNode:getNodeValue()
            else
                error(require("java.lang.Exception").new("Wrong Number of WorkAreas: " .. tostring(numberOfworkAreas)), 0)
            end
            self.canvasNodeList = DomHelper.getInstance():getChildrenWithoutTextNodes(WorkAreaDom.FRAMES, workAreaNodeList:item(0):getChildNodes())
        else
            error(require("java.lang.Exception").new("workArea Node Not Found"), 0)
        end
    return self
end

function WorkAreaDom.new(...)
    local self = setmetatable({}, WorkAreaDom)
    WorkAreaDom._jinit(self, ...)
    return self
end


function WorkAreaDom:getName()
        return self.name_f
end


function WorkAreaDom:getCanvasNodes()
        return self.canvasNodeList
end

WorkAreaDom.WORKAREA = "workArea"
WorkAreaDom.NAME = "name"
WorkAreaDom.FRAMES = "frames"

return WorkAreaDom

