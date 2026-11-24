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
-- package org.allbinary.logic.visual.transform.info

local TransformInfoBasic = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoBasic"] = TransformInfoBasic

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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbContext = require("org.allbinary.business.context.AbContext")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local Document = java_lazy("org.w3c.dom.Document")
local WeblisketSessionInterface = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

--Hack class should not exist
-- class table TransformInfoBasic is declared before the requires
TransformInfoBasic.__index = TransformInfoBasic
TransformInfoBasic.className = "TransformInfoBasic"
TransformInfoBasic.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoBasic"
setmetatable(TransformInfoBasic, {__index = AbContext})
TransformInfoBasic.java_implements = " TransformInfoHttpInterface "
TransformInfoBasic.java_interfaces = function() return {TransformInfoHttpInterface} end

function TransformInfoBasic:_init_fields()
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
end


function TransformInfoBasic._jinit(self, storeFrontInterface, propertiesHashMap, pageContext)
    java_super_init(AbContext, self, propertiesHashMap, pageContext)
    TransformInfoBasic._init_fields(self)
        -- super(...) made self above
        self.storeFrontInterface = storeFrontInterface
    return self
end

function TransformInfoBasic.new(...)
    local self = setmetatable({}, TransformInfoBasic)
    TransformInfoBasic._jinit(self, ...)
    return self
end


function TransformInfoBasic:getStoreName()
        return self.storeFrontInterface:getName()
end
java_overload(TransformInfoBasic, "getStoreName", 0)


function TransformInfoBasic:log()
        return self.commonStrings.NOT_IMPLEMENTED
end
java_overload(TransformInfoBasic, "log", 0)


function TransformInfoBasic:override(hashMap)
end
java_overload(TransformInfoBasic, "override", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function TransformInfoBasic:getName()
        return nil
end
java_overload(TransformInfoBasic, "getName", 0)


function TransformInfoBasic:getObjectFile()
        return nil
end
java_overload(TransformInfoBasic, "getObjectFile", 0)


function TransformInfoBasic:getObject()
        return nil
end
java_overload(TransformInfoBasic, "getObject", 0)


function TransformInfoBasic:getObjectConfigInterface()
        return nil
end
java_overload(TransformInfoBasic, "getObjectConfigInterface", 0)


function TransformInfoBasic:setObjectConfigInterface(transformInfoObjectConfigInterface)
end
java_overload(TransformInfoBasic, "setObjectConfigInterface", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TransformInfoObjectConfigInterface")) end)


function TransformInfoBasic:getTemplateFilePath()
        return nil
end
java_overload(TransformInfoBasic, "getTemplateFilePath", 0)


function TransformInfoBasic:getTemplateFile()
        return nil
end
java_overload(TransformInfoBasic, "getTemplateFile", 0)


function TransformInfoBasic:getTemplate()
        return nil
end
java_overload(TransformInfoBasic, "getTemplate", 0)


function TransformInfoBasic:getDataFilePath()
        return nil
end
java_overload(TransformInfoBasic, "getDataFilePath", 0)


function TransformInfoBasic:getDataFile()
        return nil
end
java_overload(TransformInfoBasic, "getDataFile", 0)


-- throws Exception
function TransformInfoBasic:getDataDocument()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(TransformInfoBasic, "getDataDocument", 0)


function TransformInfoBasic:setName(value)
end
java_overload(TransformInfoBasic, "setName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setStoreName(value)
end
java_overload(TransformInfoBasic, "setStoreName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setObjectFile(value)
end
java_overload(TransformInfoBasic, "setObjectFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setObject(anyType)
end
java_overload(TransformInfoBasic, "setObject", 1)


function TransformInfoBasic:setObjectConfigFile(value)
end
java_overload(TransformInfoBasic, "setObjectConfigFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setTemplateFile(value)
end
java_overload(TransformInfoBasic, "setTemplateFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setTemplate(value)
end
java_overload(TransformInfoBasic, "setTemplate", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setDataFile(value)
end
java_overload(TransformInfoBasic, "setDataFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setData(value)
end
java_overload(TransformInfoBasic, "setData", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoBasic:setChild()
end
java_overload(TransformInfoBasic, "setChild", 0)


function TransformInfoBasic:isChild()
        return true
end
java_overload(TransformInfoBasic, "isChild", 0)


function TransformInfoBasic:getImportUriPath()
        return nil
end
java_overload(TransformInfoBasic, "getImportUriPath", 0)


function TransformInfoBasic:setImportUriPath(importUriPath)
end
java_overload(TransformInfoBasic, "setImportUriPath", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function TransformInfoBasic:getKey()
        return nil
end
java_overload(TransformInfoBasic, "getKey", 0)


-- throws Exception
function TransformInfoBasic:toVector()
        return nil
end
java_overload(TransformInfoBasic, "toVector", 0)


-- throws Exception
function TransformInfoBasic:toHashMap()
        return nil
end
java_overload(TransformInfoBasic, "toHashMap", 0)


function TransformInfoBasic:getWeblisketSession()
        return java_super(AbContext, "getWeblisketSession", 0)(self)
end
java_overload(TransformInfoBasic, "getWeblisketSession", 0)


function TransformInfoBasic:getPageContext()
        return java_super(AbContext, "getPageContext", 0)(self)
end
java_overload(TransformInfoBasic, "getPageContext", 0)


function TransformInfoBasic:getPropertiesHashMap()
        return java_super(AbContext, "getPropertiesHashMap", 0)(self)
end
java_overload(TransformInfoBasic, "getPropertiesHashMap", 0)

return TransformInfoBasic

