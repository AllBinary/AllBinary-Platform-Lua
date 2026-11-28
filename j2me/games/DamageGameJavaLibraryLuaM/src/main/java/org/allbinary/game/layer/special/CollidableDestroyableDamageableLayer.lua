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
-- package org.allbinary.game.layer.special

local CollidableDestroyableDamageableLayer = {}
package.loaded["org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer"] = CollidableDestroyableDamageableLayer

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local CollidableNeverCollideBehaviorFactory = java_lazy("org.allbinary.game.collision.CollidableNeverCollideBehaviorFactory")
local DamageableInterface = java_lazy("org.allbinary.game.combat.damage.DamageableInterface")
local DestroyableInterface = java_lazy("org.allbinary.game.combat.destroy.DestroyableInterface")
local DestroyedEvent = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local BasicGroupFactory = java_lazy("org.allbinary.game.identification.BasicGroupFactory")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local PickedUpLayerInterfaceFactoryInterface = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local PickupBehavior = java_lazy("org.allbinary.game.layer.pickup.PickupBehavior")
local PickupCompositeInterface = java_lazy("org.allbinary.game.layer.pickup.PickupCompositeInterface")
local PartInterface = java_lazy("org.allbinary.game.part.PartInterface")
local PartInterfaceUtil = java_lazy("org.allbinary.game.part.PartInterfaceUtil")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local PositionStrings = java_lazy("org.allbinary.math.PositionStrings")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local ViewPositionBase = java_lazy("org.allbinary.view.ViewPositionBase")
local SpecialGameInputInterface = require("org.allbinary.game.layer.special.SpecialGameInputInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

-- class table CollidableDestroyableDamageableLayer is declared before the requires
CollidableDestroyableDamageableLayer.__index = CollidableDestroyableDamageableLayer
CollidableDestroyableDamageableLayer.className = "CollidableDestroyableDamageableLayer"
CollidableDestroyableDamageableLayer.javaClassName = "org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer"
setmetatable(CollidableDestroyableDamageableLayer, {__index = CollidableCompositeLayer})
CollidableDestroyableDamageableLayer.java_implements = " DestroyableInterface DamageableInterface PickupCompositeInterface SpecialGameInputInterface "
CollidableDestroyableDamageableLayer.java_interfaces = function() return {DestroyableInterface, DamageableInterface, PickupCompositeInterface, SpecialGameInputInterface} end

function CollidableDestroyableDamageableLayer:_init_fields()
    if self.groupInterface == nil then self.groupInterface = nil end
    if self.readyForExplosion == nil then self.readyForExplosion = false end
    if self.initWidth == nil then self.initWidth = 0 end
    if self.initHeight == nil then self.initHeight = 0 end
    if self.initX == nil then self.initX = 0 end
    if self.initY == nil then self.initY = 0 end
    if self.initZ == nil then self.initZ = 0 end
    self.partInterfaceArrayP = PartInterfaceUtil.getZeroArray()
    if self.pickupBehavior == nil then self.pickupBehavior = nil end
    self.allBinaryGameLayerManagerP = AllBinaryGameLayerManager.getNullInstance()
    self.isDraggable = false
    self.isDragged = false
    self.isDropped = false
end


function CollidableDestroyableDamageableLayer.getNullInstance()
        if rawequal(CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER, NullUtil.getInstance().NULL_OBJECT) then
            CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER = CollidableDestroyableDamageableLayer.new(BasicGroupFactory.getInstance().NONE_ARRAY, StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPositionBase.NULL_VIEW_POSITION)
        end
        return CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER
end


function CollidableDestroyableDamageableLayer._jinit(self, groupInterface, name, layerInfo, viewPosition)
    java_super_init(CollidableCompositeLayer, self, name, layerInfo, viewPosition, CollidableNeverCollideBehaviorFactory.getInstance())
    CollidableDestroyableDamageableLayer._init_fields(self)
        -- super(...) made self above
        self.initWidth = layerInfo:getWidth()
        self.initHeight = layerInfo:getHeight()
        self.groupInterface = groupInterface
        self.pickupBehavior = PickupBehavior.getNullInstance()
    return self
end

function CollidableDestroyableDamageableLayer.new(...)
    local self = setmetatable({}, CollidableDestroyableDamageableLayer)
    CollidableDestroyableDamageableLayer._jinit(self, ...)
    return self
end


-- throws Exception
function CollidableDestroyableDamageableLayer:initPosition()
        self:setPosition(self.initX, self.initY, self.initZ)
end
java_overload(CollidableDestroyableDamageableLayer, "initPosition", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:initPositionXYZ(x, y, z)
        self.initX = x
        self.initY = y
        self.initZ = z
end
java_overload(CollidableDestroyableDamageableLayer, "initPositionXYZ", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


function CollidableDestroyableDamageableLayer:paint(graphics)
        java_super(CollidableCompositeLayer, "paint", 1)(self, graphics)
end
java_overload(CollidableDestroyableDamageableLayer, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:damage(damage, damageType)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(CollidableDestroyableDamageableLayer, "damage", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


-- throws Exception
function CollidableDestroyableDamageableLayer:getDamage(damageType)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(CollidableDestroyableDamageableLayer, "getDamage", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function CollidableDestroyableDamageableLayer:isDestroyed()
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
java_overload(CollidableDestroyableDamageableLayer, "isDestroyed", 0)


function CollidableDestroyableDamageableLayer:getGroupInterface()
        return self.groupInterface
end
java_overload(CollidableDestroyableDamageableLayer, "getGroupInterface", 0)


function CollidableDestroyableDamageableLayer:setGroupInterface(teamInterface)
        self.groupInterface = teamInterface
end
java_overload(CollidableDestroyableDamageableLayer, "setGroupInterface", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        self.allBinaryGameLayerManagerP = allBinaryGameLayerManager
        if rawequal(self.allBinaryGameLayerManagerP, nil) then
            error(require("java.lang.RuntimeException").new(), 0)
        end
end
java_overload(CollidableDestroyableDamageableLayer, "setAllBinaryGameLayerManager", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryGameLayerManager")) end)


function CollidableDestroyableDamageableLayer:isReadyForExplosion()
        return self.readyForExplosion
end
java_overload(CollidableDestroyableDamageableLayer, "isReadyForExplosion", 0)


function CollidableDestroyableDamageableLayer:setReadyForExplosion(isReadyForExplosion)
        self.readyForExplosion = isReadyForExplosion
end
java_overload(CollidableDestroyableDamageableLayer, "setReadyForExplosion", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function CollidableDestroyableDamageableLayer:getInitWidth()
        return self.initWidth
end
java_overload(CollidableDestroyableDamageableLayer, "getInitWidth", 0)


function CollidableDestroyableDamageableLayer:getInitHeight()
        return self.initHeight
end
java_overload(CollidableDestroyableDamageableLayer, "getInitHeight", 0)


function CollidableDestroyableDamageableLayer:getInitX()
        return self.initX
end
java_overload(CollidableDestroyableDamageableLayer, "getInitX", 0)


function CollidableDestroyableDamageableLayer:getInitY()
        return self.initY
end
java_overload(CollidableDestroyableDamageableLayer, "getInitY", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:up()
end
java_overload(CollidableDestroyableDamageableLayer, "up", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:down()
end
java_overload(CollidableDestroyableDamageableLayer, "down", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:right()
end
java_overload(CollidableDestroyableDamageableLayer, "right", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:left()
end
java_overload(CollidableDestroyableDamageableLayer, "left", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:strafeLeft()
end
java_overload(CollidableDestroyableDamageableLayer, "strafeLeft", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:strafeRight()
end
java_overload(CollidableDestroyableDamageableLayer, "strafeRight", 0)


-- throws Exception
function CollidableDestroyableDamageableLayer:fire(layerManager, gameKeyEvent)
end
java_overload(CollidableDestroyableDamageableLayer, "fire", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:special1(layerManager, gameKeyEvent)
end
java_overload(CollidableDestroyableDamageableLayer, "special1", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:special2(layerManager, gameKeyEvent)
end
java_overload(CollidableDestroyableDamageableLayer, "special2", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:special3(layerManager, gameKeyEvent)
end
java_overload(CollidableDestroyableDamageableLayer, "special3", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:special4(layerManager, gameKeyEvent)
end
java_overload(CollidableDestroyableDamageableLayer, "special4", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:special5(layerManager, gameKeyEvent)
end
java_overload(CollidableDestroyableDamageableLayer, "special5", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:upAnalog(yAnalogValue)
end
java_overload(CollidableDestroyableDamageableLayer, "upAnalog", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function CollidableDestroyableDamageableLayer:downAnalog(yAnalogValue)
end
java_overload(CollidableDestroyableDamageableLayer, "downAnalog", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function CollidableDestroyableDamageableLayer:rightAnalog(xAnalogValue)
end
java_overload(CollidableDestroyableDamageableLayer, "rightAnalog", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function CollidableDestroyableDamageableLayer:leftAnalog(xAnalogValue)
end
java_overload(CollidableDestroyableDamageableLayer, "leftAnalog", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function CollidableDestroyableDamageableLayer:rightTrigger(layerManager, gameKeyEvent, xAnalogValue)
end
java_overload(CollidableDestroyableDamageableLayer, "rightTrigger", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) and type(java_a3) == "number" end)


-- throws Exception
function CollidableDestroyableDamageableLayer:leftTrigger(layerManager, gameKeyEvent, xAnalogValue)
end
java_overload(CollidableDestroyableDamageableLayer, "leftTrigger", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) and (java_a2 == nil or java_is(java_a2, "GameKeyEvent")) and type(java_a3) == "number" end)


function CollidableDestroyableDamageableLayer:onDestroyed(destroyedEvent)
end
java_overload(CollidableDestroyableDamageableLayer, "onDestroyed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DestroyedEvent")) end)


function CollidableDestroyableDamageableLayer:getPickupBehavior()
        return self.pickupBehavior
end
java_overload(CollidableDestroyableDamageableLayer, "getPickupBehavior", 0)


function CollidableDestroyableDamageableLayer:setPickupBehavior(pickupBehavior)
        self.pickupBehavior = pickupBehavior
end
java_overload(CollidableDestroyableDamageableLayer, "setPickupBehavior", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PickupBehavior")) end)


-- throws Exception
function CollidableDestroyableDamageableLayer:addPart(pickedUpLayerInterfaceFactoryInterface)
end
java_overload(CollidableDestroyableDamageableLayer, "addPart", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PickedUpLayerInterfaceFactoryInterface")) end)


function CollidableDestroyableDamageableLayer:setPartInterfaceArray(partInterfaceArray)
        self.partInterfaceArrayP = partInterfaceArray
end
java_overload(CollidableDestroyableDamageableLayer, "setPartInterfaceArray", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function CollidableDestroyableDamageableLayer:getPartInterfaceArray()
        return self.partInterfaceArrayP
end
java_overload(CollidableDestroyableDamageableLayer, "getPartInterfaceArray", 0)


function CollidableDestroyableDamageableLayer:toStringAppend(stringBuffer)
        local commonSeps = CommonSeps.getInstance()
        local positionStrings = PositionStrings.getInstance()
        java_super(CollidableCompositeLayer, "toStringAppend", 1)(self, stringBuffer)
        stringBuffer:append(commonSeps.NEW_LINE)
        local groupInterfaceArray = self:getGroupInterface()
        local size = (groupInterfaceArray.n or #groupInterfaceArray)
        for index = 0, size - 1 do
            stringBuffer:append(tostring(groupInterfaceArray[index + 1]))
            stringBuffer:append(commonSeps.COMMA)
        end
        local pickupBehavior = self:getPickupBehavior()
        if not rawequal(pickupBehavior, nil) then
            stringBuffer:append(commonSeps.NEW_LINE)
            stringBuffer:append(tostring(pickupBehavior))
        end
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(CollidableDestroyableDamageableLayer.READYFOREXPLOSION)
        stringBuffer:appendboolean(self.readyForExplosion)
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.commonStrings.INIT)
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:appendint(self.initX)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:appendint(self.initX)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:appendint(self.initZ)
end
java_overload(CollidableDestroyableDamageableLayer, "toStringAppend", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StringMaker")) end)


function CollidableDestroyableDamageableLayer:toString()
        local stringBuffer = StringMaker.new()
        self:toStringAppend(stringBuffer)
        return tostring(stringBuffer)
end
java_overload(CollidableDestroyableDamageableLayer, "toString", 0)
CollidableDestroyableDamageableLayer.__tostring = function(self) return self:toString() end

CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER = NullUtil.getInstance().NULL_OBJECT
CollidableDestroyableDamageableLayer.READYFOREXPLOSION = "ReadyForExplosion: "

return CollidableDestroyableDamageableLayer

