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
-- package org.allbinary.input.automation.actions.script

-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local swing = require("javax.swing")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Node = require("org.w3c.dom.Node")
local ProfileActionScriptItemInterface = require("org.allbinary.input.automation.actions.script.ProfileActionScriptItemInterface")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProfileActionScriptItem = {}
ProfileActionScriptItem.__index = ProfileActionScriptItem
ProfileActionScriptItem.className = "ProfileActionScriptItem"
setmetatable(ProfileActionScriptItem, {__index = DefaultMutableTreeNode})

function ProfileActionScriptItem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.jPopupMenu = nil
end

function ProfileActionScriptItem.new(...)
    local count = select("#", ...)
    if count == 2 then return ProfileActionScriptItem._new2(...)
    elseif count == 1 then return ProfileActionScriptItem._new1(...)
    end
end


function ProfileActionScriptItem._new2(label, node)
    local self = setmetatable(DefaultMutableTreeNode.new(label), ProfileActionScriptItem)
    self:_init_fields()
        -- super(...) made self above
        self:init()
        self.logUtil:putF("Label: " .. label, self, self.commonStrings.CONSTRUCTOR)
    return self
end


function ProfileActionScriptItem._new1(label)
    local self = setmetatable(DefaultMutableTreeNode.new(label), ProfileActionScriptItem)
    self:_init_fields()
        -- super(...) made self above
        self:init()
        self.logUtil:putF("Label: " .. label, self, self.commonStrings.CONSTRUCTOR)
    return self
end


function ProfileActionScriptItem:init()
        self:setJPopupMenu(JPopupMenu.new())
        local jMenuItemEdit = JMenuItem.new(ProfileActionScriptItem.EDIT)
        local jMenuItemDelete = JMenuItem.new(ProfileActionScriptItem.DELETE)
        jMenuItemEdit:addActionListener(self)
        jMenuItemDelete:addActionListener(self)
        self:getJPopupMenu():add(jMenuItemEdit)
        self:getJPopupMenu():add(jMenuItemDelete)
end


-- throws Exception
function ProfileActionScriptItem:process(frame)
        error(java_exception("RuntimeException"), 0)
end


function ProfileActionScriptItem:getJPopupMenu()
        return self.jPopupMenu
end


function ProfileActionScriptItem:showDialog()
        error(java_exception("RuntimeException"), 0)
end


function ProfileActionScriptItem:actionPerformed(actionEvent)
        if actionEvent:getActionCommand():compareTo(ProfileActionScriptItem.EDIT) == 0 then
            self:showDialog()
        end
end


function ProfileActionScriptItem:setJPopupMenu(jPopupMenu)
        self.jPopupMenu = jPopupMenu
end

ProfileActionScriptItem.EDIT = "Edit"
ProfileActionScriptItem.DELETE = "Delete"
ProfileActionScriptItem.NEW_CONDITION = "New Condition"
ProfileActionScriptItem.NEW_INPUT = "New Input"
ProfileActionScriptItem.NEW_OUTPUT = "New Output"
ProfileActionScriptItem.NEW_COLOR_AT = "Color At"
ProfileActionScriptItem.NEW_TIME_INTERVAL = "Time Interval"
ProfileActionScriptItem.NEW_ALWAYS = "Always On/Off"
ProfileActionScriptItem.NEW_KEY_INPUT = "Key"
ProfileActionScriptItem.NEW_MOUSE_INPUT = "Mouse"
ProfileActionScriptItem.NEW_JOYSTICK_INPUT = "Joystick"
ProfileActionScriptItem.NEW_IMAGE_OUTPUT = "Image"

return ProfileActionScriptItem

