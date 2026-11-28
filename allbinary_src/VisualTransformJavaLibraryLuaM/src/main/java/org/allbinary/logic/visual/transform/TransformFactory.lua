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
-- package org.allbinary.logic.visual.transform

local TransformFactory = {}
package.loaded["org.allbinary.logic.visual.transform.TransformFactory"] = TransformFactory

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
local TransformInfoEntity = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntity")
local TransformInfoEntityBuilder = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoHttpFactory = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpFactory")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectFactory = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoObjectFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInterface = java_lazy("org.allbinary.logic.visual.transform.TransformInterface")

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

-- class table TransformFactory is declared before the requires
TransformFactory.__index = TransformFactory
TransformFactory.className = "TransformFactory"
TransformFactory.javaClassName = "org.allbinary.logic.visual.transform.TransformFactory"

function TransformFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function TransformFactory.getInstance()
        return TransformFactory.instance_f
end
TransformFactory.getInstance__static = TransformFactory.getInstance


function TransformFactory._jinit(self)
    TransformFactory._init_fields(self)
    return self
end

function TransformFactory.new(...)
    local self = setmetatable({}, TransformFactory)
    TransformFactory._jinit(self, ...)
    return self
end


-- throws Exception
function TransformFactory:getInstance_j3_1(abeClientInformation, viewName, ownerTransformInfoInterface)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(require("allbinary_java").to_string("Creating Transform: ") .. require("allbinary_java").to_string(viewName), self, self.commonStrings.GET_INSTANCE)
            end
            local ownerTransformInfoHttpInterface = ownerTransformInfoInterface
            local transformInfoEntity = TransformInfoEntityBuilder.getInstance()
            local transformInfoInterface = transformInfoEntity:get(viewName, ownerTransformInfoHttpInterface:getPropertiesHashMap(), ownerTransformInfoHttpInterface:getPageContext())
            if rawequal(transformInfoInterface, nil) then
                error(require("java.lang.Exception").new(require("allbinary_java").to_string("No Such View In DB: ") .. require("allbinary_java").to_string(viewName)), 0)
            end
            transformInfoInterface:setChild()
            local anyType = TransformInfoObjectFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(require("allbinary_java").to_string("Created Transform: ") .. require("allbinary_java").to_string(viewName), self, self.commonStrings.GET_INSTANCE)
            end
            do return "__jreturn", anyType end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function TransformFactory:getInstance_j3_2(abeClientInformation, propertiesHashMap, pageContext)
        local try_ok, try_error, try_value = pcall(function()
            local transformInfoData = TransformInfoData.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(require("allbinary_java").to_string("Creating Transform: ") .. require("allbinary_java").to_string(propertiesHashMap:get(transformInfoData.NAME)), self, self.commonStrings.GET_INSTANCE)
            end
            local transformInfoEntity = TransformInfoEntityBuilder.getInstance()
            local transformInfoInterface = transformInfoEntity:get(propertiesHashMap:get(transformInfoData.NAME), propertiesHashMap, pageContext)
            if not rawequal(transformInfoInterface, nil) then
                transformInfoInterface:override(propertiesHashMap)
            else
                transformInfoInterface = TransformInfoHttpFactory.getInstance(propertiesHashMap, pageContext)
            end
            local anyType = TransformInfoObjectFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(require("allbinary_java").to_string("Created Transform: ") .. require("allbinary_java").to_string(propertiesHashMap:get(transformInfoData.NAME)), self, self.commonStrings.GET_INSTANCE)
            end
            do return "__jreturn", anyType end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Failed To Get Instance: ")
                stringBuffer:append(propertiesHashMap:get(TransformInfoData.getInstance().NAME))
                stringBuffer:append("->TransformFactory")
                self.logUtil:put(tostring(stringBuffer), self, self.commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function TransformFactory:getInstance_j2(abeClientInformation, transformInfoInterface)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(require("allbinary_java").to_string("Creating Transform: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "getInstance(TransformInfoInterface)")
            end
            local anyType = TransformInfoObjectFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(require("allbinary_java").to_string("Created Transform: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "getInstance(TransformInfoInterface)")
            end
            do return "__jreturn", anyType end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(TransformInfoInterface)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function TransformFactory:getInstance(...)
    local count = select("#", ...)
    if count == 3 then return self:getInstance_j3(...) end
    if count == 2 then return self:getInstance_j2(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
TransformFactory.getInstance__jdispatcher = TransformFactory.getInstance
function TransformFactory:getInstance_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "TransformInfoInterface")) then return TransformFactory.getInstance_j3_1(self, ...) end
    return TransformFactory.getInstance_j3_2(self, ...)
end
TransformFactory.getInstance__instance = TransformFactory.getInstance
function TransformFactory.getInstance(...)
                
    if select("#", ...) == 0 then return TransformFactory.getInstance__static() end
                
    return TransformFactory.getInstance__instance(...)
                
end

TransformFactory.instance_f = TransformFactory.new()

return TransformFactory

