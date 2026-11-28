-- Generated Code Do Not Modify
-- package org.allbinary.media.audio.music

local MusicManager = {}
package.loaded["org.allbinary.media.audio.music.MusicManager"] = MusicManager

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

local Activity = java_lazy("android.app.Activity")
local Context = java_lazy("android.content.Context")
local Intent = java_lazy("android.content.Intent")
local AndroidServicesUtil = java_lazy("org.allbinary.android.AndroidServicesUtil")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local NoSound = java_lazy("org.allbinary.media.audio.NoSound")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local CommonStateStrings = java_lazy("org.allbinary.string.CommonStateStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local MusicStrings = java_lazy("org.allbinary.media.audio.music.MusicStrings")

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

-- class table MusicManager is declared before the requires
MusicManager.__index = MusicManager
MusicManager.className = "MusicManager"
MusicManager.javaClassName = "org.allbinary.media.audio.music.MusicManager"

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
    if self.songList == nil then self.songList = nil end
    self.currentSongSound = NoSound.getInstance()
    self.nextSongSound = NoSound.getInstance()
    self.leftVolume = 100
    self.rightVolume = 100
    if self.musicServiceClass == nil then self.musicServiceClass = nil end
    if self.currentIntent == nil then self.currentIntent = nil end
end


function MusicManager._jinit(self, musicServiceClass, songList)
    MusicManager._init_fields(self)
        PreLogUtil.put(self.commonStateStrings.CONTEXT + self.resourceUtil:getContext(), self, self.commonStrings.CONSTRUCTOR)
        self.musicServiceClass = musicServiceClass
        self.currentIntent = Intent.new(self.resourceUtil:getContext(), musicServiceClass)
        self.songList = songList
    return self
end

function MusicManager.new(...)
    local self = setmetatable({}, MusicManager)
    MusicManager._jinit(self, ...)
    return self
end


function MusicManager:nextSong(nextSongSound, leftVolume, rightVolume)
        if rawequal(nextSongSound, nil) then
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
        if rawequal(self.songList:size(), 0) then
            return
        end
        if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            self:startNewSong()
            return
        end
        if self.timeDelayHelper2:isTime(self.gameTickTimeDelayHelper.startTime) then
            if self.androidServicesUtil:isServiceRunning((self.musicServiceClass.javaClassName or self.musicServiceClass.className)) then
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
        local try_ok, try_error, try_value = pcall(function()
            self.resourceUtil:getContext():stopService(self.currentIntent)
            if rawequal(self.nextSongSound, NoSound.getInstance()) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local resource = StringUtil.getInstance().EMPTY_STRING
            if not rawequal(self.currentSongSound, nil) then
                resource = self.currentSongSound:getResource()
            end
            PreLogUtil.putOE(require("allbinary_java").to_string(self.commonStrings.EXCEPTION_LABEL) .. require("allbinary_java").to_string(resource), self, self.commonStrings.PROCESS, e)
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
        if AndroidServicesUtil.getInstance():isServiceRunning((musicServiceClass.javaClassName or musicServiceClass.className)) then
            local commonStateStrings = CommonStateStrings.getInstance()
            local musicResumeIntent = Intent.new(activity, musicServiceClass)
            musicResumeIntent:putExtra(commonStateStrings.ON_START_COMMAND, 2)
            activity:startService(musicResumeIntent)
        end
end

return MusicManager

