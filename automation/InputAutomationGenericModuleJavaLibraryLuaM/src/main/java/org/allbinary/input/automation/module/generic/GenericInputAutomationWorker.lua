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

local GenericInputAutomationWorker = {}
package.loaded["org.allbinary.input.automation.module.generic.GenericInputAutomationWorker"] = GenericInputAutomationWorker

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

local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AbstractInputAutomationWorker = require("org.allbinary.input.automation.module.AbstractInputAutomationWorker")
local InputAutomationActionInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationActionInterface")
local GenericProfile = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local GenericProfileDataWorkerType = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")
local GenericProfileAction = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction")
local GenericProfileActionScript = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript")
local CapturedBufferedImagesCacheSingleton = java_lazy("org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local J2SECacheInterface = java_lazy("org.allbinary.logic.util.cache.J2SECacheInterface")
local ImageComparatorConstraintsInterface = java_lazy("org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface")
local ImageComparisonWorker = java_lazy("org.allbinary.media.image.comparison.ImageComparisonWorker")
local MotionRectangleConstraintsInterface = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface")
local MotionRectanglesWorker = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesWorker")
local CaptureWorkerUtil = java_lazy("org.allbinary.input.automation.module.generic.CaptureWorkerUtil")
local GenericProfileCaptureWorkerFactory = java_lazy("org.allbinary.input.automation.module.generic.GenericProfileCaptureWorkerFactory")

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

-- class table GenericInputAutomationWorker is declared before the requires
GenericInputAutomationWorker.__index = GenericInputAutomationWorker
GenericInputAutomationWorker.className = "GenericInputAutomationWorker"
GenericInputAutomationWorker.javaClassName = "org.allbinary.input.automation.module.generic.GenericInputAutomationWorker"
setmetatable(GenericInputAutomationWorker, {__index = AbstractInputAutomationWorker})

function GenericInputAutomationWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.PROCESS_DATA_WORKER_RESULTS = "processDataWorkerResults"
    self.lastFrame = -1
    if self.frame == nil then self.frame = nil end
    if self.genericProfile == nil then self.genericProfile = nil end
end


function GenericInputAutomationWorker._jinit(self, inputAutomationActionInterface, genericProfile, motionRectangleConstraintsInterface, imageComparatorConstraintsInterface)
    java_super_init(AbstractInputAutomationWorker, self, inputAutomationActionInterface)
    GenericInputAutomationWorker._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:setCaptureWorker(GenericProfileCaptureWorkerFactory.getInstance(genericProfile))
        self:setInputAutomationActionInterface(inputAutomationActionInterface)
        self:setImageComparisonWorker(ImageComparisonWorker.new(imageComparatorConstraintsInterface))
        self:setMotionRectanglesWorker(MotionRectanglesWorker.new(motionRectangleConstraintsInterface))
        self:setGenericProfile(genericProfile)
        local vector = self:getGenericProfile():getGenericProfileDataWorkerTypeVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local genericProfileDataWorkerType = vector:get(index)
            self.logUtil:putF(require("allbinary_java").to_string("Adding Listener: ") .. require("allbinary_java").to_string(genericProfileDataWorkerType), self, self.commonStrings.CONSTRUCTOR)
            if rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.COMPARISON) then
                self:getCaptureWorker():addListenerInterface(self:getImageComparisonWorker())
            elseif rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.MOTION) then
                self:getImageComparisonWorker():addListenerInterface(self:getMotionRectanglesWorker())
            end
        end
    return self
end

function GenericInputAutomationWorker.new(...)
    local self = setmetatable({}, GenericInputAutomationWorker)
    GenericInputAutomationWorker._jinit(self, ...)
    return self
end


-- throws Exception
function GenericInputAutomationWorker:processDataWorkerResults()
        self.logUtil:putF(self.commonStrings.START, self, self.PROCESS_DATA_WORKER_RESULTS)
        self:waitForDataWorkers()
        local cacheInterface = CapturedBufferedImagesCacheSingleton.getInstance()
        local keyArray = cacheInterface:keySet():toArray()
        if (keyArray.n or #keyArray) > 0 then
            self.logUtil:putF("Image Available", self, self.PROCESS_DATA_WORKER_RESULTS)
            self:setFrame(keyArray[(keyArray.n or #keyArray) - 1 + 1])
            if self:getFrame() > self.lastFrame then
                self.logUtil:putF(require("allbinary_java").to_string("Processing new frame: ") .. require("allbinary_java").to_string(self:getFrame()), self, self.PROCESS_DATA_WORKER_RESULTS)
                local hashMap = self:getGenericProfile():getGenericProfileActions():getHashMap()
                local set = hashMap:keySet()
                self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string("Processing ") .. require("allbinary_java").to_string(set:size())) .. require("allbinary_java").to_string("Actions"), self, self.PROCESS_DATA_WORKER_RESULTS)
                local actionNameArray = set:toArray()
                local size = (actionNameArray.n or #actionNameArray)
                for index = 0, size - 1 do
                    local actionNameString = actionNameArray[index + 1]
                    self.logUtil:putF(require("allbinary_java").to_string("Processing Action: ") .. require("allbinary_java").to_string(actionNameString), self, self.PROCESS_DATA_WORKER_RESULTS)
                    local genericProfileAction = hashMap:get(actionNameString)
                    local genericProfileActionScript = genericProfileAction:getGenericProfileActionScript()
                    local vector = genericProfileActionScript:getProfileActionConditionInterfaceVector()
                    CaptureWorkerUtil.processProfileActionConditions(vector, self:getFrame())
                end
                self.lastFrame = self:getFrame()
            end
        else
            self.logUtil:putF("Image Not Available", self, self.PROCESS_DATA_WORKER_RESULTS)
        end
end
java_overload(GenericInputAutomationWorker, "processDataWorkerResults", 0)


-- throws Exception
function GenericInputAutomationWorker:process()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.PROCESS)
        self:startDataWorkers()
        self:processDataWorkerResults()
end
java_overload(GenericInputAutomationWorker, "process", 0)


function GenericInputAutomationWorker:getGenericProfile()
        return self.genericProfile
end
java_overload(GenericInputAutomationWorker, "getGenericProfile", 0)


function GenericInputAutomationWorker:setGenericProfile(genericProfile)
        self.genericProfile = genericProfile
end
java_overload(GenericInputAutomationWorker, "setGenericProfile", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GenericProfile")) end)


function GenericInputAutomationWorker:getFrame()
        return self.frame
end
java_overload(GenericInputAutomationWorker, "getFrame", 0)


function GenericInputAutomationWorker:setFrame(frame)
        self.frame = frame
end
java_overload(GenericInputAutomationWorker, "setFrame", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)

return GenericInputAutomationWorker

