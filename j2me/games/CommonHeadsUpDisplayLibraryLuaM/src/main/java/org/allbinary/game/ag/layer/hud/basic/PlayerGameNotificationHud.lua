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
-- package org.allbinary.game.ag.layer.hud.basic

local PlayerGameNotificationHud = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.PlayerGameNotificationHud"] = PlayerGameNotificationHud

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
local GameAdStateFactory = java_lazy("org.allbinary.business.advertisement.GameAdStateFactory")
local Processor = java_lazy("org.allbinary.canvas.Processor")
local GameAdState = java_lazy("org.allbinary.game.GameAdState")
local GameNotification = java_lazy("org.allbinary.game.ag.layer.hud.basic.notification.GameNotification")
local GameNotificationHud = require("org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud")
local GameNotificationEventHandler = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CustomGPoint = java_lazy("org.allbinary.graphics.CustomGPoint")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local NextUnremoveableProcessor = java_lazy("org.allbinary.game.ag.layer.hud.basic.NextUnremoveableProcessor")
local SetAndRemoveProcessor = java_lazy("org.allbinary.game.ag.layer.hud.basic.SetAndRemoveProcessor")

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

-- class table PlayerGameNotificationHud is declared before the requires
PlayerGameNotificationHud.__index = PlayerGameNotificationHud
PlayerGameNotificationHud.className = "PlayerGameNotificationHud"
PlayerGameNotificationHud.javaClassName = "org.allbinary.game.ag.layer.hud.basic.PlayerGameNotificationHud"
setmetatable(PlayerGameNotificationHud, {__index = GameNotificationHud})
PlayerGameNotificationHud.java_implements = " UpdateMyFontInterface "
PlayerGameNotificationHud.java_interfaces = function() return {UpdateMyFontInterface} end

function PlayerGameNotificationHud:_init_fields()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(0)
    if self.circularIndexUtil == nil then self.circularIndexUtil = nil end
    self.gameNotification = GameNotification.new()
    self.permanentGameNotification = GameNotification.new()
    self.setAndRemoveProcessor = SetAndRemoveProcessor.new(self)
    self.nextUnremoveableProcessor = NextUnremoveableProcessor.new(self)
    self.processor = Processor.getInstance()
    self.PERMANENT_GAME_NOTIFICATION = "Permanent Game Notification: "
    self.lastString = StringUtil.getInstance().EMPTY_STRING
    self.string_ = self.EMPTY_STRING
    self.point = CustomGPoint.NULL_CUSTOM_POINT
    if self.width == nil then self.width = 0 end
end


function PlayerGameNotificationHud._jinit(self, location, direction, bufferZone, basicColor)
    java_super_init(GameNotificationHud, self, location, direction, bufferZone, basicColor)
    PlayerGameNotificationHud._init_fields(self)
        -- super(...) made self above
        self.circularIndexUtil = CircularIndexUtil.createInstance(0)
        local gameNotificationEventHandler = GameNotificationEventHandler.getInstance()
        gameNotificationEventHandler:removeAllListeners()
        gameNotificationEventHandler:addListenerInterface(self)
    return self
end

function PlayerGameNotificationHud.new(...)
    local self = setmetatable({}, PlayerGameNotificationHud)
    PlayerGameNotificationHud._jinit(self, ...)
    return self
end


function PlayerGameNotificationHud:updateMeasurement(graphics)
        local try_ok, try_error, try_value = pcall(function()
            java_super(GameNotificationHud, "updateMeasurement", 1)(self, graphics)
            local font = graphics:getFont()
            self.width = font:stringWidth(self.string_)
            self.processor:process()
            self.processor = Processor.getInstance()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, commonStrings.UPDATE, e)
        end
