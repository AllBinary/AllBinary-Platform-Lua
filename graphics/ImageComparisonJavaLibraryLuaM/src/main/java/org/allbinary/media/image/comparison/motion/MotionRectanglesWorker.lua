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
-- package org.allbinary.media.image.comparison.motion

local MotionRectanglesWorker = {}
package.loaded["org.allbinary.media.image.comparison.motion.MotionRectanglesWorker"] = MotionRectanglesWorker

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")
local ImageComparisonResultsEvent = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResultsEvent")
local ImageComparisonResultsListener = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResultsListener")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local AllMotionRectangles = java_lazy("org.allbinary.media.image.comparison.motion.AllMotionRectangles")
local AllMotionRectanglesResultsCacheSingleton = java_lazy("org.allbinary.media.image.comparison.motion.AllMotionRectanglesResultsCacheSingleton")
local ConsolidateMotionRectangles = java_lazy("org.allbinary.media.image.comparison.motion.ConsolidateMotionRectangles")
local ConsolidatedMotionRectanglesResultsCacheSingleton = java_lazy("org.allbinary.media.image.comparison.motion.ConsolidatedMotionRectanglesResultsCacheSingleton")
local ConstrainedMotionRectangles = java_lazy("org.allbinary.media.image.comparison.motion.ConstrainedMotionRectangles")
local ConstrainedMotionRectanglesResultsCacheSingleton = java_lazy("org.allbinary.media.image.comparison.motion.ConstrainedMotionRectanglesResultsCacheSingleton")
local MotionRectangleConstraintsInterface = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface")
local MotionRectangles = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangles")
local MotionRectanglesResultsEvent = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsEvent")
local MotionRectanglesResultsFrameCacheable = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsFrameCacheable")

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

-- class table MotionRectanglesWorker is declared before the requires
MotionRectanglesWorker.__index = MotionRectanglesWorker
MotionRectanglesWorker.className = "MotionRectanglesWorker"
MotionRectanglesWorker.javaClassName = "org.allbinary.media.image.comparison.motion.MotionRectanglesWorker"
setmetatable(MotionRectanglesWorker, {__index = BasicEventHandler})
MotionRectanglesWorker.java_implements = " ImageComparisonResultsListener "
MotionRectanglesWorker.java_interfaces = function() return {ImageComparisonResultsListener} end

function MotionRectanglesWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageComparisonInfoVector = BasicArrayListD.new()
    if self.motionRectangleConstraintsInterface == nil then self.motionRectangleConstraintsInterface = nil end
    if self.index == nil then self.index = 0 end
    if self.running == nil then self.running = false end
end


function MotionRectanglesWorker._jinit(self, motionRectangleConstraintsInterface)
    java_super_init(BasicEventHandler, self)
    MotionRectanglesWorker._init_fields(self)
        self.motionRectangleConstraintsInterface = motionRectangleConstraintsInterface
    return self
end

function MotionRectanglesWorker.new(...)
    local self = setmetatable({}, MotionRectanglesWorker)
    MotionRectanglesWorker._jinit(self, ...)
    return self
end


function MotionRectanglesWorker:onImageComparisonResultsEvent(imageComparisonResultsEvent)
        self.imageComparisonInfoVector:add(imageComparisonResultsEvent)
        self:run()
end
java_overload(MotionRectanglesWorker, "onImageComparisonResultsEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageComparisonResultsEvent")) end)


function MotionRectanglesWorker:onEvent(allBinaryEventObject)
        self:onImageComparisonResultsEvent(allBinaryEventObject)
end
java_overload(MotionRectanglesWorker, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function MotionRectanglesWorker:isRunning()
        return self.running
end
java_overload(MotionRectanglesWorker, "isRunning", 0)


function MotionRectanglesWorker:setRunning(running)
        self.running = running
end
java_overload(MotionRectanglesWorker, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function MotionRectanglesWorker:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local imageComparisonResultsEvent = self.imageComparisonInfoVector:get(0)
            local imageComparisonInfo = imageComparisonResultsEvent:getImageComparisonResult()
            self.logUtil:putF(tostring(imageComparisonInfo), self, self.commonStrings.RUN)
            local allMotionRectangles = AllMotionRectangles.new(imageComparisonInfo)
            AllMotionRectanglesResultsCacheSingleton.getInstance():add(MotionRectanglesResultsFrameCacheable.new(allMotionRectangles, imageComparisonInfo:getFrameTwo()))
            local consolidatedMotionRectangles = ConsolidateMotionRectangles.new(allMotionRectangles)
            ConsolidatedMotionRectanglesResultsCacheSingleton.getInstance():add(MotionRectanglesResultsFrameCacheable.new(consolidatedMotionRectangles, imageComparisonInfo:getFrameTwo()))
            local constrainedMotionRectangles = ConstrainedMotionRectangles.new(self.motionRectangleConstraintsInterface, consolidatedMotionRectangles)
            constrainedMotionRectangles:applyMotionRectangleConstraints(consolidatedMotionRectangles)
            ConstrainedMotionRectanglesResultsCacheSingleton.getInstance():add(MotionRectanglesResultsFrameCacheable.new(constrainedMotionRectangles, imageComparisonInfo:getFrameTwo()))
            self:fireEvent(MotionRectanglesResultsEvent.new(self, imageComparisonInfo:getFrameTwo(), constrainedMotionRectangles))
            self.imageComparisonInfoVector:remove(imageComparisonResultsEvent)
            self.index = self.index + 1
            self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
            self:setRunning(false)
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end
java_overload(MotionRectanglesWorker, "run", 0)

return MotionRectanglesWorker

