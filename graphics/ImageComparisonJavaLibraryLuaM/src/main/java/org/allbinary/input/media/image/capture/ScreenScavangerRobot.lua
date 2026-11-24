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
-- package org.allbinary.input.media.image.capture

local ScreenScavangerRobot = {}
package.loaded["org.allbinary.input.media.image.capture.ScreenScavangerRobot"] = ScreenScavangerRobot

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

-- local Dimension = require("java.awt.Dimension")
-- local Rectangle = require("java.awt.Rectangle")
-- local Toolkit = require("java.awt.Toolkit")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local InputRobotFactory = java_lazy("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = java_lazy("org.allbinary.input.automation.robot.InputRobotInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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

-- class table ScreenScavangerRobot is declared before the requires
ScreenScavangerRobot.__index = ScreenScavangerRobot
ScreenScavangerRobot.className = "ScreenScavangerRobot"
ScreenScavangerRobot.javaClassName = "org.allbinary.input.media.image.capture.ScreenScavangerRobot"

function ScreenScavangerRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function ScreenScavangerRobot._jinit(self)
    ScreenScavangerRobot._init_fields(self)
    return self
end

function ScreenScavangerRobot.new(...)
    local self = setmetatable({}, ScreenScavangerRobot)
    ScreenScavangerRobot._jinit(self, ...)
    return self
end


-- throws Exception
function ScreenScavangerRobot:getScreenAsBufferedImages()
        self.logUtil:putF(self.commonStrings.START, self, "getScreenAsBufferedImages")
        local dimScreenSize = Toolkit.getDefaultToolkit():getScreenSize()
        local rectScreenSize = Rectangle.new(dimScreenSize)
        local robotHashtable = InputRobotFactory.getInstance():get()
        local bufferedImageArray = java_new_array(nil, 1)
        local index = 0
        local inputRobotInterface = robotHashtable:get("Java Robot")
        bufferedImageArray[index + 1] = inputRobotInterface:createScreenCapture(rectScreenSize)
        self.logUtil:putF("Finish", self, "getScreenAsBufferedImages")
        return bufferedImageArray
end

return ScreenScavangerRobot

