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
-- package org.allbinary.game.configuration

local LoadGameForm = {}
package.loaded["org.allbinary.game.configuration.LoadGameForm"] = LoadGameForm

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

-- local Choice = require("javax.microedition.lcdui.Choice")
-- local ChoiceGroup = require("javax.microedition.lcdui.ChoiceGroup")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Item = require("javax.microedition.lcdui.Item")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
-- local StringItem = require("javax.microedition.lcdui.StringItem")
local MIDPUtil = java_lazy("org.allbinary.MIDPUtil")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local GamePersistanceSingleton = java_lazy("org.allbinary.game.configuration.persistance.GamePersistanceSingleton")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table LoadGameForm is declared before the requires
LoadGameForm.__index = LoadGameForm
LoadGameForm.className = "LoadGameForm"
LoadGameForm.javaClassName = "org.allbinary.game.configuration.LoadGameForm"
setmetatable(LoadGameForm, {__index = CommandForm})

function LoadGameForm:_init_fields()
    self.meUtil = MIDPUtil.getInstance()
    if self.areChoices == nil then self.areChoices = false end
end


function LoadGameForm._jinit(self, commandListener, title, backgrounBasicColor, foregroundBasicColor)
    java_super_init(CommandForm, self, commandListener, title, backgrounBasicColor, foregroundBasicColor)
    LoadGameForm._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:update()
        self:initCommands(commandListener)
    return self
end

function LoadGameForm.new(...)
    local self = setmetatable({}, LoadGameForm)
    LoadGameForm._jinit(self, ...)
    return self
end


function LoadGameForm:initCommands(cmdListener)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        self:removeAllCommands()
        self:addCommand(gameCommandsFactory.LOAD_FILE)
        self:addCommand(gameCommandsFactory.DELETE_FILE)
        self:addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end
java_overload(LoadGameForm, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


-- throws Exception
function LoadGameForm:update()
        local list = GamePersistanceSingleton.getInstance():getIds()
        self:deleteAll()
        if list:size() > 0 then
            self:add(list, "Select A Saved Game", Choice.EXCLUSIVE)
            self.areChoices = true
        else
            self.meUtil:appendItem(self, StringItem.new("No Saved Games", StringUtil.getInstance().EMPTY_STRING, Item.PLAIN))
            self.areChoices = false
        end
        java_super(CommandForm, "update", 0)(self)
end
java_overload(LoadGameForm, "update", 0)


function LoadGameForm:add(list, name, option)
        local choiceGroup = self:getChoiceGroup(list, name, option)
        if list:size() > 0 then
            choiceGroup:setSelectedIndex(0, true)
        end
        self.meUtil:appendItem(self, choiceGroup)
end
java_overload(LoadGameForm, "add", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)


function LoadGameForm:getChoiceGroup(list, name, option)
        local METHOD_NAME = "getChoiceGroup"
        local ADDING_CHOICE = "Adding Choice: "
        local choiceGroup = ChoiceGroup.new(name, option, StringUtil.getInstance():getArrayInstance(), NullImage.NULL_IMAGE_ARRAY)
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list.objectArray[index + 1]
            self.logUtil:putF(tostring(StringMaker.new():append(ADDING_CHOICE):append(tostring(anyType))), self, METHOD_NAME)
            choiceGroup:append(tostring(anyType), NullImage.NULL_IMAGE)
        end
        return choiceGroup
end
java_overload(LoadGameForm, "getChoiceGroup", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)


function LoadGameForm:getSelectedId()
        if self.areChoices then
            local choiceGroup = self:get(0)
            return choiceGroup:getSelectedIndex()
        else
            return -1
        end
end
java_overload(LoadGameForm, "getSelectedId", 0)


function LoadGameForm:getSelectedText()
        if self.areChoices then
            local choiceGroup = self:get(0)
            local value = math.tointeger(tostring(choiceGroup:getString(choiceGroup:getSelectedIndex())) // 1)
            return value
        else
            return -1
        end
end
java_overload(LoadGameForm, "getSelectedText", 0)

return LoadGameForm

