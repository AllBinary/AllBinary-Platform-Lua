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
-- package org.allbinary.game.score.displayable

local HighScoreTextBox = {}
package.loaded["org.allbinary.game.score.displayable.HighScoreTextBox"] = HighScoreTextBox

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

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local TextField = require("javax.microedition.lcdui.TextField")
local PostGameCommandFactory = java_lazy("org.allbinary.PostGameCommandFactory")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local HighScore = java_lazy("org.allbinary.game.score.HighScore")
local HighScoresHelperBaseInterface = java_lazy("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresFactoryInterface = java_lazy("org.allbinary.game.score.HighScoresFactoryInterface")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local CustomTextBox = require("org.allbinary.graphics.form.item.CustomTextBox")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local SimpleTextPaintable = java_lazy("org.allbinary.graphics.paint.SimpleTextPaintable")
local VirtualKeyboardEventHandler = java_lazy("org.allbinary.input.event.VirtualKeyboardEventHandler")
local GenericOperatingSystem = java_lazy("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.OperatingSystemFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local InApplicationPurchaseFactory = java_lazy("org.allbinary.logic.system.security.licensing.InApplicationPurchaseFactory")
local HighScoreUtil = java_lazy("org.allbinary.game.score.displayable.HighScoreUtil")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table HighScoreTextBox is declared before the requires
HighScoreTextBox.__index = HighScoreTextBox
HighScoreTextBox.className = "HighScoreTextBox"
HighScoreTextBox.javaClassName = "org.allbinary.game.score.displayable.HighScoreTextBox"
setmetatable(HighScoreTextBox, {__index = CustomTextBox})

function HighScoreTextBox:_init_fields()
    self.virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
    if self.highScoreUtil == nil then self.highScoreUtil = nil end
    self.pleaseWait = SimpleTextPaintable.new(self.commonStrings.PLEASE_WAIT, BasicColorFactory.getInstance().WHITE)
    self.paintable = NullPaintable.getInstance()
    self.submitted = false
end


function HighScoreTextBox._jinit(self, highScoresFactoryInterface, highScoresHelper, abeClientInformation, gameInfo, cmdListener, name, highScore, backgrounBasicColor, foregroundBasicColor)
    java_super_init(CustomTextBox, self, cmdListener, "New High Score Enter Name:", name, 12, TextField.ANY, Font.getDefaultFont(), backgrounBasicColor, foregroundBasicColor)
    HighScoreTextBox._init_fields(self)
        -- super(...) made self above
        self.highScoreUtil = HighScoreUtil.new(highScoresFactoryInterface, highScoresHelper, abeClientInformation, gameInfo, cmdListener, name, highScore)
        local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
        if operatingSystemInterface:isOverScan() then
            local username = InApplicationPurchaseFactory.getInstance():getUserName()
            self:getTextFieldItem():setString(username)
        end
    return self
end

function HighScoreTextBox.new(...)
    local self = setmetatable({}, HighScoreTextBox)
    HighScoreTextBox._jinit(self, ...)
    return self
end


function HighScoreTextBox:initCommands(cmdListener)
        self:removeAllCommands()
        PostGameCommandFactory.getInstance():addCommands(self)
        self:addCommand(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND)
        self:setCommandListener(cmdListener)
end
java_overload(HighScoreTextBox, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function HighScoreTextBox:open()
        self.virtualKeyboardEventHandler:open()
        self.paintable = NullPaintable.getInstance()
        java_super(CustomTextBox, "open", 0)(self)
end
java_overload(HighScoreTextBox, "open", 0)


-- throws Exception
function HighScoreTextBox:close()
        self.virtualKeyboardEventHandler:close()
        self.paintable = self.pleaseWait
        self.repaintBehavior:onChangeRepaint(self)
        java_super(CustomTextBox, "close", 0)(self)
        self:removeCommand(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND)
        self:update()
        if self.submitted then
            self.highScoreUtil:saveHighScore()
        else
        end
        self.paintable = NullPaintable.getInstance()
        self.repaintBehavior:onChangeRepaint(self)
end
java_overload(HighScoreTextBox, "close", 0)


-- throws Exception
function HighScoreTextBox:update()
        local name = self:getTextFieldItem():getString()
        self.highScoreUtil:update(name)
        java_super(CustomTextBox, "update", 0)(self)
end
java_overload(HighScoreTextBox, "update", 0)


function HighScoreTextBox:paint(graphics)
        java_super(CustomTextBox, "paint", 1)(self, graphics)
        self.paintable:paint(graphics)
end
java_overload(HighScoreTextBox, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HighScoreTextBox:saveHighScore()
        self.highScoreUtil:saveHighScore()
end
java_overload(HighScoreTextBox, "saveHighScore", 0)


function HighScoreTextBox:submit()
        self.highScoreUtil:submit(self)
end
java_overload(HighScoreTextBox, "submit", 0)

return HighScoreTextBox

