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
-- package org.allbinary.game.paint.help

local InputMappingHelpPaintable = {}
package.loaded["org.allbinary.game.paint.help.InputMappingHelpPaintable"] = InputMappingHelpPaintable

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

local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local GameKeyFactory = java_lazy("org.allbinary.game.input.GameKeyFactory")
local Input = java_lazy("org.allbinary.game.input.Input")
local PlatformInputMappingFactory = java_lazy("org.allbinary.game.input.PlatformInputMappingFactory")
local GameInputMapping = java_lazy("org.allbinary.game.input.mapping.GameInputMapping")
local PersistentInputMapping = java_lazy("org.allbinary.game.input.mapping.PersistentInputMapping")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorUtil = java_lazy("org.allbinary.graphics.color.BasicColorUtil")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local HelpPaintable = require("org.allbinary.game.paint.help.HelpPaintable")
local UpdateMyFontProperties = java_lazy("org.allbinary.game.paint.help.UpdateMyFontProperties")

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

-- class table InputMappingHelpPaintable is declared before the requires
InputMappingHelpPaintable.__index = InputMappingHelpPaintable
InputMappingHelpPaintable.className = "InputMappingHelpPaintable"
InputMappingHelpPaintable.javaClassName = "org.allbinary.game.paint.help.InputMappingHelpPaintable"
setmetatable(InputMappingHelpPaintable, {__index = HelpPaintable})

function InputMappingHelpPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.NONE = GameKeyFactory.getInstance().NONE
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    if self.gameInputMappingArray == nil then self.gameInputMappingArray = nil end
    self.keyMappingArray = java_new_array(nil, 0)
    self.actionBasicColor = BasicColorUtil.getInstance().ZERO_ARRAY
    self.inputBasicColorArray = java_new_array(nil, 0, 0)
    if self.selectedBasicColor == nil then self.selectedBasicColor = nil end
    self.updateMyFontProperties = UpdateMyFontProperties.new()
end


function InputMappingHelpPaintable._jinit(self, gameInputMappingArray, backgroundBasicColor, basicColor)
    java_super_init(HelpPaintable, self, "Input Mapping", backgroundBasicColor, basicColor)
    InputMappingHelpPaintable._init_fields(self)
        -- super(...) made self above
        self.gameInputMappingArray = gameInputMappingArray
        self:update(self.NONE, self.NONE)
        if rawequal(backgroundBasicColor, self.basicColorFactory.WHITE) or rawequal(basicColor, self.basicColorFactory.WHITE) then
            self.selectedBasicColor = self.basicColorFactory.RED
        else
            self.selectedBasicColor = self.basicColorFactory.WHITE
        end
    return self
end

function InputMappingHelpPaintable.new(...)
    local self = setmetatable({}, InputMappingHelpPaintable)
    InputMappingHelpPaintable._jinit(self, ...)
    return self
end


function InputMappingHelpPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        local updateMyFontProperties = UpdateMyFontProperties.new()
        updateMyFontProperties.charHeight = font:getHeight()
        local stringMaker = StringMaker.new()
        local inputInfo = self.inputInfo
        local size = (inputInfo.n or #inputInfo)
        updateMyFontProperties.actionStringArray = java_new_array(nil, size)
        updateMyFontProperties.keymappingBeginWidthArray = java_typed_array("I", java_new_array(0, size))
        updateMyFontProperties.actionStringDeltaXArray = java_typed_array("I", java_new_array(0, size))
        updateMyFontProperties.inputDeltaXArray = java_new_array(0, size, 0)
        updateMyFontProperties.sepArray = java_new_array(nil, size, 0)
        updateMyFontProperties.sepWidthArray = java_new_array(0, size, 0)
        local list = nil
        local keyMappings = nil
        local actionString = nil
        local input = nil
        local size2 = 0
        for index = 0, size - 1 do
            list = self.keyMappingArray[index + 1]
            keyMappings = self:get(list)
            stringMaker:delete(0, stringMaker:length())
            actionString = tostring(stringMaker:append(inputInfo[index + 1]):append(self.commonSeps.COLON):append(self.commonSeps.SPACE):append(self.commonSeps.SPACE))
            updateMyFontProperties.actionStringArray[index + 1] = actionString
            stringMaker:delete(0, stringMaker:length())
            updateMyFontProperties.keymappingBeginWidthArray[index + 1] = (((font:stringWidth(tostring(stringMaker:append(updateMyFontProperties.actionStringArray[index + 1]):append(keyMappings)))) // (1 << (1))))
            updateMyFontProperties.actionStringDeltaXArray[index + 1] = font:stringWidth(actionString)
            size2 = list:size()
            updateMyFontProperties.inputDeltaXArray[index + 1] = java_typed_array("I", java_new_array(0, size2))
            updateMyFontProperties.sepArray[index + 1] = java_new_array(nil, size2)
            updateMyFontProperties.sepWidthArray[index + 1] = java_typed_array("I", java_new_array(0, size2))
            for index2 = 0, size2 - 1 do
                input = list.objectArray[index2 + 1]
                updateMyFontProperties.inputDeltaXArray[index + 1][index2 + 1] = font:stringWidth(input:getName())
                updateMyFontProperties.sepArray[index + 1][index2 + 1] = self.EMPTY_STRING
                if index2 + 1 < list:size() then
                    if rawequal(list:size(), 2) then
                        updateMyFontProperties.sepArray[index + 1][index2 + 1] = InputMappingHelpPaintable.AND
                    else
                        if rawequal(index2 + 2, list:size()) then
                            updateMyFontProperties.sepArray[index + 1][index2 + 1] = InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND
                        else
                            updateMyFontProperties.sepArray[index + 1][index2 + 1] = InputMappingHelpPaintable.SEP
                        end
                    end
                end
                if not rawequal(updateMyFontProperties.sepArray[index + 1][index2 + 1], self.EMPTY_STRING) then
                    updateMyFontProperties.sepWidthArray[index + 1][index2 + 1] = font:stringWidth(updateMyFontProperties.sepArray[index + 1][index2 + 1])
                end
            end
        end
        self.updateMyFontProperties = updateMyFontProperties
        java_super(HelpPaintable, "updateMeasurement", 1)(self, graphics)
end
java_overload(InputMappingHelpPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function InputMappingHelpPaintable:update(selectedGameKey, selectedInput)
        local stringMaker = StringMaker.new()
        self.logUtil:putF(tostring(stringMaker:append(CommonLabels.getInstance().START_LABEL):append("selected GameKey: "):append(self.stringUtil:toString(selectedGameKey)):append(" Input: "):append(self.stringUtil:toString(selectedInput))), self, self.commonStrings.UPDATE)
        local gameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance()
        local size = (self.gameInputMappingArray.n or #self.gameInputMappingArray)
        local keyInfo = java_new_array(nil, size)
        local keyMappingArray = java_new_array(nil, size)
        local actionBasicColor = java_new_array(nil, size)
        local inputBasicColorArray = java_new_array(nil, size)
        local gameInputMapping = nil
        local gameKey = nil
        local list = nil
        for index = 0, size - 1 do
            gameInputMapping = self.gameInputMappingArray[index + 1]
            gameKey = gameInputMapping:getGameKey()
            list = gameKeyMapping:getInputMapping():getMappedInput(gameKey)
            local size2 = list:size()
            inputBasicColorArray[index + 1] = java_new_array(nil, size2)
            for index2 = 0, size2 - 1 do
                inputBasicColorArray[index + 1][index2 + 1] = self.basicColor
            end
            if rawequal(gameKey, selectedGameKey) then
                stringMaker:delete(0, stringMaker:length())
                self.logUtil:putF(tostring(stringMaker:append("Found: selected GameKey: "):append(self.stringUtil:toString(selectedGameKey))), self, self.commonStrings.UPDATE)
                actionBasicColor[index + 1] = self.selectedBasicColor
                local indexOfSelectedInput = list:indexOf(selectedInput)
                if indexOfSelectedInput >= 0 then
                    stringMaker:delete(0, stringMaker:length())
                    self.logUtil:putF(tostring(stringMaker:append("Found: selected Input: "):append(self.stringUtil:toString(selectedInput))), self, self.commonStrings.UPDATE)
                    inputBasicColorArray[index + 1][indexOfSelectedInput + 1] = self.selectedBasicColor
                end
            else
                actionBasicColor[index + 1] = self.basicColor
            end
            keyInfo[index + 1] = gameInputMapping:getName()
            keyMappingArray[index + 1] = list
        end
        self.keyMappingArray = keyMappingArray
        self.actionBasicColor = actionBasicColor
        self.inputBasicColorArray = inputBasicColorArray
        java_super(HelpPaintable, "setInputInfoP", 1)(self, keyInfo)
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(InputMappingHelpPaintable, "update", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "GameKey")) and (java_a2 == nil or java_is(java_a2, "Input")) end)


function InputMappingHelpPaintable:get(keyList)
        local stringBuffer = StringMaker.new()
        local key = nil
        local size = keyList:size()
        for index = 0, size - 1 do
            key = keyList.objectArray[index + 1]
            stringBuffer:append(key:getName())
            if index + 1 < keyList:size() then
                if rawequal(keyList:size(), 2) then
                    stringBuffer:append(InputMappingHelpPaintable.AND)
                else
                    if rawequal(index + 2, keyList:size()) then
                        stringBuffer:append(InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND)
                    else
                        stringBuffer:append(InputMappingHelpPaintable.SEP)
                    end
                end
            end
        end
        return tostring(stringBuffer)
end
java_overload(InputMappingHelpPaintable, "get", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicArrayList")) end)


function InputMappingHelpPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local halfWidth = self.displayInfo:getLastHalfWidth()
        graphics:setColor(require("allbinary_java").number_value(self.basicColor, "intValue"))
        graphics:drawString(self.title, halfWidth - self.titleBeginWidth, self.updateMyFontProperties.charHeight, self.anchor)
        local inputInfo = self.inputInfo
        local size = (inputInfo.n or #inputInfo)
        local y = 0
        local deltaX = 0
        local size2 = 0
        local actionString = nil
        local input = nil
        local list = nil
        local sep = nil
        local beginWidth = 0
        for index = 0, size - 1 do
            y = (index + 3) * self.updateMyFontProperties.charHeight
            deltaX = 0
            list = self.keyMappingArray[index + 1]
            size2 = list:size()
            beginWidth = self.updateMyFontProperties.keymappingBeginWidthArray[index + 1]
            graphics:setColor(require("allbinary_java").number_value(self.actionBasicColor[index + 1], "intValue"))
            actionString = self.updateMyFontProperties.actionStringArray[index + 1]
            graphics:drawString(actionString, halfWidth - beginWidth + deltaX, y, self.anchor)
            deltaX = deltaX + (self.updateMyFontProperties.actionStringDeltaXArray[index + 1])
            for index2 = 0, size2 - 1 do
                input = list.objectArray[index2 + 1]
                graphics:setColor(require("allbinary_java").number_value(self.inputBasicColorArray[index + 1][index2 + 1], "intValue"))
                graphics:drawString(input:getName(), halfWidth - beginWidth + deltaX, y, self.anchor)
                deltaX = deltaX + (self.updateMyFontProperties.inputDeltaXArray[index + 1][index2 + 1])
                sep = self.updateMyFontProperties.sepArray[index + 1][index2 + 1]
                graphics:setColor(require("allbinary_java").number_value(self.basicColor, "intValue"))
                graphics:drawString(sep, halfWidth - beginWidth + deltaX, y, self.anchor)
                deltaX = deltaX + (self.updateMyFontProperties.sepWidthArray[index + 1][index2 + 1])
            end
        end
end
java_overload(InputMappingHelpPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

InputMappingHelpPaintable.AND = " and "
InputMappingHelpPaintable.SEP = ", "
InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND = ", and "

return InputMappingHelpPaintable

