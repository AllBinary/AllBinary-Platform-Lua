-- Generated Code Do Not Modify
-- package org.allbinary.media.audio.music

local ARunnable = require("org.allbinary.thread.ARunnable")
-- local Player = require("javax.microedition.media.Player")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
local AvianUtil = require("org.allbinary.AvianUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local NoSound = require("org.allbinary.media.audio.NoSound")
local PlayerStateUtil = require("org.allbinary.media.audio.PlayerStateUtil")
local Sound = require("org.allbinary.media.audio.Sound")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local MusicManager = {}
MusicManager.__index = MusicManager
MusicManager.className = "MusicManager"
--Handle Media ending for Avian
    local MusicManagerPlayerListener = {}
    MusicManagerPlayerListener.__index = MusicManagerPlayerListener
    MusicManagerPlayerListener.className = "MusicManagerPlayerListener"
    MusicManager.MusicManagerPlayerListener = MusicManagerPlayerListener

    function MusicManagerPlayerListener.new()
        local self = setmetatable({}, MusicManagerPlayerListener)
        return self
    end
    

    function MusicManager:playerUpdate(player, event, eventData)
            PreLogUtil.put(event, self, self.commonStrings.PROCESS)
            if event == PlayerListener.END_OF_MEDIA or event == PlayerListener.STOPPED or event == PlayerListener.CLOSED then
                self:reset()
            end
    end


function MusicManager:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.playerStateUtil = PlayerStateUtil.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(0)
    self.playerListener = MusicManagerPlayerListener.new()
    self.PLAY = "Play "
    self.SONG = " for: "
    self.NEXT_SONG = tostring(CommonLabels.getInstance().NEXT) .. " Song: "
    self.STOPPING = "Stopping Current Song: "
    self.ENDING = "Ending Current Song: "
    self.WAITING_FOR_MEDIA_TO_END = "Waiting for media to end"
    self.ALREADY_PLAYING = "Already Playing: "
    self.ALREADY_ENDED = "Last Song already ended: "
    self.songList = nil
    self.currentSongSound = NoSound.getInstance()
    self.nextSongSound = NoSound.getInstance()
    self.reset = false
    self.noDuration = false
    self.stopped = true
end


function MusicManager.new(musicServiceClass, songList)
    local self = setmetatable({}, MusicManager)
    self:_init_fields()
        self.songList = songList
    return self
end


function MusicManager:startNewSong()
        if self.nextSongSound == NoSound.getInstance() then
            local randomSongSound = self.basicArrayListUtil:getRandom(self.songList)
            self:nextSong(randomSongSound, 0, 0)
        end
        self:process()
end


function MusicManager:nextSong(nextSongSound, leftVolume, rightVolume)
        PreLogUtil.put(tostring(StringMaker.new():append(self.NEXT_SONG):append(nextSongSound:getResource())), self, self.commonStrings.PROCESS)
        self.nextSongSound = nextSongSound
        self:reset()
        self.stopped = false
end


function MusicManager:reset()
        self.reset = true
end


function MusicManager:process()
        local try_ok, try_error = pcall(function()
            if self.stopped then
                return
            end
            if self.songList:size() == 0 then
                return
            end
            if (self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) and not self.noDuration) or self.reset then
                self.reset = false
                self.noDuration = false
                local endingCurrentSongSound = self.currentSongSound
                local nextSongSound = self.nextSongSound
                self.nextSongSound = NoSound.getInstance()
                if nextSongSound == NoSound.getInstance() then
                    self.currentSongSound = BasicArrayListUtil.getInstance():getRandom(self.songList)
                else
                    self.currentSongSound = nextSongSound
                end
                local startingCurrentSongSound = self.currentSongSound
                local duration = java_int(self.currentSongSound:getDuration())
                self.timeDelayHelper.delay = duration
                if duration <= 0 then
                    local NO_DURATION_FOR = "No Duration for: "
                    PreLogUtil.put(tostring(StringMaker.new():append(NO_DURATION_FOR):append(self.currentSongSound:getResource())), self, self.commonStrings.PROCESS)
                    self.currentSongSound:getPlayerP():addPlayerListener(self.playerListener)
                    self.noDuration = true
                end
                if endingCurrentSongSound ~= NoSound.getInstance() then
                    if endingCurrentSongSound == startingCurrentSongSound and endingCurrentSongSound:getPlayerP():getState() == Player.STARTED then
                        PreLogUtil.put(tostring(StringMaker.new():append(self.ALREADY_PLAYING):append(endingCurrentSongSound:getResource())), self, self.commonStrings.PROCESS)
                        PreLogUtil.put(tostring(StringMaker.new():append(self.STOPPING):append(endingCurrentSongSound:getResource()):append(self.SONG):appendlong(duration)), self, self.commonStrings.PROCESS)
                        endingCurrentSongSound:getPlayerP():stop()
                        self:waitForStateChange(endingCurrentSongSound, startingCurrentSongSound)
                    else
                        if endingCurrentSongSound:getPlayerP():getState() == Player.STARTED then
                            PreLogUtil.put(tostring(StringMaker.new():append(self.STOPPING):append(endingCurrentSongSound:getResource()):append(self.SONG):appendlong(duration)), self, self.commonStrings.PROCESS)
                            endingCurrentSongSound:getPlayerP():stop()
                            self:waitForStateChange(endingCurrentSongSound, startingCurrentSongSound)
                        else
                            PreLogUtil.put(tostring(StringMaker.new():append(self.ALREADY_ENDED):append(self.PLAY):append(startingCurrentSongSound:getResource())), self, self.commonStrings.PROCESS)
                            if AvianUtil.isAvian() then
                                endingCurrentSongSound:getPlayerP():stop()
                                startingCurrentSongSound:getPlayerP():stop()
                            end
                            startingCurrentSongSound:getPlayerP():start()
                        end
                    end
                else
                    PreLogUtil.put(tostring(StringMaker.new():append(self.PLAY):append(self.currentSongSound:getResource()):append(self.SONG):appendlong(duration)), self, self.commonStrings.PROCESS)
                    self.currentSongSound:getPlayerP():start()
                end
            end
        end)
        if not try_ok then
            local e = try_error
            local resource = StringUtil.getInstance().EMPTY_STRING
            if self.currentSongSound ~= NoSound.getInstance() then
                resource = self.currentSongSound:getResource()
            end
            PreLogUtil.putOE(tostring(self.commonStrings.EXCEPTION_LABEL) .. resource, self, self.commonStrings.PROCESS, e)
        end
