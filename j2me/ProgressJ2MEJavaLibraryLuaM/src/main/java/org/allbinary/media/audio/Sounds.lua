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

-- local Player = require("javax.microedition.media.Player")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Sounds = {}
Sounds.__index = Sounds
Sounds.className = "Sounds"

function Sounds:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.soundStrings = SoundStrings.getInstance()
    self.soundsFactoryInterface = nil
end


function Sounds.new(soundsFactoryInterface)
    local self = setmetatable({}, Sounds)
    self:_init_fields()
        self.soundsFactoryInterface = soundsFactoryInterface
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
            local soundInterface = soundInterfaceArray[i + 1]
            if soundInterface ~= nil then
                indexInteger = smallIntegerSingletonFactory:getAt(i)
                indexString = tostring(indexInteger)
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(commonLabels.INDEX_LABEL)
                stringBuffer:append(indexString)
                stringBuffer:append(self.soundStrings.SOUND)
                stringBuffer:append(getmetatable(soundInterface).className)
                self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.INIT)
                soundInterface:init()
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
            if soundInterfaceArray[index + 1] ~= nil then
                player = soundInterfaceArray[index + 1]:getPlayerP()
                if player ~= nil then
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
            if soundInterfaceArray[index + 1] ~= nil then
                player = soundInterfaceArray[index + 1]:getPlayerP()
                if player ~= nil then
                    player:close()
                    progressCanvas:addPortion(100, self.soundStrings.CLOSING_SOUND, index)
                end
            end
        end
end

return Sounds

