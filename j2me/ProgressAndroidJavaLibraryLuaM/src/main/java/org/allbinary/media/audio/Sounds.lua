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
-- package org.allbinary.media.audio

local Sounds = {}
package.loaded["org.allbinary.media.audio.Sounds"] = Sounds

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

local Player = java_lazy("javax.microedition.media.Player")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local SoundStrings = java_lazy("org.allbinary.media.audio.SoundStrings")
local SoundsFactoryInterface = java_lazy("org.allbinary.media.audio.SoundsFactoryInterface")

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

-- class table Sounds is declared before the requires
Sounds.__index = Sounds
Sounds.className = "Sounds"
Sounds.javaClassName = "org.allbinary.media.audio.Sounds"

function Sounds:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.soundStrings = SoundStrings.getInstance()
    if self.soundsFactoryInterface == nil then self.soundsFactoryInterface = nil end
end


function Sounds._jinit(self, soundsFactoryInterface)
    Sounds._init_fields(self)
        self.soundsFactoryInterface = soundsFactoryInterface
    return self
end

function Sounds.new(...)
    local self = setmetatable({}, Sounds)
    Sounds._jinit(self, ...)
    return self
end


-- throws Exception
function Sounds:init()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.INIT)
        local commonLabels = CommonLabels.getInstance()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        self.soundsFactoryInterface:init()
        local soundInterfaceArray = self.soundsFactoryInterface:getSoundInterfaceArray()
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local indexInteger = nil
        local indexString = nil
        local stringBuffer = StringMaker.new()
        for i = 0, (soundInterfaceArray.n or #soundInterfaceArray) - 1 do
            local soundInterfaceCanBeNull = soundInterfaceArray[i + 1]
            if not rawequal(soundInterfaceCanBeNull, nil) then
                indexInteger = smallIntegerSingletonFactory:getAt(i)
                indexString = tostring(indexInteger)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(commonLabels.INDEX_LABEL)
                stringBuffer:append(indexString)
                stringBuffer:append(self.soundStrings.SOUND)
                stringBuffer:append((getmetatable(soundInterfaceCanBeNull).javaClassName or getmetatable(soundInterfaceCanBeNull).className))
                self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.INIT)
                soundInterfaceCanBeNull:init()
                progressCanvas:addNormalPortion(100, tostring(StringMaker.new():append(self.soundStrings.INIT_SOUND):append(indexString)))
            end
        end
        self.soundsFactoryInterface:setInitialized(true)
        self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.INIT)
end


-- throws Exception
function Sounds:stopAll()
        self.logUtil:putF(self.commonStrings.START, self, self.soundStrings.STOP_ALL)
        local soundInterfaceArray = self.soundsFactoryInterface:getSoundInterfaceArray()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        local player = nil
        for index = 0, (soundInterfaceArray.n or #soundInterfaceArray) - 1 do
            if not rawequal(soundInterfaceArray[index + 1], nil) then
                player = soundInterfaceArray[index + 1]:getPlayerP()
                if not rawequal(player, nil) then
                    player:stop()
                    progressCanvas:addPortion(100, self.soundStrings.STOPPING_SOUND, index)
                end
            end
        end
end


-- throws Exception
function Sounds:closeAll()
        self.logUtil:putF(self.commonStrings.START, self, self.soundStrings.CLOSE_ALL)
        local soundInterfaceArray = self.soundsFactoryInterface:getSoundInterfaceArray()
        local progressCanvas = ProgressCanvasFactory.getInstance()
        local player = nil
        for index = 0, (soundInterfaceArray.n or #soundInterfaceArray) - 1 do
            if not rawequal(soundInterfaceArray[index + 1], nil) then
                player = soundInterfaceArray[index + 1]:getPlayerP()
                if not rawequal(player, nil) then
                    player:close()
                    progressCanvas:addPortion(100, self.soundStrings.CLOSING_SOUND, index)
                end
            end
        end
end

return Sounds