end


-- throws Exception
function MusicManager:waitForStateChange(endingCurrentSongSound, startingCurrentSongSound)
        while endingCurrentSongSound:getPlayerP():getState() == Player.STARTED do
            PreLogUtil.put(self.WAITING_FOR_MEDIA_TO_END, self, self.commonStrings.PROCESS)
            java_sleep(100)
        end
        PreLogUtil.put(tostring(StringMaker.new():append(self.playerStateUtil:convert(endingCurrentSongSound:getPlayerP():getState())):append(self.commonSeps.SPACE):append(self.PLAY):append(startingCurrentSongSound:getResource())), self, self.commonStrings.PROCESS)
        startingCurrentSongSound:getPlayerP():start()
end


-- throws Exception
function MusicManager:stop()
        local try_ok, try_error = pcall(function()
            local currentSongSound = self.currentSongSound
            if currentSongSound ~= NoSound.getInstance() then
                self.stopped = true
                PreLogUtil.put(tostring(StringMaker.new():append(self.ENDING):append(currentSongSound:getResource())), self, self.commonStrings.PROCESS)
                currentSongSound:getPlayerP():stop()
            end
            self.timeDelayHelper:setStartTime(0)
            PreLogUtil.put(tostring(StringMaker.new():append(self.commonStrings.END):append(StringUtil.getInstance():toString(currentSongSound))), self, self.commonStrings.END)
        end)
        if not try_ok then
            local e = try_error
            local resource = StringUtil.getInstance().EMPTY_STRING
            if currentSongSound ~= NoSound.getInstance() then
                resource = currentSongSound:getResource()
            end
            PreLogUtil.putOE(tostring(self.commonStrings.EXCEPTION_LABEL) .. resource, self, self.commonStrings.END, e)
        end
end

return MusicManager

