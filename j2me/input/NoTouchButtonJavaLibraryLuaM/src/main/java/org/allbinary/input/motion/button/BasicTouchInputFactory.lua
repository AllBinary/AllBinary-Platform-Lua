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
local TouchButtonInput = java_lazy("org.allbinary.input.motion.button.TouchButtonInput")

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
    self.SPECIAL_BUTTON_SIX = TouchButtonInput.new(InputFactory.getInstance().MAX - 30, "Button 6")
    self.SPECIAL_BUTTON_FIVE = TouchButtonInput.new(InputFactory.getInstance().MAX - 31, "Button 5")
    self.SPECIAL_BUTTON_FOUR = TouchButtonInput.new(InputFactory.getInstance().MAX - 32, "Button 4")
    self.SPECIAL_BUTTON_THREE = TouchButtonInput.new(InputFactory.getInstance().MAX - 33, "Button 3")
    self.SPECIAL_BUTTON_TWO = TouchButtonInput.new(InputFactory.getInstance().MAX - 34, "Button 2")
    self.SPECIAL_BUTTON_ONE = TouchButtonInput.new(InputFactory.getInstance().MAX - 35, "Button 1")
    self.UP = TouchButtonInput.new(InputFactory.getInstance().MAX - 36, "Up Button")
    self.LEFT = TouchButtonInput.new(InputFactory.getInstance().MAX - 37, "Left Button")
    self.RIGHT = TouchButtonInput.new(InputFactory.getInstance().MAX - 38, "Right Button")
    self.DOWN = TouchButtonInput.new(InputFactory.getInstance().MAX - 39, "Down Button")
    self.NONE = TouchButtonInput.new(InputFactory.getInstance().MAX - 40, "No Button")
    self.initialized = false
    self.list = BasicArrayListD.new()
end

function BasicTouchInputFactory._jinit(self)
    BasicTouchInputFactory._init_fields(self)
    return self
end

function BasicTouchInputFactory.new()
    return BasicTouchInputFactory._jinit(setmetatable({}, BasicTouchInputFactory))
end


function BasicTouchInputFactory.getInstance()
        if rawequal(BasicTouchInputFactory.instance_f, NullUtil.getInstance().NULL_OBJECT) then
            BasicTouchInputFactory.instance_f = BasicTouchInputFactory.new()
        end
        return BasicTouchInputFactory.instance_f
end


function BasicTouchInputFactory:init(inputToGameKeyMapping)
        if not (self.initialized) then
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
            self:updateAllList(self.list, inputToGameKeyMapping)
        end
end


function BasicTouchInputFactory:updateAll(inputToGameKeyMapping)
        self:updateAllList(self:getList(), inputToGameKeyMapping)
end


function BasicTouchInputFactory:updateAllList(list, inputToGameKeyMapping)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START):appendint(list:size())), self, "updateAll")
        for index = list:size() - 1, 0, -1 do
            local touchButtonInput = list:get(index)
            touchButtonInput:update(inputToGameKeyMapping)
        end
end


function BasicTouchInputFactory:getList()
        return self.list
end

BasicTouchInputFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return BasicTouchInputFactory

