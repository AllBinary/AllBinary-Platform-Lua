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
-- package org.allbinary.logic.system.hardware.android

local AndroidHardware = {}
package.loaded["org.allbinary.logic.system.hardware.android.AndroidHardware"] = AndroidHardware

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

-- local Closeable = require("java.io.Closeable")
-- local FileReader = require("java.io.FileReader")
-- local LineNumberReader = require("java.io.LineNumberReader")
local NullCloseable = java_lazy("org.allbinary.logic.io.NullCloseable")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local HardwareInterface = java_lazy("org.allbinary.logic.system.hardware.HardwareInterface")
local UnknownHardware = java_lazy("org.allbinary.logic.system.hardware.components.android.UnknownHardware")
local HardwareComponentInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table AndroidHardware is declared before the requires
AndroidHardware.__index = AndroidHardware
AndroidHardware.className = "AndroidHardware"
AndroidHardware.javaClassName = "org.allbinary.logic.system.hardware.android.AndroidHardware"
AndroidHardware.java_implements = " HardwareInterface "
AndroidHardware.java_interfaces = function() return {HardwareInterface} end

function AndroidHardware:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.componentInterfaceVector = BasicArrayListD.new()
    self.PROC_BUS_INPUT_DIRECTORY = "/proc/bus/input/"
    self.DEVICES = self.PROC_BUS_INPUT_DIRECTORY .. "devices/"
    self.MINHARDWARE = 3
end


function AndroidHardware._jinit(self)
    AndroidHardware._init_fields(self)
        self:init(self.DEVICES)
        local size = self.componentInterfaceVector:size()
        if size < self.MINHARDWARE then
            error(require("java.lang.Exception").new("Not Enough Data For A Valid License On Linux"), 0)
        end
    return self
end

function AndroidHardware.new(...)
    local self = setmetatable({}, AndroidHardware)
    AndroidHardware._jinit(self, ...)
    return self
end


-- throws Exception
function AndroidHardware:init(filePath)
        local lineNumberReader = NullCloseable.NULL_CLOSEABLE
        local try_ok, try_error, try_value = pcall(function()
            lineNumberReader = self:get(filePath)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("Hardware Data: " .. tostring(self), self, self.commonStrings.INIT, e)
            error(e, 0)
        end
        do -- finally
            if lineNumberReader ~= nil then
                lineNumberReader:close()
            end
        end
end


-- throws Exception
function AndroidHardware:get(filePath)
        self.componentInterfaceVector = BasicArrayListD.new()
        local pciFile = FileReader.new(filePath)
        local lineNumberReader = LineNumberReader.new(pciFile)
        self.logUtil:putF("File Found", self, self.commonStrings.CONSTRUCTOR)
        local nextLine = lineNumberReader:readLine()
        while nextLine ~= nil do
            nextLine = lineNumberReader:readLine()
            self.componentInterfaceVector:add(UnknownHardware.new(nextLine))
        end
        return lineNumberReader
end


function AndroidHardware:getComponent(index)
        return self.componentInterfaceVector:get(index)
end


function AndroidHardware:toString()
        local stringBuilder = StringMaker.new()
        local size = self.componentInterfaceVector:size()
        for index = 0, size - 1 do
            local componentInterface = self.componentInterfaceVector:get(index)
            stringBuilder:append(tostring(componentInterface))
            stringBuilder:append(CommonSeps.getInstance().NEW_LINE)
        end
        return tostring(stringBuilder)
end
AndroidHardware.__tostring = function(self) return self:toString() end


function AndroidHardware:compareTo(hardwareInterface)
        return true
end


function AndroidHardware:difference(hardwareInterface)
        return StdUtil.getInstance().NULL_TABLE
end

return AndroidHardware

