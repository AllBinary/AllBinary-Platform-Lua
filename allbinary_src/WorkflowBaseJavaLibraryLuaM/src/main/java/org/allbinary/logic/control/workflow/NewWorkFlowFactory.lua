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
-- package org.allbinary.logic.control.workflow

local NewWorkFlowFactory = {}
package.loaded["org.allbinary.logic.control.workflow.NewWorkFlowFactory"] = NewWorkFlowFactory

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
local DynamicObjectData = java_lazy("org.allbinary.business.DynamicObjectData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeFactory = java_lazy("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table NewWorkFlowFactory is declared before the requires
NewWorkFlowFactory.__index = NewWorkFlowFactory
NewWorkFlowFactory.className = "NewWorkFlowFactory"
NewWorkFlowFactory.javaClassName = "org.allbinary.logic.control.workflow.NewWorkFlowFactory"

function NewWorkFlowFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function NewWorkFlowFactory.getInstance()
        return NewWorkFlowFactory.instance_f
end


function NewWorkFlowFactory._jinit(self)
    NewWorkFlowFactory._init_fields(self)
    return self
end

function NewWorkFlowFactory.new(...)
    local self = setmetatable({}, NewWorkFlowFactory)
    NewWorkFlowFactory._jinit(self, ...)
    return self
end


-- throws Exception, LicensingException
function NewWorkFlowFactory:getInstance_j3(abeClientInformation, hashMap, pageContext)
        local try_ok, try_error, try_value = pcall(function()
            local className = hashMap:get(DynamicObjectData.NAME)
            local params = java_new_array(nil, 2)
            local classes = java_new_array(nil, 2)
            classes[1] = getmetatable(hashMap)
            classes[2] = AbeFactory.getInstance():getClass(abeClientInformation, "javax.servlet.jsp.PageContext")
            params[1] = hashMap
            params[2] = pageContext
            local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, className, classes, params)
            do return "__jreturn", WorkFlowWrapper.new(anyType) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getInstance(HashMap)", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception, LicensingException
function NewWorkFlowFactory:getInstance_j2(abeClientInformation, className)
        local try_ok, try_error, try_value = pcall(function()
            local stringUtil = StringUtil.getInstance()
            if className ~= nil and ((className < stringUtil.EMPTY_STRING and -1) or (className > stringUtil.EMPTY_STRING and 1) or 0) ~= 0 then
                local anyType = AbeFactory.getInstance():getInstance(abeClientInformation, className, nil, nil)
                do return "__jreturn", WorkFlowWrapper.new(anyType) end
            else
                error(require("java.lang.Exception").new("No WorkFlow ClassName"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function NewWorkFlowFactory:getInstance(...)
    local count = select("#", ...)
    if count == 3 then return self:getInstance_j3(...) end
    if count == 2 then return self:getInstance_j2(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
NewWorkFlowFactory.getInstance__jdispatcher = NewWorkFlowFactory.getInstance

NewWorkFlowFactory.instance_f = NewWorkFlowFactory.new()

return NewWorkFlowFactory

