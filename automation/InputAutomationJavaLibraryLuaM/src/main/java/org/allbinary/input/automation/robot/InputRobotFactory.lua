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

-- local GraphicsDevice = require("java.awt.GraphicsDevice")
-- local GraphicsEnvironment = require("java.awt.GraphicsEnvironment")
-- local Collection = require("java.util.Collection")
-- local Iterator = require("java.util.Iterator")
-- local Set = require("java.util.Set")
-- local HelpSet = require("javax.help.HelpSet")
-- local HelpSetEvent = require("javax.help.event.HelpSetEvent")
-- local HelpSetListener = require("javax.help.event.HelpSetListener")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local JavaHelpSetNotifier = require("org.allbinary.logic.java.help.JavaHelpSetNotifier")
local InterfaceUtil = require("org.allbinary.logic.java.anyType.InterfaceUtil")
local SecuredNativeLibraryInterface = require("org.allbinary.logic.system.loader.SecuredNativeLibraryInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputRobotFactory = {}
InputRobotFactory.__index = InputRobotFactory
InputRobotFactory.className = "InputRobotFactory"

function InputRobotFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.helpSetListenerInterface = nil
end


-- throws Exception
function InputRobotFactory.getInstance()
        return InputRobotFactory.inputRobotFactory
end


function InputRobotFactory.new()
    local self = setmetatable({}, InputRobotFactory)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            local graphenv = GraphicsEnvironment.getLocalGraphicsEnvironment()
            local screens = graphenv:getScreenDevices()
            local inputRobotInterface = nil
            for i = 0, (screens.n or #screens) - 1 do
                inputRobotInterface = InputRobot.new(screens[i + 1])
                self.logUtil:putF("Adding Robot: " .. inputRobotInterface:getName(), self, "getRobots")
                self:get():put(inputRobotInterface:getName(), inputRobotInterface)
            end
            self.logUtil:putF("Number Of Robots: " .. tostring(self.hashtable:size()), self, "getRobots")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function InputRobotFactory:addListener(helpSetListenerInterface)
        self.helpSetListenerInterface = helpSetListenerInterface
end


-- throws Exception
function InputRobotFactory:add(inputRobotInterface)
        self.logUtil:putF("Adding InputRobotInterface: " .. inputRobotInterface:getName(), self, "add")
        self:get():put(inputRobotInterface:getName(), inputRobotInterface)
        local helpSet = inputRobotInterface:getHelpSet()
        if self.helpSetListenerInterface ~= nil then
            if helpSet ~= nil then
                if not JavaHelpSetNotifier.isNotified(helpSet) then
                    local helpSetEvent = HelpSetEvent.new(self, helpSet, HelpSetEvent.HELPSET_ADDED)
                    self.helpSetListenerInterface:helpSetAdded(helpSetEvent)
                end
            else
                self.logUtil:putF("Null HelpSet For: " .. inputRobotInterface:getName(), self, "add")
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
-- Java overloaded method: Lua keeps the last definition
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
            logUtil:putF("Loading Library: " .. inputRobotInterface:getName(), "InputRobotFactory", "loadLibraries")
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
                self.logUtil:putF("Unloading Library: " .. inputRobotInterface:getName(), self, "unloadLibraries")
                local securedNativeLibraryInterface = inputRobotInterface
                securedNativeLibraryInterface:unload()
            end
        end
end


-- throws Exception
function InputRobotFactory:get()
        return self.hashtable
end


-- Java overloaded method: Lua keeps the last definition
function InputRobotFactory:get(name)
        self.logUtil:putF("Getting Robot: " .. name, self, "getRobots")
        return self.hashtable:get(name)
end

InputRobotFactory.inputRobotFactory = InputRobotFactory.new()

return InputRobotFactory

