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
-- package taghelpers

local ValidationViewHelper = {}
package.loaded["taghelpers.ValidationViewHelper"] = ValidationViewHelper

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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ViewHelper = require("taghelpers.ViewHelper")

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

-- class table ValidationViewHelper is declared before the requires
ValidationViewHelper.__index = ValidationViewHelper
ValidationViewHelper.className = "ValidationViewHelper"
ValidationViewHelper.javaClassName = "taghelpers.ValidationViewHelper"
setmetatable(ValidationViewHelper, {__index = ViewHelper})
ValidationViewHelper.java_implements = " ValidationComponentInterface "
ValidationViewHelper.java_interfaces = function() return {ValidationComponentInterface} end

function ValidationViewHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.viewInterface == nil then self.viewInterface = nil end
end


function ValidationViewHelper._jinit(self, hashMap, pageContext)
    java_super_init(ViewHelper, self, hashMap, pageContext)
    ValidationViewHelper._init_fields(self)
        -- super(...) made self above
        self.viewInterface = self:getViewObject()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function ValidationViewHelper.new(...)
    local self = setmetatable({}, ValidationViewHelper)
    ValidationViewHelper._jinit(self, ...)
    return self
end


function ValidationViewHelper:isValid()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
                self.logUtil:putF("Started", self, self.commonStrings.IS_VALID)
            end
            do return "__jreturn", self.viewInterface:isValid() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ValidationViewHelper, "isValid", 0)


function ValidationViewHelper:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.viewInterface:validationInfo() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "validationInfo()", e)
            end
            return "Unknown Validation Error"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ValidationViewHelper, "validationInfo", 0)


function ValidationViewHelper:toValidationInfoDoc()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.viewInterface:toValidationInfoDoc() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toValidationInfoDoc()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ValidationViewHelper, "toValidationInfoDoc", 0)


function ValidationViewHelper:toValidationInfoNode(document)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.viewInterface:toValidationInfoNode(document) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toValidationInfoNode()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(ValidationViewHelper, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

return ValidationViewHelper

