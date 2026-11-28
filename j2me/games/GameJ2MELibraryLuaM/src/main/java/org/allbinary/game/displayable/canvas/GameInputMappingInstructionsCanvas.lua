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
-- package org.allbinary.game.displayable.canvas

local GameInputMappingInstructionsCanvas = {}
package.loaded["org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas"] = GameInputMappingInstructionsCanvas

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
local CommandListener = java_lazy("javax.microedition.lcdui.CommandListener")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local ColorFillBasePaintable = java_lazy("org.allbinary.game.paint.ColorFillBasePaintable")
local ColorFillPaintableFactory = java_lazy("org.allbinary.game.paint.ColorFillPaintableFactory")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local DrawStringUtil = java_lazy("org.allbinary.graphics.draw.DrawStringUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local GameCommandCanvas = require("org.allbinary.game.displayable.canvas.GameCommandCanvas")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table GameInputMappingInstructionsCanvas is declared before the requires
GameInputMappingInstructionsCanvas.__index = GameInputMappingInstructionsCanvas
GameInputMappingInstructionsCanvas.className = "GameInputMappingInstructionsCanvas"
GameInputMappingInstructionsCanvas.javaClassName = "org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas"
setmetatable(GameInputMappingInstructionsCanvas, {__index = GameCommandCanvas})

function GameInputMappingInstructionsCanvas:_init_fields()
    self.drawStringUtil = DrawStringUtil.getInstance()
    self.TITLE = "Input Instructions"
    self.instructions = {"Add Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the '1' key to select the Fire action)", "2. Make the newly desired input for the selected action.", "(Example: Press 'f' to add it to the selected action)", "Note: If the input is already mapped to another action then it will not be added. You", "will need to deleted from the other action before adding it to another.", "Warning: Not all keys map for a given platform and show as Unknown.", StringUtil.getInstance().EMPTY_STRING, "Remove Input Mapping:", "1. Select the desired action by generating a currently defined input for a given action.", "(Example: Press the key '1' to select the Fire action)", "2. Select a mapped input for the selected action.", "(Example: Press the key '1' to select the '1' key input for the selected Fire action)", "3. Press the Delete Key."}
    if self.colorFillPaintable == nil then self.colorFillPaintable = nil end
    self.anchor = Anchor.TOP_LEFT
end


function GameInputMappingInstructionsCanvas._jinit(self, commandListener, allBinaryGameLayerManager)
    java_super_init(GameCommandCanvas, self, commandListener, GameInputMappingInstructionsCanvas.NAME, allBinaryGameLayerManager:getBackgroundBasicColor(), allBinaryGameLayerManager:getForegroundBasicColor())
    GameInputMappingInstructionsCanvas._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self.colorFillPaintable = ColorFillPaintableFactory.getInstance():getInstance(allBinaryGameLayerManager:getBackgroundBasicColor(), false)
    return self
end

function GameInputMappingInstructionsCanvas.new(...)
    local self = setmetatable({}, GameInputMappingInstructionsCanvas)
    GameInputMappingInstructionsCanvas._jinit(self, ...)
    return self
end


function GameInputMappingInstructionsCanvas:initCommands(cmdListener)
        self:removeAllCommands()
        self:addCommand(GameInputMappingInstructionsCanvas.CLOSE)
        self:setCommandListener(cmdListener)
end
java_overload(GameInputMappingInstructionsCanvas, "initCommands", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "CommandListener")) end)


function GameInputMappingInstructionsCanvas:paint(graphics)
        self.myFontProcessor:process(graphics)
        self.colorFillPaintable:paint(graphics)
        local halfWidth = self.displayInfo:getLastHalfWidth()
        local beginWidth = (((graphics:getFont():stringWidth(self.TITLE)) // (1 << (1))))
        graphics:setColor(self.foregroundColor)
        graphics:drawString(self.TITLE, halfWidth - beginWidth, self.fontHeight, self.anchor)
        self.drawStringUtil:drawCenterStrings(graphics, self.instructions, self.displayInfo:getLastWidth(), self.fontHeight, halfWidth, 3 * self.fontHeight)
        java_super(GameCommandCanvas, "paint", 1)(self, graphics)
end
java_overload(GameInputMappingInstructionsCanvas, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

GameInputMappingInstructionsCanvas.DISPLAY = Command.new("Help", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
GameInputMappingInstructionsCanvas.CLOSE = Command.new("Close", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
GameInputMappingInstructionsCanvas.NAME = "GameInputMappingInstructionsCanvas"

return GameInputMappingInstructionsCanvas

