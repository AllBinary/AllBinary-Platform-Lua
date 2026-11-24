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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local TransformInfoObjectConfigAndManipulatorFactory = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory"] = TransformInfoObjectConfigAndManipulatorFactory

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

local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = java_lazy("org.w3c.dom.Document")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoObjectConfigAndManipulatorFactoryBase = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactoryBase")
local GenericStoreTransformInfoObjectConfig = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig")
local TransformInfoObjectConfig = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")

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

-- class table TransformInfoObjectConfigAndManipulatorFactory is declared before the requires
TransformInfoObjectConfigAndManipulatorFactory.__index = TransformInfoObjectConfigAndManipulatorFactory
TransformInfoObjectConfigAndManipulatorFactory.className = "TransformInfoObjectConfigAndManipulatorFactory"
TransformInfoObjectConfigAndManipulatorFactory.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory"
setmetatable(TransformInfoObjectConfigAndManipulatorFactory, {__index = TransformInfoObjectConfigAndManipulatorFactoryBase})

function TransformInfoObjectConfigAndManipulatorFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoObjectConfigAndManipulatorFactory.getInstance()
        return TransformInfoObjectConfigAndManipulatorFactory.instance_f
end


function TransformInfoObjectConfigAndManipulatorFactory._jinit(self)
    java_super_init(TransformInfoObjectConfigAndManipulatorFactoryBase, self)
    TransformInfoObjectConfigAndManipulatorFactory._init_fields(self)
    return self
end

function TransformInfoObjectConfigAndManipulatorFactory.new(...)
    local self = setmetatable({}, TransformInfoObjectConfigAndManipulatorFactory)
    TransformInfoObjectConfigAndManipulatorFactory._jinit(self, ...)
    return self
end


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactory:getInstance_j3_1(abeClientInformation, transformInfoInterface, objectConfigFileAbPath)
        local try_ok, try_error, try_value = pcall(function()
            local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(objectConfigFileAbPath)
            do return "__jreturn", self:getInstance(abeClientInformation, transformInfoInterface, DomDocumentHelper.create(data)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Could Not Load Object Config", TransformInfoObjectConfigAndManipulatorFactory.getInstance(), self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactory:getInstance_j2(abeClientInformation, transformInfoInterface)
        local try_ok, try_error, try_value = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            if transformInfoInterface ~= nil and not stringValidationUtil:isEmpty(transformInfoInterface:getStoreName()) then
                do return "__jreturn", GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface) end
            else
                do return "__jreturn", TransformInfoObjectConfig.new(transformInfoInterface) end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed To Get Instance: "
            if transformInfoInterface ~= nil then
                error = error .. transformInfoInterface:getName()
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, TransformInfoObjectConfigAndManipulatorFactory.getInstance(), self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function TransformInfoObjectConfigAndManipulatorFactory:getInstance_j3_2(abeClientInformation, transformInfoInterface, document)
        local try_ok, try_error, try_value = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            if transformInfoInterface ~= nil and not stringValidationUtil:isEmpty(transformInfoInterface:getStoreName()) then
                do return "__jreturn", GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface, document) end
            else
                do return "__jreturn", TransformInfoObjectConfig.new(transformInfoInterface, document) end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed To Get Instance: "
            if transformInfoInterface ~= nil then
                error = error .. transformInfoInterface:getName()
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, TransformInfoObjectConfigAndManipulatorFactory.getInstance(), "getInstance(document)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function TransformInfoObjectConfigAndManipulatorFactory:getInstance(...)
    local count = select("#", ...)
    if count == 3 then return self:getInstance_j3(...) end
    if count == 2 then return self:getInstance_j2(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
TransformInfoObjectConfigAndManipulatorFactory.getInstance__jdispatcher = TransformInfoObjectConfigAndManipulatorFactory.getInstance
function TransformInfoObjectConfigAndManipulatorFactory:getInstance_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or java_is(java_a2, "TransformInfoInterface")) and (java_a3 == nil or java_is(java_a3, "AbPath")) then return TransformInfoObjectConfigAndManipulatorFactory.getInstance_j3_1(self, ...) end
    return TransformInfoObjectConfigAndManipulatorFactory.getInstance_j3_2(self, ...)
end

TransformInfoObjectConfigAndManipulatorFactory.instance_f = TransformInfoObjectConfigAndManipulatorFactory.new()

return TransformInfoObjectConfigAndManipulatorFactory

