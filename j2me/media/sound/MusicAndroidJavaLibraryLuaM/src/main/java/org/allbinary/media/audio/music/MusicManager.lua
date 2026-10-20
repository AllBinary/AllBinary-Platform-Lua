-- Generated Code Do Not Modify
-- package org.allbinary.media.audio.music

local Activity = require("android.app.Activity")
local Context = require("android.content.Context")
local Intent = require("android.content.Intent")
local AndroidServicesUtil = require("org.allbinary.android.AndroidServicesUtil")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local NoSound = require("org.allbinary.media.audio.NoSound")
local Sound = require("org.allbinary.media.audio.Sound")
local CommonStateStrings = require("org.allbinary.string.CommonStateStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MusicManager = {}
MusicManager.__index = MusicManager
MusicManager.className = "MusicManager"

function MusicManager:_init_fields()
    self.PLAY = "Play "
    self.FOR = " for: "
    self.commonStrings = CommonStrings.getInstance()
    self.musicStrings = MusicStrings.getInstance()
    self.commonStateStrings = CommonStateStrings.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.resourceUtil = ResourceUtil.getInstance()
    self.androidServicesUtil = AndroidServicesUtil.getInstance()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(0)
    self.timeDelayHelper2 = TimeDelayHelper.new(1200)
    self.songList = nil
    self.currentSongSound = NoSound.getInstance()
    self.nextSongSound = NoSound.getInstance()
    self.leftVolume = 100
    self.rightVolume = 100
    self.musicServiceClass = nil
    self.currentIntent = nil
end


function MusicManager.new(musicServiceClass, songList)
    local self = setmetatable({}, MusicManager)
    self:_init_fields()
        PreLogUtil.put(self.commonStateStrings.CONTEXT + self.resourceUtil:getContext(), self, self.commonStrings.CONSTRUCTOR)
        self.musicServiceClass = musicServiceClass
        self.currentIntent = Intent.new(self.resourceUtil:getContext(), musicServiceClass)
        self.songList = songList
    return self
end


function MusicManager:nextSong(nextSongSound, leftVolume, rightVolume)
        if nextSongSound == nil then
            nextSongSound = NoSound.getInstance()
        end
        self.nextSongSound = nextSongSound
        self.leftVolume = leftVolume
        self.rightVolume = rightVolume
        self:reset()
end


function MusicManager:reset()
        self.timeDelayHelper.delay = 0
end


function MusicManager:process()
        if self.songList:size() == 0 then
            return
        end
        if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            self:startNewSong()
            return
        end
        if self.timeDelayHelper2:isTime(self.gameTickTimeDelayHelper.startTime) then
            if self.androidServicesUtil:isServiceRunning(self.musicServiceClass:getName()) then
            else
                self:startNewSong()
            end
        end
end


function MusicManager:show()
        do
            local index = self.songList:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local sound = self.songList:get(index)
            local duration = java_int(sound:getDuration())
            PreLogUtil.put(tostring(StringMaker.new():append(self.PLAY):append(sound:getResource()):append(self.FOR):appendlong(duration)), self, self.commonStrings.PROCESS)
            end
        end
end


function MusicManager:startNewSong()
        local try_ok, try_error = pcall(function()
            self.resourceUtil:getContext():stopService(self.currentIntent)
            if self.nextSongSound == NoSound.getInstance() then
                self.currentSongSound = self.basicArrayListUtil:getRandom(self.songList)
            else
                self.currentSongSound = self.nextSongSound
                self.nextSongSound = NoSound.getInstance()
            end
            local duration = java_int(self.currentSongSound:getDuration())
            PreLogUtil.put(tostring(StringMaker.new():append(self.PLAY):append(self.currentSongSound:getResource()):append(self.FOR):appendlong(duration)), self, self.commonStrings.PROCESS)
            self.timeDelayHelper.delay = duration
            self.currentIntent:putExtra(self.musicStrings.SONG_EXTRA, math.tointeger(self.resourceUtil:getResourceId(self.currentSongSound:getResource()) // 1))
            self.currentIntent:putExtra(self.musicStrings.LEFT_VOLUME, self.leftVolume)
            self.currentIntent:putExtra(self.musicStrings.RIGHT_VOLUME, self.rightVolume)
            self.resourceUtil:getContext():startService(self.currentIntent)
        end)
        if not try_ok then
            local e = try_error
            local resource = StringUtil.getInstance().EMPTY_STRING
            if self.currentSongSound ~= nil then
                resource = self.currentSongSound:getResource()
            end
            PreLogUtil.putOE(tostring(self.commonStrings.EXCEPTION_LABEL) .. resource, self, self.commonStrings.PROCESS, e)
        end
end


-- throws Exception
function MusicManager:stop()
        self.resourceUtil:getContext():stopService(self.currentIntent)
end


function MusicManager.pause(activity, musicServiceClass)
        local commonStateStrings = CommonStateStrings.getInstance()
        local musicPauseIntent = Intent.new(activity, musicServiceClass)
        musicPauseIntent:putExtra(commonStateStrings.ON_START_COMMAND, 1)
        activity:startService(musicPauseIntent)
end


function MusicManager.resume(activity, musicServiceClass)
        if AndroidServicesUtil.getInstance():isServiceRunning(musicServiceClass:getName()) then
            local commonStateStrings = CommonStateStrings.getInstance()
            local musicResumeIntent = Intent.new(activity, musicServiceClass)
            musicResumeIntent:putExtra(commonStateStrings.ON_START_COMMAND, 2)
            activity:startService(musicResumeIntent)
        end
end

return MusicManager

