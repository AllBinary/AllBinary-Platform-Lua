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
-- package org.allbinary.input.motion.button

local BasicTouchInputFactory = {}
package.loaded["org.allbinary.input.motion.button.BasicTouchInputFactory"] = BasicTouchInputFactory

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

local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local InputToGameKeyMapping = java_lazy("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
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

-- class table BasicTouchInputFactory is declared before the requires
BasicTouchInputFactory.__index = BasicTouchInputFactory
BasicTouchInputFactory.className = "BasicTouchInputFactory"
BasicTouchInputFactory.javaClassName = "org.allbinary.input.motion.button.BasicTouchInputFactory"

function BasicTouchInputFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.SPECIAL_BUTTON_SEVEN_TESTING_ONLY == nil then self.SPECIAL_BUTTON_SEVEN_TESTING_ONLY = nil end
    if self.SPECIAL_BUTTON_EIGHT_TESTING_ONLY == nil then self.SPECIAL_BUTTON_EIGHT_TESTING_ONLY = nil end
    if self.SPECIAL_BUTTON_SIX == nil then self.SPECIAL_BUTTON_SIX = nil end
    if self.SPECIAL_BUTTON_FIVE == nil then self.SPECIAL_BUTTON_FIVE = nil end
    if self.SPECIAL_BUTTON_FOUR == nil then self.SPECIAL_BUTTON_FOUR = nil end
    if self.SPECIAL_BUTTON_THREE == nil then self.SPECIAL_BUTTON_THREE = nil end
    if self.SPECIAL_BUTTON_TWO == nil then self.SPECIAL_BUTTON_TWO = nil end
    if self.SPECIAL_BUTTON_ONE == nil then self.SPECIAL_BUTTON_ONE = nil end
    if self.UP == nil then self.UP = nil end
    if self.LEFT == nil then self.LEFT = nil end
    if self.RIGHT == nil then self.RIGHT = nil end
    if self.DOWN == nil then self.DOWN = nil end
    if self.NONE == nil then self.NONE = nil end
    self.initialized = false
    self.list = BasicArrayListD.new()
end


function BasicTouchInputFactory.getInstance()
        if BasicTouchInputFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            BasicTouchInputFactory.instance_f = BasicTouchInputFactory.new()
        end
        return BasicTouchInputFactory.instance_f
end


function BasicTouchInputFactory._jinit(self)
    BasicTouchInputFactory._init_fields(self)
        local MAX = InputFactory.getInstance().MAX
        self.SPECIAL_BUTTON_SEVEN_TESTING_ONLY = TouchButtonInput.new(MAX - 41, "Button 7 - Testing Only May Cross Over Key Values")
        self.SPECIAL_BUTTON_EIGHT_TESTING_ONLY = TouchButtonInput.new(MAX - 42, "Button 8 - Testing Only May Cross Over Key Values")
        self.SPECIAL_BUTTON_SIX = TouchButtonInput.new(MAX - 30, "Button 6")
        self.SPECIAL_BUTTON_FIVE = TouchButtonInput.new(MAX - 31, "Button 5")
        self.SPECIAL_BUTTON_FOUR = TouchButtonInput.new(MAX - 32, "Button 4")
        self.SPECIAL_BUTTON_THREE = TouchButtonInput.new(MAX - 33, "Button 3")
        self.SPECIAL_BUTTON_TWO = TouchButtonInput.new(MAX - 34, "Button 2")
        self.SPECIAL_BUTTON_ONE = TouchButtonInput.new(MAX - 35, "Button 1")
        self.UP = TouchButtonInput.new(MAX - 36, "Up Button")
        self.LEFT = TouchButtonInput.new(MAX - 37, "Left Button")
        self.RIGHT = TouchButtonInput.new(MAX - 38, "Right Button")
        self.DOWN = TouchButtonInput.new(MAX - 39, "Down Button")
        self.NONE = TouchButtonInput.new(MAX - 40, "No Button")
    return self
end

function BasicTouchInputFactory.new(...)
    local self = setmetatable({}, BasicTouchInputFactory)
    BasicTouchInputFactory._jinit(self, ...)
    return self
end


function BasicTouchInputFactory:init(inputToGameKeyMapping)
        if not self.initialized then
            self.initialized = true
            self.list:add(self.UP)
            self.list:add(self.LEFT)
            self.list:add(self.RIGHT)
            self.list:add(self.DOWN)
            self.list:add(self.SPECIAL_BUTTON_TWO)
            self.list:add(self.SPECIAL_BUTTON_FOUR)
            self.list:add(self.SPECIAL_BUTTON_THREE)
            self.list:add(self.SPECIAL_BUTTON_ONE)
            self.list:add(self.SPECIAL_BUTTON_FIVE)
            self.list:add(self.SPECIAL_BUTTON_SIX)
            self.list:add(self.SPECIAL_BUTTON_SIX)
            self.list:add(self.SPECIAL_BUTTON_SEVEN_TESTING_ONLY)
            self.list:add(self.SPECIAL_BUTTON_EIGHT_TESTING_ONLY)
            self:updateAllFromList(self.list, inputToGameKeyMapping)
        end
end


function BasicTouchInputFactory:updateAll(inputToGameKeyMapping)
        self:updateAllFromList(self.list, inputToGameKeyMapping)
end


function BasicTouchInputFactory:updateAllFromList(list, inputToGameKeyMapping)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):appendint(list:size())), self, "updateAll")
        local touchButtonInput = nil
        for index = list:size() - 1, 0, -1 do
            touchButtonInput = list.objectArray[index + 1]
            touchButtonInput:update(inputToGameKeyMapping)
        end
end


function BasicTouchInputFactory:getList()
        return self.list
end

BasicTouchInputFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return BasicTouchInputFactory

