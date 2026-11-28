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
-- package org.allbinary.input.automation.robot

local InputRobotFactory = {}
package.loaded["org.allbinary.input.automation.robot.InputRobotFactory"] = InputRobotFactory

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

-- local GraphicsDevice = require("java.awt.GraphicsDevice")
-- local GraphicsEnvironment = require("java.awt.GraphicsEnvironment")
-- local Collection = require("java.util.Collection")
local Iterator = java_lazy("java.util.Iterator")
-- local Set = require("java.util.Set")
-- local HelpSet = require("javax.help.HelpSet")
-- local HelpSetEvent = require("javax.help.event.HelpSetEvent")
-- local HelpSetListener = require("javax.help.event.HelpSetListener")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local JavaHelpSetNotifier = java_lazy("org.allbinary.logic.java.help.JavaHelpSetNotifier")
local InterfaceUtil = java_lazy("org.allbinary.logic.java.anyType.InterfaceUtil")
local SecuredNativeLibraryInterface = java_lazy("org.allbinary.logic.system.loader.SecuredNativeLibraryInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local InputRobot = java_lazy("org.allbinary.input.automation.robot.InputRobot")
local InputRobotInterface = java_lazy("org.allbinary.input.automation.robot.InputRobotInterface")

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

-- class table InputRobotFactory is declared before the requires
InputRobotFactory.__index = InputRobotFactory
InputRobotFactory.className = "InputRobotFactory"
InputRobotFactory.javaClassName = "org.allbinary.input.automation.robot.InputRobotFactory"

function InputRobotFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    if self.helpSetListenerInterface == nil then self.helpSetListenerInterface = nil end
end


-- throws Exception
function InputRobotFactory.getInstance()
        return InputRobotFactory.inputRobotFactory
end


function InputRobotFactory._jinit(self)
    InputRobotFactory._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            local graphenv = GraphicsEnvironment.getLocalGraphicsEnvironment()
            local screens = graphenv:getScreenDevices()
            local inputRobotInterface = nil
            for i = 0, (screens.n or #screens) - 1 do
                inputRobotInterface = InputRobot.new(screens[i + 1])
                self.logUtil:putF(require("allbinary_java").to_string("Adding Robot: ") .. require("allbinary_java").to_string(inputRobotInterface:getName()), self, "getRobots")
                self:get():put(inputRobotInterface:getName(), inputRobotInterface)
            end
            self.logUtil:putF(require("allbinary_java").to_string("Number Of Robots: ") .. require("allbinary_java").to_string(self.hashtable:size()), self, "getRobots")
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function InputRobotFactory.new(...)
    local self = setmetatable({}, InputRobotFactory)
    InputRobotFactory._jinit(self, ...)
    return self
end


function InputRobotFactory:addListener(helpSetListenerInterface)
        self.helpSetListenerInterface = helpSetListenerInterface
end


-- throws Exception
function InputRobotFactory:add(inputRobotInterface)
        self.logUtil:putF(require("allbinary_java").to_string("Adding InputRobotInterface: ") .. require("allbinary_java").to_string(inputRobotInterface:getName()), self, "add")
        self:get():put(inputRobotInterface:getName(), inputRobotInterface)
        local helpSet = inputRobotInterface:getHelpSet()
        if not rawequal(self.helpSetListenerInterface, nil) then
            if not rawequal(helpSet, nil) then
                if not (JavaHelpSetNotifier.isNotified(helpSet)) then
                    local helpSetEvent = HelpSetEvent.new(self, helpSet, HelpSetEvent.HELPSET_ADDED)
                    self.helpSetListenerInterface:helpSetAdded(helpSetEvent)
                end
            else
                self.logUtil:putF(require("allbinary_java").to_string("Null HelpSet For: ") .. require("allbinary_java").to_string(inputRobotInterface:getName()), self, "add")
            end
        else
            self.logUtil:putF("No HelpSet Listener", self, "add")
        end
end


-- throws Exception
function InputRobotFactory:loadLibraries()
        local set = self:get():keySet()
        self.logUtil:putF("Loading Libraries", self, "loadLibraries")
        local nameArray = set:toArray()
        local size = (nameArray.n or #nameArray)
        for index = 0, size - 1 do
            local inputRobotInterface = InputRobotFactory.getInstance():get(nameArray[index + 1])
            InputRobotFactory.loadLibrary(inputRobotInterface)
        end
end


-- throws Exception
function InputRobotFactory.loadLibraries(collection)
        local logUtil = LogUtil.getInstance()
        logUtil:putF("Loading Libraries", "InputRobotFactory", "loadLibraries")
        local iterator = collection:iterator()
        while iterator:hasNext() do
            InputRobotFactory.loadLibrary(iterator:next())
        end
end


-- throws Exception
function InputRobotFactory.loadLibrary(inputRobotInterface)
        local logUtil = LogUtil.getInstance()
        if InterfaceUtil.isImplemented(SecuredNativeLibraryInterface, inputRobotInterface) then
            logUtil:putF(require("allbinary_java").to_string("Loading Library: ") .. require("allbinary_java").to_string(inputRobotInterface:getName()), "InputRobotFactory", "loadLibraries")
            local securedNativeLibraryInterface = inputRobotInterface
            securedNativeLibraryInterface:load()
        end
end


-- throws Exception
function InputRobotFactory:unloadLibraries()
        self.logUtil:putF("Unloading Libraries", self, "unloadLibraries")
        local set = self:get():keySet()
        local inputRobotInterface = nil
        local inputRobotArray = set:toArray()
        local size = (inputRobotArray.n or #inputRobotArray)
        for index = 0, size - 1 do
            inputRobotInterface = self:get(inputRobotArray[index + 1])
            if InterfaceUtil.isImplemented(SecuredNativeLibraryInterface, inputRobotInterface) then
                self.logUtil:putF(require("allbinary_java").to_string("Unloading Library: ") .. require("allbinary_java").to_string(inputRobotInterface:getName()), self, "unloadLibraries")
                local securedNativeLibraryInterface = inputRobotInterface
                securedNativeLibraryInterface:unload()
            end
        end
end


-- throws Exception
function InputRobotFactory:get_j0()
        return self.hashtable
end


function InputRobotFactory:get_j1(name)
        self.logUtil:putF(require("allbinary_java").to_string("Getting Robot: ") .. require("allbinary_java").to_string(name), self, "getRobots")
        return self.hashtable:get(name)
end
function InputRobotFactory:get(...)
    local count = select("#", ...)
    if count == 0 then return self:get_j0(...) end
    if count == 1 then return self:get_j1(...) end
    error("No method get takes " .. count .. " arguments")
end
InputRobotFactory.get__jdispatcher = InputRobotFactory.get

InputRobotFactory.inputRobotFactory = InputRobotFactory.new()

return InputRobotFactory

