--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 leIIgal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.transform.template.customizer.bodies.title

local TitleBodyValidation = {}
package.loaded["org.allbinary.logic.visual.transform.template.customizer.bodies.title.TitleBodyValidation"] = TitleBodyValidation

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
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = java_lazy("org.allbinary.logic.communication.sql.AbSqlData")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local BodyData = java_lazy("org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData")
local TitleData = java_lazy("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local TitleNotRequiredValidation = java_lazy("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleNotRequiredValidation")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table TitleBodyValidation is declared before the requires
TitleBodyValidation.__index = TitleBodyValidation
TitleBodyValidation.className = "TitleBodyValidation"
TitleBodyValidation.javaClassName = "org.allbinary.logic.visual.transform.template.customizer.bodies.title.TitleBodyValidation"
setmetatable(TitleBodyValidation, {__index = Validation})
TitleBodyValidation.java_implements = " DomNodeInterface "
TitleBodyValidation.java_interfaces = function() return {DomNodeInterface} end

function TitleBodyValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.body == nil then self.body = nil end
    if self.titleValidation == nil then self.titleValidation = nil end
end

function TitleBodyValidation._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return TitleBodyValidation._new0(self, ...)
    elseif count == 1 then return TitleBodyValidation._new1(self, ...)
    end
    error("No constructor of TitleBodyValidation takes " .. count .. " arguments")
end

function TitleBodyValidation.new(...)
    local self = setmetatable({}, TitleBodyValidation)
    TitleBodyValidation._jinit(self, ...)
    return self
end

function TitleBodyValidation._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) then return TitleBodyValidation._new1_1(self, ...) end
    return TitleBodyValidation._new1_2(self, ...)
end


function TitleBodyValidation._new0(self)
    java_super_init(Validation, self)
    TitleBodyValidation._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
        local stringUtil = StringUtil.getInstance()
        self.body = stringUtil.EMPTY_STRING
        self.titleValidation = TitleNotRequiredValidation.new()
    return self
end


function TitleBodyValidation._new1_1(self, document)
    java_super_init(Validation, self)
    TitleBodyValidation._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, "Constructor(document)")
        end
        local nodeList = document:getElementsByTagName(BodyData.getInstance().NAME)
        for index = 0, nodeList:getLength() - 1 do
            local aBodyNode = nodeList:item(index)
            local aBodyValueNode = DomSearchHelper.getNode(DomData.VALUE, aBodyNode:getChildNodes())
            self.body = DomNodeHelper.getTextNodeValue(aBodyValueNode)
            local titleNode = DomSearchHelper.getNode(TitleData.getInstance().NAME, aBodyNode:getChildNodes())
            self.titleValidation = TitleNotRequiredValidation.new(titleNode)
            if index > 1 then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("To Many Body Nodes", self, self.commonStrings.CONSTRUCTOR)
                end
            end
        end
    return self
end


function TitleBodyValidation._new1_2(self, hashMap)
    java_super_init(Validation, self)
    TitleBodyValidation._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.START, self, "Constructor(hashmap)")
        end
        self:getFormData(hashMap)
    return self
end


-- throws Exception
function TitleBodyValidation:getFormData(hashMap)
        self.body = hashMap:get(BodyData.getInstance().NAME)
        self.titleValidation = TitleNotRequiredValidation.new(hashMap)
end
java_overload(TitleBodyValidation, "getFormData", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function TitleBodyValidation:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local isValid = true
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("TitleBodyValidation", self, self.commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidNotRequired(self.body, BodyData.getInstance().MIN, AbSqlData.MAXBLOB) then
                isValid = false
            end
            if not self.titleValidation:isValid() then
                isValid = false
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("TitleBodyValidation: " .. tostring(isValid), self, self.commonStrings.IS_VALID)
            end
            do return "__jreturn", isValid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TitleBodyValidation, "isValid", 0)


function TitleBodyValidation:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            do
                stringBuffer:append("Error: Data submitted is < ")
                stringBuffer:appendint(java_int(BodyData.getInstance().MIN))
                stringBuffer:append(" or > ")
                stringBuffer:appendint(java_int(AbSqlData.MAXBLOB))
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TitleBodyValidation, "validationInfo", 0)


function TitleBodyValidation:toValidationInfoDoc()
        return nil
end
java_overload(TitleBodyValidation, "toValidationInfoDoc", 0)


function TitleBodyValidation:toValidationInfoNode(document)
        return nil
end
java_overload(TitleBodyValidation, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function TitleBodyValidation:toXmlNode(document)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Title Body: " .. self.body, self, "toXmlNode(document)")
        end
        local node = ModDomHelper.createNameValueNodes(document, BodyData.getInstance().NAME, self.body)
        node:appendChild(self.titleValidation:toXmlNode(document))
        return node
end
java_overload(TitleBodyValidation, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

return TitleBodyValidation

