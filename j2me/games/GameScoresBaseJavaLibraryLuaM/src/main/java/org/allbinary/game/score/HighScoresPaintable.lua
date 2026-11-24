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
-- package org.allbinary.game.score

local HighScoresPaintable = {}
package.loaded["org.allbinary.game.score.HighScoresPaintable"] = HighScoresPaintable

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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local ColorChangeEvent = java_lazy("org.allbinary.graphics.color.ColorChangeEvent")
local ColorChangeListener = java_lazy("org.allbinary.graphics.color.ColorChangeListener")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local NullHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.NullHighScoresSingletonFactory")

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

-- class table HighScoresPaintable is declared before the requires
HighScoresPaintable.__index = HighScoresPaintable
HighScoresPaintable.className = "HighScoresPaintable"
HighScoresPaintable.javaClassName = "org.allbinary.game.score.HighScoresPaintable"
setmetatable(HighScoresPaintable, {__index = Paintable})
HighScoresPaintable.java_implements = " ColorChangeListener UpdateMyFontInterface "
HighScoresPaintable.java_interfaces = function() return {ColorChangeListener, UpdateMyFontInterface} end

function HighScoresPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.highScores = NullHighScoresSingletonFactory.getInstance()
    self.anchor = Anchor.TOP_LEFT
    if self.charHeight == nil then self.charHeight = 0 end
end


function HighScoresPaintable._jinit(self)
    java_super_init(Paintable, self)
    HighScoresPaintable._init_fields(self)
    return self
end

function HighScoresPaintable.new(...)
    local self = setmetatable({}, HighScoresPaintable)
    HighScoresPaintable._jinit(self, ...)
    return self
end


function HighScoresPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.charHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(HighScoresPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HighScoresPaintable:onEvent(eventObject)
        local colorChangeEvent = eventObject
        self.basicColor = colorChangeEvent:getBasicColorP()
end
java_overload(HighScoresPaintable, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function HighScoresPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local width = self.displayInfoSingleton:getLastWidth()
        local height = self.displayInfoSingleton:getLastHeight()
        graphics:setColor(math.tointeger(self:getBasicColorP() // 1))
        local heading = self.highScores:getHeading()
        local topScoresWidth = (((graphics:getFont():stringWidth(heading)) // (1 << (1))))
        local charHeight = self.charHeight
        graphics:drawString(heading, (((width) // (1 << (1)))) - topScoresWidth, charHeight, self.anchor)
        graphics:drawString(self.highScores:getColumnOneHeading(), 10, charHeight * 3, self.anchor)
        local columnTwoHeading = self.highScores:getColumnTwoHeading()
        local columnTwoHeadingWidth = graphics:getFont():stringWidth(columnTwoHeading)
        graphics:drawString(columnTwoHeading, width - 10 - columnTwoHeadingWidth, charHeight * 3, self.anchor)
        local index = 4
        local largestSecondColumnWidth = columnTwoHeadingWidth
        local list = self.highScores:getList()
        local size = list:size()
        local vectorIndex = 0
        local highScore = nil
        while vectorIndex < size and charHeight * index < height - (charHeight * 2) do
            highScore = list.objectArray[vectorIndex + 1]
            local nextScoreWidth = graphics:getFont():stringWidth(highScore:getScoreString())
            if nextScoreWidth > largestSecondColumnWidth then
                largestSecondColumnWidth = nextScoreWidth
            end
            vectorIndex = vectorIndex + 1
        end
        vectorIndex = 0
        while vectorIndex < size and charHeight * index < height - (charHeight * 2) do
            highScore = list.objectArray[vectorIndex + 1]
            graphics:drawString(highScore:getName(), 10, charHeight * index, self.anchor)
            graphics:drawString(highScore:getScoreString(), width - 10 - largestSecondColumnWidth, charHeight * index, self.anchor)
            index = index + 1
            vectorIndex = vectorIndex + 1
        end
end
java_overload(HighScoresPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HighScoresPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
end
java_overload(HighScoresPaintable, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function HighScoresPaintable:getBasicColorP()
        return self.basicColor
end
java_overload(HighScoresPaintable, "getBasicColorP", 0)


function HighScoresPaintable:setHighScores(highScores)
        self.highScores = highScores
end
java_overload(HighScoresPaintable, "setHighScores", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HighScores")) end)

return HighScoresPaintable

