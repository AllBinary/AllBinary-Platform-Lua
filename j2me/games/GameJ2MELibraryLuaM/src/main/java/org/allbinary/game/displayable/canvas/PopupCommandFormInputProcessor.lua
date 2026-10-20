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
-- package org.allbinary.game.displayable.canvas

local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local MotionGestureEvent = require("org.allbinary.input.motion.gesture.observer.MotionGestureEvent")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local CommandFormInputProcessor = require("org.allbinary.game.displayable.canvas.CommandFormInputProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PopupCommandFormInputProcessor = {}
PopupCommandFormInputProcessor.__index = PopupCommandFormInputProcessor
PopupCommandFormInputProcessor.className = "PopupCommandFormInputProcessor"
setmetatable(PopupCommandFormInputProcessor, {__index = CommandFormInputProcessor})


function PopupCommandFormInputProcessor.new(gameKeyEventList, playerInputId, gameCanvas, form, popupMenuInputProcessor)
    local self = setmetatable(CommandFormInputProcessor.new(gameKeyEventList, playerInputId, gameCanvas, form), PopupCommandFormInputProcessor)
        -- super(...) made self above
    return self
end


-- throws Exception
function PopupCommandFormInputProcessor:processInput(key)
        return CommandFormInputProcessor.processInput(self, key)
end


-- throws Exception
function PopupCommandFormInputProcessor:processMotionInput(motionGestureEvent)
        CommandFormInputProcessor.processMotionInput(self, motionGestureEvent)
end

return PopupCommandFormInputProcessor

