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
-- package org.allbinary.graphics.displayable

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local NullCommandListener = require("javax.microedition.lcdui.NullCommandListener")
local MyCommandInterface = require("org.allbinary.graphics.displayable.command.MyCommandInterface")
local MyCommandsFactory = require("org.allbinary.graphics.displayable.command.MyCommandsFactory")
local TouchJ2ME = require("org.allbinary.input.TouchJ2ME")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Sound = require("org.allbinary.media.audio.Sound")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABStack = require("org.allbinary.util.ABStack")
local DisplayableInterface = require("org.allbinary.graphics.displayable.DisplayableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyCanvas = {}
MyCanvas.__index = MyCanvas
MyCanvas.className = "MyCanvas"
setmetatable(MyCanvas, {__index = Canvas})

function MyCanvas:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.canvasStrings = CanvasStrings.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.name = nil
    self.childNameList = nil
    self.commandStack = nil
    self.commandListener = NullCommandListener.NULL_COMMAND_LISTENER
    self.paused = false
    self.touchME = TouchJ2ME.new()
end


function MyCanvas.new(name, childNameList)
    local self = setmetatable(Canvas.new(), MyCanvas)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        self.displayInfo:update(self, self.canvasStrings.CONSTRUCTOR)
        self.name = name
        self.childNameList = childNameList
        self.commandStack = StdUtil.getInstance():createStack()
    return self
end


function MyCanvas:setFullScreenMode(mode)
        Canvas.setFullScreenMode(self, mode)
        self.displayInfo:update(self, self.canvasStrings.SET_FULL_SCREEN_MODE)
end


function MyCanvas:sizeChanged(w, h)
        self.displayInfo:update(self, self.canvasStrings.SIZE_CHANGED)
end


function MyCanvas:getCommandStack()
        return self.commandStack
end


function MyCanvas:isCommand(command)
        return self.commandStack:contains(command)
end


function MyCanvas:addCommand(command)
        if not self.commandStack:contains(command) then
            self.commandStack:push(command)
            Canvas.addCommand(self, command)
        end
end


function MyCanvas:removeCommand(command)
        self.commandStack:removeElement(command)
        Canvas.removeCommand(self, command)
end


function MyCanvas:removeAllCommands()
        local size = self.commandStack:size()
        for index = 0, size - 1 do
            Canvas.removeCommand(self, self.commandStack:pop())
        end
end


function MyCanvas:setCommandListener(l)
        Canvas.setCommandListener(self, l)
        self.commandListener = l
end


function MyCanvas:getCustomCommandListener()
        return self.commandListener
end


function MyCanvas:isPaused()
        return self.paused
end


function MyCanvas:removePauseCommand()
        self:removeCommand(MyCommandsFactory.getInstance().PAUSE_COMMAND)
end


function MyCanvas:pause()
        self.logUtil:putF(self.commonStrings.START, self, self.canvasStrings.PAUSE)
        self:removePauseCommand()
        self:addCommand(MyCommandsFactory.getInstance().RESUME_COMMAND)
        self:setPaused(true)
end


function MyCanvas:unPause()
        self.logUtil:putF(self.commonStrings.START, self, self.canvasStrings.UN_PAUSE)
        self:removeCommand(MyCommandsFactory.getInstance().RESUME_COMMAND)
        self:addCommand(MyCommandsFactory.getInstance().PAUSE_COMMAND)
        self:setPaused(false)
end


-- throws Exception
function MyCanvas:process()
        self.displayInfo:process()
end


function MyCanvas:paint(graphics)
end


function MyCanvas:draw(graphics)
end


function MyCanvas:hasChild(displayable)
        return self.childNameList:contains(displayable.name)
end


function MyCanvas:destroy()
        self.logUtil:putF("Destroyed MyCanvas", self, "destroy")
end


function MyCanvas:setPaused(isPaused)
        self.paused = isPaused
end


function MyCanvas:keyPressedByDevice(keyCode, deviceId)
end


function MyCanvas:keyRepeatedByDevice(keyCode, deviceId)
end


function MyCanvas:keyReleasedByDevice(keyCode, deviceId)
end


function MyCanvas:pointerDragged(x, y)
        self.touchME:pointerDragged(x, y)
end


function MyCanvas:pointerPressed(x, y)
        self.touchME:pointerPressed(x, y)
end


function MyCanvas:pointerReleased(x, y)
        self.touchME:pointerReleased(x, y)
end


function MyCanvas:nextSong(nextSongSound, leftVolume, rightVolume)
end

return MyCanvas

