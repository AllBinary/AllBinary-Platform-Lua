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
-- package org.allbinary.input.motion.gesture.configuration

local CompleteMotionGestureInputEvent = require("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local MotionGestureToMotionGestureActionAssociation = require("org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MotionGestureConfiguration = {}
MotionGestureConfiguration.__index = MotionGestureConfiguration
MotionGestureConfiguration.className = "MotionGestureConfiguration"

function MotionGestureConfiguration:_init_fields()
    self.diagonalMotionGestureAllowed = true
    self.diagonalTolerance = 7
    self.minimumMotionGesture = 9
    self.button = StringUtil.getInstance().EMPTY_STRING
    self.color = BasicColorFactory.getInstance().BLUE
    self.executingActions = true
    self.mouseButtonMask = 0
    self.activeCommands = BasicArrayListD.new()
end


function MotionGestureConfiguration.new()
    local self = setmetatable({}, MotionGestureConfiguration)
    self:_init_fields()
    return self
end


function MotionGestureConfiguration:addMotionGestureAction(list, commandAction)
        self.activeCommands:add(MotionGestureToMotionGestureActionAssociation.new(list, commandAction))
end


function MotionGestureConfiguration:clearMotionGestureAction()
        self.activeCommands:clear()
end


function MotionGestureConfiguration:getAssociateCommandActionsList()
        return self.activeCommands
end


function MotionGestureConfiguration:isDiagonalMotionGestureAllowed()
        return self.diagonalMotionGestureAllowed
end


function MotionGestureConfiguration:isExecutingActionsAllowed()
        return self.executingActions
end


function MotionGestureConfiguration:setExecutingActionsAllowed(executingActionAllowed)
        self.executingActions = executingActionAllowed
end


function MotionGestureConfiguration:setDiagonalMotionGestureAllowed(diagonalMotionGestureAllowed)
        self.diagonalMotionGestureAllowed = diagonalMotionGestureAllowed
end


function MotionGestureConfiguration:getDiagonalTolerance()
        return self.diagonalTolerance
end


function MotionGestureConfiguration:setDiagonalTolerance(diagonalTolerance)
        self.diagonalTolerance = diagonalTolerance
end


function MotionGestureConfiguration:getMinimumMotionGesture()
        return self.minimumMotionGesture
end


function MotionGestureConfiguration:setMinimumMotionGesture(minimumMotionGesture)
        self.minimumMotionGesture = minimumMotionGesture
end


function MotionGestureConfiguration:getButton()
        return self.button
end


function MotionGestureConfiguration:setButton(button)
        self.button = button
end


function MotionGestureConfiguration:getColor()
        return self.color
end


function MotionGestureConfiguration:setColor(color)
        self.color = color
end


function MotionGestureConfiguration:getMouseButtonMask()
        return self.mouseButtonMask
end


function MotionGestureConfiguration:setMouseButtonMask(mouseButtonMask)
        self.mouseButtonMask = mouseButtonMask
end

return MotionGestureConfiguration

