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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.title

local TitleView = {}
package.loaded["org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleView"] = TitleView

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
local DomData = java_lazy("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table TitleView is declared before the requires
TitleView.__index = TitleView
TitleView.className = "TitleView"
TitleView.javaClassName = "org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleView"
TitleView.java_implements = " DomNodeInterface "
TitleView.java_interfaces = function() return {DomNodeInterface} end

function TitleView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.title == nil then self.title = nil end
end

function TitleView._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return TitleView._new0(self, ...)
    elseif count == 1 then return TitleView._new1(self, ...)
    end
    error("No constructor of TitleView takes " .. count .. " arguments")
end

function TitleView.new(...)
    local self = setmetatable({}, TitleView)
    TitleView._jinit(self, ...)
    return self
end

function TitleView._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return TitleView._new1_1(self, ...) end
    return TitleView._new1_2(self, ...)
end


function TitleView._new0(self)
    TitleView._init_fields(self)
        self.title = TitleView.NAME
    return self
end


function TitleView._new1_1(self, node)
    TitleView._init_fields(self)
        local titleTextNode = DomSearchHelper.getNode(TitleData.getInstance().TEXT, node:getChildNodes())
        local valueNode = DomSearchHelper.getNode(DomData.VALUE, titleTextNode:getChildNodes())
        self.title = DomNodeHelper.getTextNodeValue(valueNode)
        if StringValidationUtil.getInstance():isEmpty(self.title) then
            self.title = TitleView.NAME
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Title: " .. tostring(self:getTitle()), self, "Consructor()")
        end
    return self
end


function TitleView._new1_2(self, hashMap)
    TitleView._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("HashMap: " .. tostring(hashMap), self, self.commonStrings.CONSTRUCTOR)
        end
        self:getFormData(hashMap)
    return self
end


function TitleView:getTitle()
        return self.title
end


function TitleView:getFormData(hashMap)
        self.title = hashMap:get(TitleData.getInstance().TEXT)
        if StringValidationUtil.getInstance():isEmpty(self.title) then
            self.title = TitleView.NAME
        end
end


function TitleView:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(TitleData.getInstance().TEXT, self:getTitle())
        return hashMap
end


-- throws Exception
function TitleView:toXmlNode(document)
        local hashMap = self:toHashMap()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("TitleView HashMap: " .. tostring(hashMap), self, "toXmlNode()")
        end
        return ModDomHelper.createNameValueNodes(document, TitleData.getInstance().NAME, hashMap)
end

TitleView.NAME = "None"

return TitleView

