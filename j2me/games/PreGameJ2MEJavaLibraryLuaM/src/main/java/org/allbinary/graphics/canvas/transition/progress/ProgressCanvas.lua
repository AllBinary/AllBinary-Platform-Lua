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
-- package org.allbinary.graphics.canvas.transition.progress

local ProgressCanvas = {}
package.loaded["org.allbinary.graphics.canvas.transition.progress.ProgressCanvas"] = ProgressCanvas

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

local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local NullCanvas = java_lazy("javax.microedition.lcdui.NullCanvas")
local NullCommandListener = java_lazy("javax.microedition.lcdui.NullCommandListener")
local Processor = java_lazy("org.allbinary.canvas.Processor")
local RunnableCanvas = require("org.allbinary.canvas.RunnableCanvas")
local GameCommandsFactory = java_lazy("org.allbinary.game.commands.GameCommandsFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ABCustomGaugeItem = java_lazy("org.allbinary.graphics.form.item.ABCustomGaugeItem")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryMidlet = java_lazy("org.allbinary.midlet.AllBinaryMidlet")
local PathFindingThreadPool = java_lazy("org.allbinary.thread.PathFindingThreadPool")
local ThreadPool = java_lazy("org.allbinary.thread.ThreadPool")
local ProgressEndListener = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressEndListener")
local ProgressPaintable = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressPaintable")

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

-- class table ProgressCanvas is declared before the requires
ProgressCanvas.__index = ProgressCanvas
ProgressCanvas.className = "ProgressCanvas"
ProgressCanvas.javaClassName = "org.allbinary.graphics.canvas.transition.progress.ProgressCanvas"
setmetatable(ProgressCanvas, {__index = RunnableCanvas})
ProgressCanvas.java_implements = " PaintableInterface UpdateMyFontInterface "
ProgressCanvas.java_interfaces = function() return {PaintableInterface, UpdateMyFontInterface} end

function ProgressCanvas:_init_fields()
    if self.hasPainted == nil then self.hasPainted = false end
    if self.backgroundBasicColor == nil then self.backgroundBasicColor = nil end
    self.GAUGE_PAINTABLE = ProgressPaintable.new(self)
    self.maxValue = 100.0
    if self.gauge == nil then self.gauge = nil end
    self.TEXT = self.commonStrings.LOADING
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.allbinaryMidlet = AllBinaryMidlet.getNullInstance()
    if self.value == nil then self.value = 0.0 end
    self.text = self.TEXT
    self.background = true
    self.paintable = self.GAUGE_PAINTABLE
    self.inProgress = false
    self.IN_GAME_PROCESSOR = (function()
        local o = Processor.new and Processor.new() or setmetatable({}, {__index = Processor})
        self.pathFindingThreadPool = PathFindingThreadPool.getInstance()
        

        -- throws Exception
    function o:process()
            self.pathFindingThreadPool:runAPriorityTask()
        end
        java_overload(o, "process", 0)
        return o
    end)()
    self.inGameProcessor = Processor.getInstance()
    self.progressEndListener = ProgressEndListener.instance_f
    self.backgroundLabel = "Background AI Game Loading..."
    self.START_BACKGROUND = "startBackground"
    self.ADD_PORTION = "addPortion"
    self.ADD_EARLY_PORTION = "addEarlyPortion"
end


function ProgressCanvas._jinit(self, title, backgroundBasicColor, foregroundBasicColor)
    java_super_init(RunnableCanvas, self, NullCommandListener.NULL_COMMAND_LISTENER, CanvasStrings.getInstance().EMPTY_CHILD_NAME_LIST, false)
    ProgressCanvas._init_fields(self)
        -- super(...) made self above
        self.backgroundBasicColor = backgroundBasicColor
        self.gauge = ABCustomGaugeItem.new(StringUtil.getInstance().EMPTY_STRING, java_int(self.maxValue), 0, backgroundBasicColor, foregroundBasicColor)
    return self
end

function ProgressCanvas.new(...)
    local self = setmetatable({}, ProgressCanvas)
    ProgressCanvas._jinit(self, ...)
    return self
end


function ProgressCanvas:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.gauge:setHeight(font:getHeight() + 2)
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(ProgressCanvas, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function ProgressCanvas:init(gameMidlet)
        self.allbinaryMidlet = gameMidlet
end
java_overload(ProgressCanvas, "init", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryMidlet")) end)


-- throws Exception
function ProgressCanvas:update(graphics)
end
java_overload(ProgressCanvas, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function ProgressCanvas:initCommands(cmdListener)
end
java_overload(ProgressCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function ProgressCanvas:getMaxValue()
        return self.maxValue
end
java_overload(ProgressCanvas, "getMaxValue", 0)


function ProgressCanvas:start()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START_METHOD_NAME)
        self:setBackground(true)
        self.gauge:setHeight(30)
        self.gauge:setLabel(self.commonStrings.PLEASE_WAIT)
        self:setText(self.TEXT)
        self:setValue(0)
        self.inGameProcessor = Processor.getInstance()
        self.paintable = self.GAUGE_PAINTABLE
        self.inProgress = true
end
java_overload(ProgressCanvas, "start", 0)


function ProgressCanvas:startBackground(background)
        self.logUtil:putF(self.commonStrings.START, self, self.START_BACKGROUND)
        self:setBackground(background)
        self.myFontProcessor = self.updateMyFontProcessor
        self.gauge:setLabel(self.backgroundLabel)
        self:setText(self.TEXT)
        self:setValue(0)
        self.inGameProcessor = Processor.getInstance()
        self.paintable = self.GAUGE_PAINTABLE
end
java_overload(ProgressCanvas, "startBackground", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function ProgressCanvas:endActual()
        self.allbinaryMidlet:commandAction(GameCommandsFactory.getInstance().SHOW_GAME_CANVAS, NullCanvas.NULL_CANVAS)
        self.inProgress = false
        self:inGame()
end
java_overload(ProgressCanvas, "endActual", 0)


function ProgressCanvas:inGame()
        self.progressEndListener:onEndEvent()
        self.inGameProcessor = self.IN_GAME_PROCESSOR
end
java_overload(ProgressCanvas, "inGame", 0)


function ProgressCanvas:end_()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.END_METHOD_NAME)
        self.gauge:setValue(self:getMaxValue())
        self:endActual()
        self.paintable = NullPaintable.getInstance()
end
java_overload(ProgressCanvas, "end_", 0)


function ProgressCanvas:endFromInitialLazyLoadingComplete()
        self.progressEndListener:onEndEvent()
        self.gauge:setValue(self:getMaxValue())
        self.inGameProcessor = self.IN_GAME_PROCESSOR
end
java_overload(ProgressCanvas, "endFromInitialLazyLoadingComplete", 0)


function ProgressCanvas:isInGame()
        if rawequal(self.inGameProcessor, self.IN_GAME_PROCESSOR) then
            return true
        end
        return false
end
java_overload(ProgressCanvas, "isInGame", 0)


function ProgressCanvas:endIfPaintedSinceStart()
end
java_overload(ProgressCanvas, "endIfPaintedSinceStart", 0)


function ProgressCanvas:addEarlyPortion(value, text, index)
        self:setText(tostring(StringMaker.new():append(text):append(tostring(SmallIntegerSingletonFactory.getInstance():getAt(index)))))
        self.gauge:setValue(self.gauge:getValue() + self:getMaxValue() / (value + 0.0))
end
java_overload(ProgressCanvas, "addEarlyPortion", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)


function ProgressCanvas:addPortion(value, text, index)
        self:setText(tostring(StringMaker.new():append(text):append(tostring(SmallIntegerSingletonFactory.getInstance():getAt(index)))))
        PreLogUtil.put(self.text, self, self.ADD_PORTION)
        self.gauge:setValue(self.gauge:getValue() + self:getMaxValue() / (value + 0.0))
end
java_overload(ProgressCanvas, "addPortion", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)


function ProgressCanvas:addNormalPortion(value, text)
        if not rawequal(self.text, text) then
            PreLogUtil.put(text, self, self.ADD_PORTION)
        end
        self:setText(text)
        self.gauge:setValue(self.gauge:getValue() + self:getMaxValue() / (value + 0.0))
end
java_overload(ProgressCanvas, "addNormalPortion", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") end)


function ProgressCanvas:setValue(value)
        self.value = (value + 0.0)
        self.gauge:setValue((value + 0.0))
end
java_overload(ProgressCanvas, "setValue", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ProgressCanvas:paint(graphics)
        self.paintable:paint(graphics)
end
java_overload(ProgressCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function ProgressCanvas:paint2(graphics)
        self.myFontProcessor:process(graphics)
        graphics:setColor(math.tointeger(self.backgroundBasicColor // 1))
        graphics:fillRect(0, 0, self.displayInfo:getLastWidth(), self.displayInfo:getLastHeight())
        self.gauge:paintXY(graphics, 0, 0)
        self.hasPainted = true
end
java_overload(ProgressCanvas, "paint2", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function ProgressCanvas:paintThreed(graphics)
end
java_overload(ProgressCanvas, "paintThreed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function ProgressCanvas:getValue()
        return self.value
end
java_overload(ProgressCanvas, "getValue", 0)


function ProgressCanvas:setText(text)
        self.text = text
end
java_overload(ProgressCanvas, "setText", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function ProgressCanvas:getText()
        return self.text
end
java_overload(ProgressCanvas, "getText", 0)


function ProgressCanvas:setBackground(background)
        self.background = background
end
java_overload(ProgressCanvas, "setBackground", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function ProgressCanvas:isBackground()
        return self.background
end
java_overload(ProgressCanvas, "isBackground", 0)

return ProgressCanvas

