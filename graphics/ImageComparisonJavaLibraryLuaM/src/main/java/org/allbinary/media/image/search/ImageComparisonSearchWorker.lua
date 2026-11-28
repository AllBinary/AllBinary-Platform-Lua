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
-- package org.allbinary.media.image.search

local ImageComparisonSearchWorker = {}
package.loaded["org.allbinary.media.image.search.ImageComparisonSearchWorker"] = ImageComparisonSearchWorker

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
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
local ImageComparisonSearchConstraintsInterface = java_lazy("org.allbinary.media.image.search.ImageComparisonSearchConstraintsInterface")

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

-- class table ImageComparisonSearchWorker is declared before the requires
ImageComparisonSearchWorker.__index = ImageComparisonSearchWorker
ImageComparisonSearchWorker.className = "ImageComparisonSearchWorker"
ImageComparisonSearchWorker.javaClassName = "org.allbinary.media.image.search.ImageComparisonSearchWorker"
setmetatable(ImageComparisonSearchWorker, {__index = BasicEventHandler})
ImageComparisonSearchWorker.java_implements = " ImageComparisonResultsListener "
ImageComparisonSearchWorker.java_interfaces = function() return {ImageComparisonResultsListener} end

function ImageComparisonSearchWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.imageComparisonInfoVector == nil then self.imageComparisonInfoVector = nil end
    if self.index == nil then self.index = 0 end
    if self.running == nil then self.running = false end
    if self.imageSearchConstraintsInterface == nil then self.imageSearchConstraintsInterface = nil end
end


function ImageComparisonSearchWorker._jinit(self, imageSearchConstraintsInterface)
    java_super_init(BasicEventHandler, self)
    ImageComparisonSearchWorker._init_fields(self)
        self.imageComparisonInfoVector = BasicArrayListD.new()
        self.imageSearchConstraintsInterface = imageSearchConstraintsInterface
    return self
end

function ImageComparisonSearchWorker.new(...)
    local self = setmetatable({}, ImageComparisonSearchWorker)
    ImageComparisonSearchWorker._jinit(self, ...)
    return self
end


function ImageComparisonSearchWorker:onImageComparisonResultsEvent(imageComparisonResultsEvent)
        self.imageComparisonInfoVector:add(imageComparisonResultsEvent:getImageComparisonResult())
        self:run()
end
java_overload(ImageComparisonSearchWorker, "onImageComparisonResultsEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageComparisonResultsEvent")) end)


function ImageComparisonSearchWorker:onEvent(allBinaryEventObject)
        self:onImageComparisonResultsEvent(allBinaryEventObject)
end
java_overload(ImageComparisonSearchWorker, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function ImageComparisonSearchWorker:isRunning()
        return self.running
end
java_overload(ImageComparisonSearchWorker, "isRunning", 0)


function ImageComparisonSearchWorker:setRunning(running)
        self.running = running
end
java_overload(ImageComparisonSearchWorker, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function ImageComparisonSearchWorker:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local imageComparisonInfo = self.imageComparisonInfoVector:get(0)
            self.logUtil:putF(tostring(imageComparisonInfo), self, self.commonStrings.RUN)
            local latestBufferedImage = imageComparisonInfo:getBufferedImages()[2]
            self.imageComparisonInfoVector:remove(imageComparisonInfo)
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
java_overload(ImageComparisonSearchWorker, "run", 0)

return ImageComparisonSearchWorker

