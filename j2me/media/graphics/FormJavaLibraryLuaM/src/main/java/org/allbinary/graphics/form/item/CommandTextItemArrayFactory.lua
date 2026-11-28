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
-- package org.allbinary.graphics.form.item

local CommandTextItemArrayFactory = {}
package.loaded["org.allbinary.graphics.form.item.CommandTextItemArrayFactory"] = CommandTextItemArrayFactory

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

local Command = java_lazy("javax.microedition.lcdui.Command")
local ImageItem = java_lazy("javax.microedition.lcdui.ImageItem")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local ScreenInfo = java_lazy("org.allbinary.graphics.form.ScreenInfo")
local VectorUtil = java_lazy("org.allbinary.logic.VectorUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local CommandTextItem = java_lazy("org.allbinary.graphics.form.item.CommandTextItem")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table CommandTextItemArrayFactory is declared before the requires
CommandTextItemArrayFactory.__index = CommandTextItemArrayFactory
CommandTextItemArrayFactory.className = "CommandTextItemArrayFactory"
CommandTextItemArrayFactory.javaClassName = "org.allbinary.graphics.form.item.CommandTextItemArrayFactory"

function CommandTextItemArrayFactory:_init_fields()
    self.list = BasicArrayListD.new()
    if self.visitorInterface == nil then self.visitorInterface = nil end
end


function CommandTextItemArrayFactory._jinit(self, visitorInterface)
    CommandTextItemArrayFactory._init_fields(self)
        self.visitorInterface = visitorInterface
    return self
end

function CommandTextItemArrayFactory.new(...)
    local self = setmetatable({}, CommandTextItemArrayFactory)
    CommandTextItemArrayFactory._jinit(self, ...)
    return self
end


function CommandTextItemArrayFactory:getInstance(vector, backgroundBasicColor, foregroundBasicColor)
        local vectorUtil = VectorUtil.getInstance()
        local size = vectorUtil:getSize(vector)
        self.list:clear()
        local textItem = nil
        local priorityLimit = 7
        local displayInfo = DisplayInfoSingleton.getInstance()
        local isLargeEnoughDisplayForBigMenu = (displayInfo:isPortrait() and displayInfo:getLastHeight() >= ScreenInfo.getInstance().MEDIUM_WIDTH) or (not (displayInfo:isPortrait()) and displayInfo:getLastWidth() >= ScreenInfo.getInstance().MEDIUM_WIDTH)
        if not (isLargeEnoughDisplayForBigMenu) and size > 3 then
            priorityLimit = 3
        end
        local command = nil
        for index = 0, size - 1 do
            command = vectorUtil:elementAt(vector, index)
            if command:getPriority() < priorityLimit then
                local aBoolean = self.visitorInterface:visit(command)
                if aBoolean then
                    textItem = CommandTextItem.new(command, ImageItem.LAYOUT_DEFAULT, StringUtil.getInstance().EMPTY_STRING, backgroundBasicColor, foregroundBasicColor)
                    self.list:add(textItem)
                end
            end
        end
        local textItemArray = java_new_array(nil, self.list:size())
        local size2 = (textItemArray.n or #textItemArray)
        for index = 0, size2 - 1 do
            textItemArray[index + 1] = self.list.objectArray[index + 1]
        end
        return textItemArray
end

return CommandTextItemArrayFactory

