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

-- local Dimension = require("java.awt.Dimension")
-- local Rectangle = require("java.awt.Rectangle")
-- local Toolkit = require("java.awt.Toolkit")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScreenScavangerRobot = {}
ScreenScavangerRobot.__index = ScreenScavangerRobot
ScreenScavangerRobot.className = "ScreenScavangerRobot"

function ScreenScavangerRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function ScreenScavangerRobot.new()
    local self = setmetatable({}, ScreenScavangerRobot)
    self:_init_fields()
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