end
java_overload(PlayerGameNotificationHud, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function PlayerGameNotificationHud:getPoint(x, y)
        self.point = CustomGPoint.getInstance3(0, 0)
        self.point:setX(x)
        self.point:setY(y)
        return self.point
end
java_overload(PlayerGameNotificationHud, "getPoint", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function PlayerGameNotificationHud:add(string_, seconds, basicColor, permanent)
        if permanent then
            if not rawequal(self.lastString, string_) then
                self.lastString = string_
                self.logUtil:putF(tostring(StringMaker.new():append(self.PERMANENT_GAME_NOTIFICATION):append(string_)), self, self.commonStrings.ADD)
            end
            self.permanentGameNotification:add(string_, seconds, basicColor)
            self.circularIndexUtil:setSize(self.permanentGameNotification:getSize())
        else
            self.gameNotification:add(string_, seconds, basicColor)
        end
end
java_overload(PlayerGameNotificationHud, "add", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or math.type(java_a2) == "integer") and (java_a3 == nil or java_is(java_a3, "BasicColor")) and (java_a4 == nil or type(java_a4) == "boolean") end)


-- throws Exception
function PlayerGameNotificationHud:processTick()
        if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            local gameAdState = GameAdStateFactory.getInstance():getCurrentInstance()
            if gameAdState:isShowingAtLocation(self:getLocation()) then
                self.offsetY = -54
            else
                self.offsetY = 0
            end
            if self.gameNotification:getSize() > 0 then
                self:setAndRemove()
            elseif self.permanentGameNotification:getSize() > 0 then
                self:setNextUnremoveable()
            else
                self.string_ = self.EMPTY_STRING
            end
        end
end
java_overload(PlayerGameNotificationHud, "processTick", 0)


-- throws Exception
function PlayerGameNotificationHud:setAndRemove()
        self.string_ = self.gameNotification.stringList:removeAt(0)
        self.processor = self.setAndRemoveProcessor
end
java_overload(PlayerGameNotificationHud, "setAndRemove", 0)


-- throws Exception
function PlayerGameNotificationHud:setAndRemoveProcess()
        self:setX((((self.displayInfo:getLastWidth() - self.width)) // (1 << (1))))
        self.point:setX(self:getX())
        self.point:setY(self:getY())
        local time = self.gameNotification.timeList:removeAt(0)
        local iTime = require("allbinary_java").number_value(time, "intValue") * 1000
        if rawequal(iTime, 0) then
            iTime = 500
        end
        self.timeDelayHelper.delay = iTime
        self:setBasicColorP(self.gameNotification.colorList:removeAt(0))
end
java_overload(PlayerGameNotificationHud, "setAndRemoveProcess", 0)


-- throws Exception
function PlayerGameNotificationHud:setNextUnremoveable()
        local index = self.circularIndexUtil:getIndex()
        self.string_ = self.permanentGameNotification.stringList.objectArray[index + 1]
        self.processor = self.nextUnremoveableProcessor
end
java_overload(PlayerGameNotificationHud, "setNextUnremoveable", 0)


-- throws Exception
function PlayerGameNotificationHud:setNextUnremoveableProcess()
        local index = self.circularIndexUtil:getIndex()
        self:setX((((self.displayInfo:getLastWidth() - self.width)) // (1 << (1))))
        self.point:setX(self:getX())
        self.point:setY(self:getY())
        local time = self.permanentGameNotification.timeList.objectArray[index + 1]
        self.timeDelayHelper.delay = require("allbinary_java").number_value(time, "intValue") * 1000
        self:setBasicColorP(self.permanentGameNotification.colorList.objectArray[index + 1])
        self.circularIndexUtil:next()
end
java_overload(PlayerGameNotificationHud, "setNextUnremoveableProcess", 0)


function PlayerGameNotificationHud:clear()
        self.gameNotification:clear()
        self.permanentGameNotification:clear()
end
java_overload(PlayerGameNotificationHud, "clear", 0)


function PlayerGameNotificationHud:paint(graphics)
        self.myFontProcessor:process(graphics)
        java_super(GameNotificationHud, "paintString", 2)(self, graphics, self.string_)
end
java_overload(PlayerGameNotificationHud, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return PlayerGameNotificationHud

