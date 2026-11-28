-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.building

local BuildingInfoHudPaintable = {}
package.loaded["org.allbinary.game.layer.building.BuildingInfoHudPaintable"] = BuildingInfoHudPaintable

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
local NumberStringHud = require("org.allbinary.game.ag.layer.hud.basic.NumberStringHud")
local NumberStringHudFactory = java_lazy("org.allbinary.game.ag.layer.hud.basic.NumberStringHudFactory")
local SelectionHudPaintable = require("org.allbinary.game.layer.SelectionHudPaintable")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BasicHudFactory = java_lazy("org.allbinary.game.graphics.hud.BasicHudFactory")
local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local BuildingLayer = java_lazy("org.allbinary.game.layer.building.BuildingLayer")

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

-- class table BuildingInfoHudPaintable is declared before the requires
BuildingInfoHudPaintable.__index = BuildingInfoHudPaintable
BuildingInfoHudPaintable.className = "BuildingInfoHudPaintable"
BuildingInfoHudPaintable.javaClassName = "org.allbinary.game.layer.building.BuildingInfoHudPaintable"
setmetatable(BuildingInfoHudPaintable, {__index = SelectionHudPaintable})
local BuildingNumberHud = {}
    BuildingNumberHud.__index = BuildingNumberHud
    BuildingNumberHud.className = "BuildingNumberHud"
    BuildingNumberHud.javaClassName = "org.allbinary.game.layer.building.BuildingInfoHudPaintable$BuildingNumberHud"
    setmetatable(BuildingNumberHud, {__index = NumberStringHud})
    BuildingInfoHudPaintable.BuildingNumberHud = BuildingNumberHud

    function BuildingNumberHud:_init_fields()
        if self.baseTextX == nil then self.baseTextX = 0 end
        if self.baseY == nil then self.baseY = 0 end
        if self.row == nil then self.row = 0 end
        if self.prefixLength == nil then self.prefixLength = 0 end
        if self.positionBeforeMeasurement == nil then self.positionBeforeMeasurement = false end
    end
    

    function BuildingNumberHud._jinit(self, label, maximum, basicHudFactory, basicColor, baseTextX, baseY, row, prefixLength, positionBeforeMeasurement)
        java_super_init(NumberStringHud, self, label, maximum, basicHudFactory.ABSOLUTE, basicHudFactory.HORIZONTAL, 0, basicColor)
        BuildingNumberHud._init_fields(self)
            -- super(...) made self above
            self.baseTextX = baseTextX
            self.baseY = baseY
            self.row = row
            self.prefixLength = prefixLength
            self.positionBeforeMeasurement = positionBeforeMeasurement
        return self
    end

    function BuildingNumberHud.new(...)
        local self = setmetatable({}, BuildingNumberHud)
        BuildingNumberHud._jinit(self, ...)
        return self
    end
    

    function BuildingNumberHud:updateMeasurement(graphics)
            if not (self.positionBeforeMeasurement) then
                java_super(NumberStringHud, "updateMeasurement", 1)(self, graphics)
            end
            local font = graphics:getFont()
            self.updateMaxWidth = self.baseTextX + self.prefixLength * font:getHeight()
            self.updateMaxHeight = self.baseY + self.row * font:getHeight()
            if self.positionBeforeMeasurement then
                java_super(NumberStringHud, "updateMeasurement", 1)(self, graphics)
            end
    end
    java_overload(BuildingNumberHud, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function BuildingInfoHudPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.HEALTH = "Health:"
    if self.productivityHud == nil then self.productivityHud = nil end
    if self.efficiencyHud == nil then self.efficiencyHud = nil end
    if self.healthHud == nil then self.healthHud = nil end
    if self.maxHealthHud == nil then self.maxHealthHud = nil end
    self.rtsLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    self.currentHealth = 0
end


function BuildingInfoHudPaintable.getInstance()
        return BuildingInfoHudPaintable.instance_f
end


function BuildingInfoHudPaintable._jinit(self)
    java_super_init(SelectionHudPaintable, self)
    BuildingInfoHudPaintable._init_fields(self)
        local numberStringHudFactory = NumberStringHudFactory.getInstance()
        local productivityHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local efficiencyHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local healthHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local maxHealthHud = numberStringHudFactory.NULL_NUMBER_STRING_HUD
        local try_ok, try_error, try_value = pcall(function()
            local basicHudFactory = BasicHudFactory.getInstance()
            local basicColor = self:getBasicColorP()
            local textX = self.textX
            local y = self.y
            productivityHud = BuildingNumberHud.new("Productivity:", 999, basicHudFactory, basicColor, textX, y, 1, 0, true)
            efficiencyHud = BuildingNumberHud.new("Efficiency:", 999, basicHudFactory, basicColor, textX, y, 2, 0, false)
            healthHud = BuildingNumberHud.new(self.HEALTH, 99999, basicHudFactory, basicColor, textX, y, 3, 0, true)
            maxHealthHud = BuildingNumberHud.new("/ ", 99999, basicHudFactory, basicColor, textX, y, 3, #self.HEALTH + 1, false)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
        self.productivityHud = productivityHud
        self.efficiencyHud = efficiencyHud
        self.healthHud = healthHud
        self.maxHealthHud = maxHealthHud
    return self
end

function BuildingInfoHudPaintable.new(...)
    local self = setmetatable({}, BuildingInfoHudPaintable)
    BuildingInfoHudPaintable._jinit(self, ...)
    return self
end


function BuildingInfoHudPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        local totalLength = #self.HEALTH + MathUtil.getInstance():getTotalDigits(self.currentHealth)
        self.maxHealthHud:setX(self.textX + MyFontProcessor.defaultStringWidth(font, totalLength))
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(BuildingInfoHudPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function BuildingInfoHudPaintable:setBasicColorP(basicColor)
        java_super(SelectionHudPaintable, "setBasicColorP", 1)(self, basicColor)
        self.productivityHud:setBasicColorP(basicColor)
        self.efficiencyHud:setBasicColorP(basicColor)
        self.healthHud:setBasicColorP(basicColor)
        self.maxHealthHud:setBasicColorP(basicColor)
end
java_overload(BuildingInfoHudPaintable, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function BuildingInfoHudPaintable:paint(graphics)
        java_super(SelectionHudPaintable, "paint", 1)(self, graphics)
        self.myFontProcessor:process(graphics)
        self.productivityHud:paint(graphics)
        self.efficiencyHud:paint(graphics)
        self.healthHud:paint(graphics)
        self.maxHealthHud:paint(graphics)
        self:getAnimationInterface():paintXY(graphics, self.imageX, self.y)
end
java_overload(BuildingInfoHudPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function BuildingInfoHudPaintable:updateSelectionInfo()
        local buildingLayer = self.rtsLayer
        self:setName(buildingLayer:getName())
        self:setAnimationInterface(buildingLayer:getVerticleBuildAnimationInterface())
        self.productivityHud:set(buildingLayer:getProductivity())
        self.efficiencyHud:set(buildingLayer:getEfficiency() / 100)
        self.currentHealth = buildingLayer:getHealthInterface():getHealth()
        self.healthHud:set(self.currentHealth)
        self.myFontProcessor = self.updateMyFontProcessor
        self.maxHealthHud:set(buildingLayer:getHealthInterface():getMaxHealth())
end
java_overload(BuildingInfoHudPaintable, "updateSelectionInfo", 0)


function BuildingInfoHudPaintable:setRtsLayer(rtsLayer)
        self.rtsLayer = rtsLayer
end
java_overload(BuildingInfoHudPaintable, "setRtsLayer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PathFindingLayerInterface")) end)

BuildingInfoHudPaintable.instance_f = BuildingInfoHudPaintable.new()

return BuildingInfoHudPaintable

