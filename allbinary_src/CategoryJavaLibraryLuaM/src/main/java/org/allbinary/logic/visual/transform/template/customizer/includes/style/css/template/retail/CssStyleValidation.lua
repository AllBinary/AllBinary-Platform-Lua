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
-- package org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail

local CssStyleValidation = {}
package.loaded["org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation"] = CssStyleValidation

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local ValidationInterface = java_lazy("org.allbinary.logic.control.validate.ValidationInterface")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StyleData = java_lazy("org.allbinary.logic.visual.dhtml.style.StyleData")
local StylesData = java_lazy("org.allbinary.logic.visual.dhtml.style.StylesData")
local StylesValidationFactory = java_lazy("org.allbinary.logic.visual.dhtml.style.StylesValidationFactory")
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

-- class table CssStyleValidation is declared before the requires
CssStyleValidation.__index = CssStyleValidation
CssStyleValidation.className = "CssStyleValidation"
CssStyleValidation.javaClassName = "org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation"
setmetatable(CssStyleValidation, {__index = Validation})
CssStyleValidation.java_implements = " DomNodeInterface "
CssStyleValidation.java_interfaces = function() return {DomNodeInterface} end

function CssStyleValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.cssStyleElementVector == nil then self.cssStyleElementVector = nil end
end

function CssStyleValidation._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return CssStyleValidation._new0(self, ...)
    elseif count == 1 then return CssStyleValidation._new1(self, ...)
    end
    error("No constructor of CssStyleValidation takes " .. count .. " arguments")
end

function CssStyleValidation.new(...)
    local self = setmetatable({}, CssStyleValidation)
    CssStyleValidation._jinit(self, ...)
    return self
end

function CssStyleValidation._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) then return CssStyleValidation._new1_1(self, ...) end
    return CssStyleValidation._new1_2(self, ...)
end


function CssStyleValidation._new0(self)
    java_super_init(Validation, self)
    CssStyleValidation._init_fields(self)
        self.cssStyleElementVector = BasicArrayListD.new()
    return self
end


function CssStyleValidation._new1_1(self, document)
    java_super_init(Validation, self)
    CssStyleValidation._init_fields(self)
        self.cssStyleElementVector = StylesValidationFactory.getInstance():getInstance(document)
    return self
end


function CssStyleValidation._new1_2(self, hashMap)
    java_super_init(Validation, self)
    CssStyleValidation._init_fields(self)
        self.cssStyleElementVector = StylesValidationFactory.getInstance(hashMap)
    return self
end


function CssStyleValidation:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local isValid = true
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            local size = self.cssStyleElementVector:size()
            for i = 0, size - 1 do
                local styleValidationInterface = self.cssStyleElementVector:get(i)
                if not styleValidationInterface:isValid() then
                    isValid = false
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("End: " .. tostring(isValid), self, self.commonStrings.IS_VALID)
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
java_overload(CssStyleValidation, "isValid", 0)


function CssStyleValidation:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
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
java_overload(CssStyleValidation, "validationInfo", 0)


function CssStyleValidation:toValidationInfoDoc()
        return nil
end
java_overload(CssStyleValidation, "toValidationInfoDoc", 0)


function CssStyleValidation:toValidationInfoNode(document)
        return nil
end
java_overload(CssStyleValidation, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function CssStyleValidation:toXmlNode(document)
        local node = document:createElement(StylesData.getInstance().NAME)
        local styleNode = document:createElement(StyleData.getInstance().NAME)
        node:appendChild(styleNode)
        local size = self.cssStyleElementVector:size()
        for i = 0, size - 1 do
            local styleDomNodeInterface = self.cssStyleElementVector:get(i)
            styleNode:appendChild(styleDomNodeInterface:toXmlNode(document))
        end
        return node
end
java_overload(CssStyleValidation, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

return CssStyleValidation

