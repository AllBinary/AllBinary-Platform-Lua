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
-- package org.allbinary.logic.system.hardware

local HardwareFactory = {}
package.loaded["org.allbinary.logic.system.hardware.HardwareFactory"] = HardwareFactory

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AndroidHardware = java_lazy("org.allbinary.logic.system.hardware.android.AndroidHardware")
local GenericOperatingSystem = java_lazy("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystems = java_lazy("org.allbinary.logic.system.os.OperatingSystems")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local HardwareInterface = java_lazy("org.allbinary.logic.system.hardware.HardwareInterface")
local NoHardware = java_lazy("org.allbinary.logic.system.hardware.NoHardware")

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

-- class table HardwareFactory is declared before the requires
HardwareFactory.__index = HardwareFactory
HardwareFactory.className = "HardwareFactory"
HardwareFactory.javaClassName = "org.allbinary.logic.system.hardware.HardwareFactory"

function HardwareFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
end


function HardwareFactory.getInstance()
        return HardwareFactory.instance_f
end


function HardwareFactory._jinit(self)
    HardwareFactory._init_fields(self)
    return self
end

function HardwareFactory.new(...)
    local self = setmetatable({}, HardwareFactory)
    HardwareFactory._jinit(self, ...)
    return self
end


-- throws Exception
function HardwareFactory:getInstance(os)
        local try_ok, try_error, try_value = pcall(function()
            local operatingSystems = OperatingSystems.getInstance()
            if self.tsUtil:compareTo(os:getName(), operatingSystems.ANDROID) == 0 then
                do return "__jreturn", AndroidHardware.new() end
            elseif self.tsUtil:compareTo(os:getName(), operatingSystems.HARMONY) == 0 then
                do return "__jreturn", AndroidHardware.new() end
            end
            error(require("java.lang.Exception").new("No Hardware Imp for: " .. os:getName()), 0)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put("Ignoring Exception Returning NoHardware", self, commonStrings.GET_INSTANCE, e)
            return NoHardware.new()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

HardwareFactory.instance_f = HardwareFactory.new()

return HardwareFactory

