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

local HighScoresCanvasLevelChangeInputProcessor = {}
package.loaded["org.allbinary.game.score.HighScoresCanvasLevelChangeInputProcessor"] = HighScoresCanvasLevelChangeInputProcessor

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameKeyEventHandler = java_lazy("org.allbinary.game.input.event.GameKeyEventHandler")
local GameKeyEventUtil = java_lazy("org.allbinary.game.input.event.GameKeyEventUtil")
local HighScoresCanvas = java_lazy("org.allbinary.game.score.displayable.HighScoresCanvas")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local HighScoresCanvasInputProcessor = require("org.allbinary.game.score.HighScoresCanvasInputProcessor")

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

-- class table HighScoresCanvasLevelChangeInputProcessor is declared before the requires
HighScoresCanvasLevelChangeInputProcessor.__index = HighScoresCanvasLevelChangeInputProcessor
HighScoresCanvasLevelChangeInputProcessor.className = "HighScoresCanvasLevelChangeInputProcessor"
HighScoresCanvasLevelChangeInputProcessor.javaClassName = "org.allbinary.game.score.HighScoresCanvasLevelChangeInputProcessor"
setmetatable(HighScoresCanvasLevelChangeInputProcessor, {__index = HighScoresCanvasInputProcessor})
HighScoresCanvasLevelChangeInputProcessor.java_implements = " UpdateMyFontInterface "
HighScoresCanvasLevelChangeInputProcessor.java_interfaces = function() return {UpdateMyFontInterface} end

function HighScoresCanvasLevelChangeInputProcessor:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.INSTRUCTIONS = "(Right = Next Track, Left = Previous Track)"
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.anchor = Anchor.TOP_LEFT
    self.fontHeight = 0
end


function HighScoresCanvasLevelChangeInputProcessor._jinit(self, highScoresCanvas)
    java_super_init(HighScoresCanvasInputProcessor, self, highScoresCanvas)
    HighScoresCanvasLevelChangeInputProcessor._init_fields(self)
        -- super(...) made self above
    return self
end

function HighScoresCanvasLevelChangeInputProcessor.new(...)
    local self = setmetatable({}, HighScoresCanvasLevelChangeInputProcessor)
    HighScoresCanvasLevelChangeInputProcessor._jinit(self, ...)
    return self
end


function HighScoresCanvasLevelChangeInputProcessor:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(HighScoresCanvasLevelChangeInputProcessor, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HighScoresCanvasLevelChangeInputProcessor:open()
        GameKeyEventHandler.getInstance():addListener(self)
end
java_overload(HighScoresCanvasLevelChangeInputProcessor, "open", 0)


function HighScoresCanvasLevelChangeInputProcessor:close()
        GameKeyEventHandler.getInstance():removeListener(self)
end
java_overload(HighScoresCanvasLevelChangeInputProcessor, "close", 0)


function HighScoresCanvasLevelChangeInputProcessor:update()
        local list = self:getGameKeyEventList()
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list.objectArray[index + 1]
            local key = GameKeyEventUtil.getKey(anyType)
            if key == Canvas.RIGHT then
                self:getHighScoresCanvas():getGameInfo():nextGameLevel()
            elseif key == Canvas.LEFT then
                self:getHighScoresCanvas():getGameInfo():previousGameLevel()
            end
            self:getHighScoresCanvas():executeUpdate()
        end
        list:clear()
end
java_overload(HighScoresCanvasLevelChangeInputProcessor, "update", 0)


function HighScoresCanvasLevelChangeInputProcessor:paint(graphics)
        self.myFontProcessor:process(graphics)
        local width = self.displayInfoSingleton:getLastWidth()
        local topScoresWidth = (((graphics:getFont():stringWidth(self.INSTRUCTIONS)) // (1 << (1))))
        graphics:drawString(self.INSTRUCTIONS, (((width) // (1 << (1)))) - topScoresWidth, self.fontHeight * 2, self.anchor)
end
java_overload(HighScoresCanvasLevelChangeInputProcessor, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return HighScoresCanvasLevelChangeInputProcessor

