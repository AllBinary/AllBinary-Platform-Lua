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
-- package org.allbinary.midlet

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Display = require("javax.microedition.lcdui.Display")
-- local Displayable = require("javax.microedition.lcdui.Displayable")
-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
-- local MIDlet = require("javax.microedition.midlet.MIDlet")
-- local MIDletStateChangeException = require("javax.microedition.midlet.MIDletStateChangeException")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Memory = require("org.allbinary.system.Memory")
local NullUtil = require("org.allbinary.logic.NullUtil")
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

local AllBinaryMidlet = {}
AllBinaryMidlet.__index = AllBinaryMidlet
AllBinaryMidlet.className = "AllBinaryMidlet"
setmetatable(AllBinaryMidlet, {__index = MIDlet})

function AllBinaryMidlet:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.SET_DISPLAY = "setDisplay"
    self.SETTING_ = "Setting: "
    self._DISPLAY_ = " Display: "
    self.SETTING_NO_TITLE = "Setting: No Title, Display: "
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.midletDestroyed = false
end


function AllBinaryMidlet.getNullInstance()
        if AllBinaryMidlet.NULL_ALLBINARY_MIDLET == NullUtil.getInstance().NULL_OBJECT then
            AllBinaryMidlet.NULL_ALLBINARY_MIDLET = AllBinaryMidlet.new()
        end
        return AllBinaryMidlet.NULL_ALLBINARY_MIDLET
end


function AllBinaryMidlet.new()
    local self = setmetatable(MIDlet.new(), AllBinaryMidlet)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, "AllBinaryMidlet::AllBinaryMidlet")
    return self
end


function AllBinaryMidlet:setDisplay(newDisplay)
        local title = StringUtil.getInstance().EMPTY_STRING
        if newDisplay ~= NullCanvas.NULL_CANVAS then
            title = newDisplay:getTitle()
            if title ~= nil then
                self.logUtil:putF(tostring(StringMaker.new():append(self.SETTING_):append(title):append(self._DISPLAY_):append(StringUtil.getInstance():toString(newDisplay))), self, self.SET_DISPLAY)
            else
                self.logUtil:putF(tostring(StringMaker.new():append(self.SETTING_NO_TITLE):append(StringUtil.getInstance():toString(newDisplay))), self, self.SET_DISPLAY)
            end
        end
        local display = self:getDisplay()
        display:setCurrent(newDisplay)
end


function AllBinaryMidlet:getDisplay()
        return Display.getDisplay(self)
end


function AllBinaryMidlet:getCurrentDisplayable()
        return Display.getDisplay(self):getCurrent()
end


function AllBinaryMidlet:setDestroyed(destroyed)
        self.midletDestroyed = destroyed
end


function AllBinaryMidlet:isDestroyed()
        return self.midletDestroyed
end


-- throws MIDletStateChangeException
function AllBinaryMidlet:startApp()
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function AllBinaryMidlet:pauseApp()
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function AllBinaryMidlet:destroyAppInRunnable(unconditional, isProgress)
end


function AllBinaryMidlet:destroyApp(unconditional)
        local METHOD_NAME = "AllBinaryMidlet::destroyApp"
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, METHOD_NAME)
            PreLogUtil.put(Memory.getInfo(), self, METHOD_NAME)
            self:setDestroyed(true)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, METHOD_NAME, e)
        end
end


-- throws Exception
function AllBinaryMidlet:setStartStateHashtable(hashtable)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(StringUtil.getInstance():toString(hashtable))), self, "setStartStateHashtable")
        self.hashtable = hashtable
end


-- throws Exception
function AllBinaryMidlet:getStartStateHashtable()
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(StringUtil.getInstance():toString(self.hashtable))), self, "getStartStateHashtable")
        return self.hashtable
end


-- throws Exception
function AllBinaryMidlet:getCurrentStateHashtable()
        self.logUtil:putF(self.commonStrings.START, self, "getStateHashtable")
        return StdUtil.getInstance().NULL_TABLE
end


function AllBinaryMidlet:commandAction(command, displayable)
end

AllBinaryMidlet.NULL_ALLBINARY_MIDLET = NullUtil.getInstance().NULL_OBJECT

return AllBinaryMidlet

