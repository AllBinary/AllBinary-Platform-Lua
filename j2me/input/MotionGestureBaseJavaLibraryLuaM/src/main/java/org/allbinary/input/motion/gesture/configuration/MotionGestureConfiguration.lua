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

local MotionGestureConfiguration = {}
package.loaded["org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration"] = MotionGestureConfiguration

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

local CompleteMotionGestureInputEvent = java_lazy("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local MotionGestureToMotionGestureActionAssociation = java_lazy("org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table MotionGestureConfiguration is declared before the requires
MotionGestureConfiguration.__index = MotionGestureConfiguration
MotionGestureConfiguration.className = "MotionGestureConfiguration"
MotionGestureConfiguration.javaClassName = "org.allbinary.input.motion.gesture.configuration.MotionGestureConfiguration"

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


function MotionGestureConfiguration._jinit(self)
    MotionGestureConfiguration._init_fields(self)
    return self
end

function MotionGestureConfiguration.new(...)
    local self = setmetatable({}, MotionGestureConfiguration)
    MotionGestureConfiguration._jinit(self, ...)
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

