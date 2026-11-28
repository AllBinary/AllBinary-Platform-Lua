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
-- package org.allbinary.input.automation.module.generic

local SavedCaptureImagesWorker = {}
package.loaded["org.allbinary.input.automation.module.generic.SavedCaptureImagesWorker"] = SavedCaptureImagesWorker

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
local File = java_lazy("java.io.File")
-- local ImageIO = require("javax.imageio.ImageIO")
local SavedCaptureGenericProfileDataWorkerType = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType")
local CaptureWorkerInterface = java_lazy("org.allbinary.input.media.image.capture.CaptureWorkerInterface")
local CapturedBufferedImagesCacheSingleton = java_lazy("org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton")
local CapturedImageWorkerResultsEvent = java_lazy("org.allbinary.input.media.image.capture.CapturedImageWorkerResultsEvent")
local ProcessingFrameIndexFactory = java_lazy("org.allbinary.input.media.image.capture.ProcessingFrameIndexFactory")
local ScreenScavangerRobot = java_lazy("org.allbinary.input.media.image.capture.ScreenScavangerRobot")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LongUtil = java_lazy("org.allbinary.logic.java.number.LongUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local MediaDataFactory = java_lazy("org.allbinary.logic.visual.media.MediaDataFactory")
local BufferedImageFrameCacheable = java_lazy("org.allbinary.media.image.cache.BufferedImageFrameCacheable")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")

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

-- class table SavedCaptureImagesWorker is declared before the requires
SavedCaptureImagesWorker.__index = SavedCaptureImagesWorker
SavedCaptureImagesWorker.className = "SavedCaptureImagesWorker"
SavedCaptureImagesWorker.javaClassName = "org.allbinary.input.automation.module.generic.SavedCaptureImagesWorker"
setmetatable(SavedCaptureImagesWorker, {__index = BasicEventHandler})
SavedCaptureImagesWorker.java_implements = " CaptureWorkerInterface "
SavedCaptureImagesWorker.java_interfaces = function() return {CaptureWorkerInterface} end

function SavedCaptureImagesWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.running == nil then self.running = false end
    if self.screenScavangerRobot == nil then self.screenScavangerRobot = nil end
    if self.savedCaptureGenericProfileDataWorkerType == nil then self.savedCaptureGenericProfileDataWorkerType = nil end
end


function SavedCaptureImagesWorker._jinit(self, savedCaptureGenericProfileDataWorkerType)
    java_super_init(BasicEventHandler, self)
    SavedCaptureImagesWorker._init_fields(self)
        self.savedCaptureGenericProfileDataWorkerType = savedCaptureGenericProfileDataWorkerType
        self.screenScavangerRobot = ScreenScavangerRobot.new()
        SavedCaptureImagesWorker.index = ProcessingFrameIndexFactory.next()
    return self
end

function SavedCaptureImagesWorker.new(...)
    local self = setmetatable({}, SavedCaptureImagesWorker)
    SavedCaptureImagesWorker._jinit(self, ...)
    return self
end


-- throws Exception
function SavedCaptureImagesWorker:setThread(thread)
end
java_overload(SavedCaptureImagesWorker, "setThread", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Thread")) end)


function SavedCaptureImagesWorker:isRunning()
        return self.running
end
java_overload(SavedCaptureImagesWorker, "isRunning", 0)


function SavedCaptureImagesWorker:setRunning(running)
        self.running = running
end
java_overload(SavedCaptureImagesWorker, "setRunning", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function SavedCaptureImagesWorker:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            while self:isRunning() do
                timeHelper:setStartTimeTNT()
                local frame = SavedCaptureImagesWorker.index
                local filePathStringBuffer = StringMaker.new()
                filePathStringBuffer:append(self.savedCaptureGenericProfileDataWorkerType:getPath())
                filePathStringBuffer:append(LongUtil.fillIn(tostring(frame)))
                filePathStringBuffer:append(MediaDataFactory.getInstance().JPG:getExtension())
                local filePath = tostring(filePathStringBuffer)
                self.logUtil:putF(require("allbinary_java").to_string("Loading Image File Path: ") .. require("allbinary_java").to_string(filePath), self, self.commonStrings.RUN)
                local file = File.new(filePath)
                if file:isFile() then
                    local bufferedImage = ImageIO.read(file)
                    SavedCaptureImagesWorker.index = SavedCaptureImagesWorker.index + 1
                    CapturedBufferedImagesCacheSingleton.getInstance():add(BufferedImageFrameCacheable.new(bufferedImage, frame))
                    local capturedImageEvent = CapturedImageWorkerResultsEvent.new(self, frame, bufferedImage)
                    self:fireEvent(capturedImageEvent)
                else
                    self.logUtil:putF(require("allbinary_java").to_string("Could Not Load File: ") .. require("allbinary_java").to_string(filePath), self, self.commonStrings.RUN)
                end
                self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
                self:setRunning(false)
            end
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end
java_overload(SavedCaptureImagesWorker, "run", 0)

SavedCaptureImagesWorker.index = 0

return SavedCaptureImagesWorker

