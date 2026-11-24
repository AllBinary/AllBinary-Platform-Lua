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

local ProfileActionScriptItem = {}
package.loaded["org.allbinary.input.automation.actions.script.ProfileActionScriptItem"] = ProfileActionScriptItem

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

-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local ActionListener = require("java.awt.event.ActionListener")
-- local JPopupMenu = require("javax.swing.JPopupMenu")
-- local JMenuItem = require("javax.swing.JMenuItem")
-- local DefaultMutableTreeNode = require("javax.swing.tree.DefaultMutableTreeNode")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Node = java_lazy("org.w3c.dom.Node")
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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table ProfileActionScriptItem is declared before the requires
ProfileActionScriptItem.__index = ProfileActionScriptItem
ProfileActionScriptItem.className = "ProfileActionScriptItem"
ProfileActionScriptItem.javaClassName = "org.allbinary.input.automation.actions.script.ProfileActionScriptItem"
setmetatable(ProfileActionScriptItem, {__index = DefaultMutableTreeNode})
ProfileActionScriptItem.java_implements = " ProfileActionScriptItemInterface ActionListener "
ProfileActionScriptItem.java_interfaces = function() return {ProfileActionScriptItemInterface, ActionListener} end

function ProfileActionScriptItem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.jPopupMenu == nil then self.jPopupMenu = nil end
end

function ProfileActionScriptItem._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return ProfileActionScriptItem._new2(self, ...)
    elseif count == 1 then return ProfileActionScriptItem._new1(self, ...)
    end
    error("No constructor of ProfileActionScriptItem takes " .. count .. " arguments")
end

function ProfileActionScriptItem.new(...)
    local self = setmetatable({}, ProfileActionScriptItem)
    ProfileActionScriptItem._jinit(self, ...)
    return self
end


function ProfileActionScriptItem._new2(self, label, node)
    java_super_init(DefaultMutableTreeNode, self, label)
    ProfileActionScriptItem._init_fields(self)
        -- super(...) made self above
        self:init()
        self.logUtil:putF("Label: " .. label, self, self.commonStrings.CONSTRUCTOR)
    return self
end


function ProfileActionScriptItem._new1(self, label)
    java_super_init(DefaultMutableTreeNode, self, label)
    ProfileActionScriptItem._init_fields(self)
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
java_overload(ProfileActionScriptItem, "init", 0)


-- throws Exception
function ProfileActionScriptItem:process(frame)
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(ProfileActionScriptItem, "process", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function ProfileActionScriptItem:getJPopupMenu()
        return self.jPopupMenu
end
java_overload(ProfileActionScriptItem, "getJPopupMenu", 0)


function ProfileActionScriptItem:showDialog()
        error(require("java.lang.RuntimeException").new(), 0)
end
java_overload(ProfileActionScriptItem, "showDialog", 0)


function ProfileActionScriptItem:actionPerformed(actionEvent)
        if actionEvent:getActionCommand():compareTo(ProfileActionScriptItem.EDIT) == 0 then
            self:showDialog()
        end
end
java_overload(ProfileActionScriptItem, "actionPerformed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ActionEvent")) end)


function ProfileActionScriptItem:setJPopupMenu(jPopupMenu)
        self.jPopupMenu = jPopupMenu
end
java_overload(ProfileActionScriptItem, "setJPopupMenu", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "JPopupMenu")) end)

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

