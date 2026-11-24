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

local HighScoresCanvas = {}
package.loaded["org.allbinary.game.score.displayable.HighScoresCanvas"] = HighScoresCanvas

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

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ColorFillBasePaintable = java_lazy("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = java_lazy("org.allbinary.game.paint.ColorFillPaintableFactory")
local HighScoreCommandsFactory = java_lazy("org.allbinary.game.score.HighScoreCommandsFactory")
local HighScores = java_lazy("org.allbinary.game.score.HighScores")
local HighScoresCanvasInputProcessor = java_lazy("org.allbinary.game.score.HighScoresCanvasInputProcessor")
local HighScoresCanvasInputProcessorFactoryInterface = java_lazy("org.allbinary.game.score.HighScoresCanvasInputProcessorFactoryInterface")
local HighScoresFactoryInterface = java_lazy("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresHelperBase = java_lazy("org.allbinary.game.score.HighScoresHelperBase")
local HighScoresPaintable = java_lazy("org.allbinary.game.score.HighScoresPaintable")
local HighScoresResultsListener = java_lazy("org.allbinary.game.score.HighScoresResultsListener")
local NoHighScoresFactory = java_lazy("org.allbinary.game.score.NoHighScoresFactory")
local NullHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.NullHighScoresSingletonFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local SimpleTextPaintable = java_lazy("org.allbinary.graphics.paint.SimpleTextPaintable")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local SecondaryThreadPool = java_lazy("org.allbinary.thread.SecondaryThreadPool")
local HighScoreRunnable = java_lazy("org.allbinary.game.score.displayable.HighScoreRunnable")

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

-- class table HighScoresCanvas is declared before the requires
HighScoresCanvas.__index = HighScoresCanvas
HighScoresCanvas.className = "HighScoresCanvas"
HighScoresCanvas.javaClassName = "org.allbinary.game.score.displayable.HighScoresCanvas"
setmetatable(HighScoresCanvas, {__index = GameCommandCanvas})
HighScoresCanvas.java_implements = " HighScoresResultsListener "
HighScoresCanvas.java_interfaces = function() return {HighScoresResultsListener} end

function HighScoresCanvas:_init_fields()
    self.paintable = NullPaintable.getInstance()
    self.highScoreCommandsFactory = HighScoreCommandsFactory.getInstance()
    self.waitPaintable = SimpleTextPaintable.new(self.commonStrings.PLEASE_WAIT_FOR_SERVER, BasicColorFactory.getInstance().WHITE)
    if self.highScoresPaintable == nil then self.highScoresPaintable = nil end
    if self.highScoresFactoryInterface == nil then self.highScoresFactoryInterface = nil end
    if self.colorFillPaintable == nil then self.colorFillPaintable = nil end
    self.highScoresHelper = HighScoresHelperBase.new()
    if self.gameInfo == nil then self.gameInfo = nil end
    if self.highScoresCanvasInputProcessor == nil then self.highScoresCanvasInputProcessor = nil end
    self.currentCommand = self.highScoreCommandsFactory.HIGH_SCORE_COMMANDS[1]
    self.hasPainted = false
end


function HighScoresCanvas._jinit(self, commandListener, allBinaryGameLayerManager, gameInfo, paintable, highScoresFactoryInterface, highScoresCanvasInputProcessorFactoryInterface)
    java_super_init(GameCommandCanvas, self, commandListener, HighScoresCanvas.NAME, allBinaryGameLayerManager:getBackgroundBasicColor(), allBinaryGameLayerManager:getForegroundBasicColor())
    HighScoresCanvas._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.highScoresPaintable = paintable
        self.highScoresFactoryInterface = highScoresFactoryInterface
        self.highScoresCanvasInputProcessor = highScoresCanvasInputProcessorFactoryInterface:getInstance(self)
        self.gameInfo = gameInfo
        self.waitPaintable:setBasicColorP(allBinaryGameLayerManager:getForegroundBasicColor())
        self:getHighScoresPaintable():setBasicColorP(allBinaryGameLayerManager:getForegroundBasicColor())
        self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(allBinaryGameLayerManager:getBackgroundBasicColor(), false)
        if (self.highScoresHelper:getHighScoresArray().n or #self.highScoresHelper:getHighScoresArray()) == (NoHighScoresFactory.getInstance().NO_HIGH_SCORES.n or #NoHighScoresFactory.getInstance().NO_HIGH_SCORES) then
            self:setPaintable(self.waitPaintable)
        else
            self.logUtil:putF("Show HighScores that are already loaded", self, self.commonStrings.CONSTRUCTOR)
            self:updateCommand(self.currentCommand)
            self:setPaintable(self:getHighScoresPaintable())
        end
        SecondaryThreadPool.getInstance():runTask(HighScoreRunnable.new(self))
    return self
end

function HighScoresCanvas.new(...)
    local self = setmetatable({}, HighScoresCanvas)
    HighScoresCanvas._jinit(self, ...)
    return self
end


function HighScoresCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS)
        self:setCommandListener(cmdListener)
end
java_overload(HighScoresCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function HighScoresCanvas:open()
        java_super(GameCommandCanvas, "open", 0)(self)
        self.highScoresCanvasInputProcessor:open()
end
java_overload(HighScoresCanvas, "open", 0)


-- throws Exception
function HighScoresCanvas:close()
        java_super(GameCommandCanvas, "close", 0)(self)
        self.highScoresCanvasInputProcessor:close()
end
java_overload(HighScoresCanvas, "close", 0)


function HighScoresCanvas:paint(graphics)
        self.colorFillPaintable:paint(graphics)
        self.paintable:paint(graphics)
        if self.waitPaintable ~= self.paintable then
            self.highScoresCanvasInputProcessor:paint(graphics)
        end
        java_super(GameCommandCanvas, "paint", 1)(self, graphics)
        self.hasPainted = true
end
java_overload(HighScoresCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function HighScoresCanvas:executeUpdate()
        local try_ok, try_error, try_value = pcall(function()
            self.highScoresFactoryInterface:fetchHighScores(self:getGameInfo(), self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end
java_overload(HighScoresCanvas, "executeUpdate", 0)


function HighScoresCanvas:getHighScoresPaintable()
        return self.highScoresPaintable
end
java_overload(HighScoresCanvas, "getHighScoresPaintable", 0)


function HighScoresCanvas:setHighScoresArray(highScoresArray)
        local try_ok, try_error, try_value = pcall(function()
            if highScoresArray ~= nil then
                self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):appendint((highScoresArray.n or #highScoresArray))), self, "setHighScoresArray")
            else
                self.logUtil:putF(self.commonStrings.START, self, "setHighScoresArray")
            end
            self.highScoresHelper:setHighScoresArray(highScoresArray)
            self:updateCommand(self.currentCommand)
            self:setPaintable(self:getHighScoresPaintable())
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end
java_overload(HighScoresCanvas, "setHighScoresArray", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


-- throws Exception
function HighScoresCanvas:updateCommand(command)
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(self.stringUtil:toString(command))), self, self.commonStrings.UPDATE)
        local gameCommandsFactory = GameCommandsFactory.getInstance()
        if self.highScoreCommandsFactory:isHighScoreCommand(command) then
            local index = self.highScoreCommandsFactory:getIndex(command)
            local nextIndex = index + 1
            local highScoresArray = self.highScoresHelper:getHighScoresArray()
            if nextIndex >= (highScoresArray.n or #highScoresArray) then
                nextIndex = 0
            end
            if (highScoresArray.n or #highScoresArray) > 0 then
                self:getHighScoresPaintable():setHighScores(highScoresArray[index + 1])
            else
                self:getHighScoresPaintable():setHighScores(NullHighScoresSingletonFactory.getInstance())
            end
            if index ~= nextIndex then
                self:removeAllCommands()
                self:addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS)
                self:addCommand(self.highScoreCommandsFactory.HIGH_SCORE_COMMANDS[nextIndex + 1])
            end
        end
        self.currentCommand = command
        self:close()
        java_super(GameCommandCanvas, "initMenu", 0)(self)
        self:open()
        self.repaintBehavior:onChangeRepaint(self)
end
java_overload(HighScoresCanvas, "updateCommand", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Command")) end)


function HighScoresCanvas:getGameInfo()
        return self.gameInfo
end
java_overload(HighScoresCanvas, "getGameInfo", 0)


function HighScoresCanvas:setPaintable(paintable)
        self.paintable = paintable
        self.repaintBehavior:onChangeRepaint(self)
end
java_overload(HighScoresCanvas, "setPaintable", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Paintable")) end)

HighScoresCanvas.NAME = "HighScoresCanvas"

return HighScoresCanvas

