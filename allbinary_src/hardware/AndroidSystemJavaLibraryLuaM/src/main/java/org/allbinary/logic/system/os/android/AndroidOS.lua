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
-- package org.allbinary.logic.system.os.android

local AndroidOS = {}
package.loaded["org.allbinary.logic.system.os.android.AndroidOS"] = AndroidOS

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

local AndroidInfoFactory = java_lazy("org.allbinary.android.AndroidInfoFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local AndroidSystemProperties = java_lazy("org.allbinary.logic.system.os.android.AndroidSystemProperties")

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

-- class table AndroidOS is declared before the requires
AndroidOS.__index = AndroidOS
AndroidOS.className = "AndroidOS"
AndroidOS.javaClassName = "org.allbinary.logic.system.os.android.AndroidOS"
setmetatable(AndroidOS, {__index = GenericOperatingSystem})

function AndroidOS:_init_fields()
    self.stringBuffer = StringMaker.new()
    self.DEVICE_ID = "DeviceId"
    self.DEVICE_SOFTWARE_VERSION = "DeviceSoftwareVersion"
    self.LINE_1_NUMBER = "Line1Number"
    self.OUYA = "ouya"
end


function AndroidOS._jinit(self)
    java_super_init(GenericOperatingSystem, self)
    AndroidOS._init_fields(self)
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION > 10 then
            self.scalable = true
        end
        local properties = AndroidSystemProperties.getInstance()
        local commonStrings = CommonSeps.getInstance()
        self.stringBuffer:append(self.DEVICE_ID)
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getDeviceId())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append(self.DEVICE_SOFTWARE_VERSION)
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getDeviceSoftwareVersion())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append(self.LINE_1_NUMBER)
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getLine1Number())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkCountryIso")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getNetworkCountryIso())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkOperator")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getNetworkOperator())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkOperatorName")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getNetworkOperatorName())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkType")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:appendint(java_int(properties:getNetworkType()))
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("PhoneType")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:appendint(java_int(properties:getPhoneType()))
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimCountryIso")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimCountryIso())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimOperator")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimOperator())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimOperatorName")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimOperatorName())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimSerialNumber")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimSerialNumber())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SubscriberId")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSubscriberId())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("VoiceMailAlphaTag")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getVoiceMailAlphaTag())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("VoiceMailNumber")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getVoiceMailNumber())
        self.stringBuffer:append(commonStrings.SPACE)
    return self
end

function AndroidOS.new(...)
    local self = setmetatable({}, AndroidOS)
    AndroidOS._jinit(self, ...)
    return self
end


function AndroidOS:isOverScan()
        local properties = AndroidSystemProperties.getInstance()
        if ((string.find(properties:getDevice():toLowerCase(), self.OUYA, 1, true) or 0) - 1) >= 0 then
            return true
        end
        return false
end
java_overload(AndroidOS, "isOverScan", 0)


function AndroidOS:getOverScanXPercent()
        return 90
end
java_overload(AndroidOS, "getOverScanXPercent", 0)


function AndroidOS:getOverScanYPercent()
        return 90
end
java_overload(AndroidOS, "getOverScanYPercent", 0)


function AndroidOS:toString()
        local osBuffer = StringMaker.new()
        osBuffer:append(tostring(GenericOperatingSystem))
        osBuffer:append(CommonSeps.getInstance().SPACE)
        osBuffer:append("Other System Info: \n")
        osBuffer:append(tostring(self.stringBuffer))
        return tostring(osBuffer)
end
java_overload(AndroidOS, "toString", 0)
AndroidOS.__tostring = function(self) return self:toString() end

return AndroidOS

