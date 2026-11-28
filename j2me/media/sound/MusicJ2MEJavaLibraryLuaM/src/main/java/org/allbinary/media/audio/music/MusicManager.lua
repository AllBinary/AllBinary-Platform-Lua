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

local ARunnable = java_lazy("org.allbinary.thread.ARunnable")
local Player = java_lazy("javax.microedition.media.Player")
local PlayerListener = java_lazy("javax.microedition.media.PlayerListener")
local AvianUtil = java_lazy("org.allbinary.AvianUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local NoSound = java_lazy("org.allbinary.media.audio.NoSound")
local PlayerStateUtil = java_lazy("org.allbinary.media.audio.PlayerStateUtil")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table MusicManager is declared before the requires
MusicManager.__index = MusicManager
MusicManager.className = "MusicManager"
MusicManager.javaClassName = "org.allbinary.media.audio.music.MusicManager"
--Handle Media ending for Avian
    local MusicManagerPlayerListener = {}
    MusicManagerPlayerListener.__index = MusicManagerPlayerListener
    MusicManagerPlayerListener.className = "MusicManagerPlayerListener"
    MusicManagerPlayerListener.javaClassName = "org.allbinary.media.audio.music.MusicManager$MusicManagerPlayerListener"
    MusicManagerPlayerListener.java_implements = " PlayerListener "
    MusicManagerPlayerListener.java_interfaces = function() return {PlayerListener} end
    MusicManager.MusicManagerPlayerListener = MusicManagerPlayerListener

    function MusicManagerPlayerListener:_init_fields()
        if self.musicManager == nil then self.musicManager = nil end
    end
    

    function MusicManagerPlayerListener._jinit(self, musicManager)
        MusicManagerPlayerListener._init_fields(self)
            self.musicManager = musicManager
        return self
    end

    function MusicManagerPlayerListener.new(...)
        local self = setmetatable({}, MusicManagerPlayerListener)
        MusicManagerPlayerListener._jinit(self, ...)
        return self
    end
        function MusicManagerPlayerListener.newEnclosed(outer, ...)
            local self = setmetatable({__javaOuter = outer}, MusicManagerPlayerListener)
            MusicManagerPlayerListener._jinit(self, ...)
            return self
        end
    

    function MusicManagerPlayerListener:playerUpdate(player, event, eventData)
            PreLogUtil.put(event, self, self.musicManager.commonStrings.PROCESS)
            if rawequal(event, PlayerListener.END_OF_MEDIA) or rawequal(event, PlayerListener.STOPPED) or rawequal(event, PlayerListener.CLOSED) then
                self.musicManager:reset()
            end
    end


function MusicManager:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.playerStateUtil = PlayerStateUtil.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(0)
    self.playerListener = MusicManagerPlayerListener.newEnclosed(self, self)
    self.PLAY = "Play "
    self.SONG = " for: "
    self.NEXT_SONG = require("allbinary_java").to_string(CommonLabels.getInstance().NEXT) .. require("allbinary_java").to_string(" Song: ")
    self.STOPPING = "Stopping Current Song: "
    self.ENDING = "Ending Current Song: "
    self.WAITING_FOR_MEDIA_TO_END = "Waiting for media to end"
    self.ALREADY_PLAYING = "Already Playing: "
    self.ALREADY_ENDED = "Last Song already ended: "
    if self.songList == nil then self.songList = nil end
    self.currentSongSound = NoSound.getInstance()
    self.nextSongSound = NoSound.getInstance()
    if self.reset_f == nil then self.reset_f = false end
    if self.noDuration == nil then self.noDuration = false end
    self.stopped = true
end


function MusicManager._jinit(self, musicServiceClass, songList)
    MusicManager._init_fields(self)
        self.songList = songList
    return self
end

function MusicManager.new(...)
    local self = setmetatable({}, MusicManager)
    MusicManager._jinit(self, ...)
    return self
end


function MusicManager:startNewSong()
        if rawequal(self.nextSongSound, NoSound.getInstance()) then
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
        self.reset_f = true
end


function MusicManager:process()
        local try_ok, try_error, try_value = pcall(function()
            if self.stopped then
                do return "__jreturn" end
            end
            if rawequal(self.songList:size(), 0) then
                do return "__jreturn" end
            end
            if (self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) and not (self.noDuration)) or self.reset_f then
                self.reset_f = false
                self.noDuration = false
                local endingCurrentSongSound = self.currentSongSound
                local nextSongSound = self.nextSongSound
                self.nextSongSound = NoSound.getInstance()
                if rawequal(nextSongSound, NoSound.getInstance()) then
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
                if not rawequal(endingCurrentSongSound, NoSound.getInstance()) then
                    if rawequal(endingCurrentSongSound, startingCurrentSongSound) and rawequal(endingCurrentSongSound:getPlayerP():getState(), Player.STARTED) then
                        PreLogUtil.put(tostring(StringMaker.new():append(self.ALREADY_PLAYING):append(endingCurrentSongSound:getResource())), self, self.commonStrings.PROCESS)
                        PreLogUtil.put(tostring(StringMaker.new():append(self.STOPPING):append(endingCurrentSongSound:getResource()):append(self.SONG):appendlong(duration)), self, self.commonStrings.PROCESS)
                        endingCurrentSongSound:getPlayerP():stop()
                        self:waitForStateChange(endingCurrentSongSound, startingCurrentSongSound)
                    else
                        if rawequal(endingCurrentSongSound:getPlayerP():getState(), Player.STARTED) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local resource = StringUtil.getInstance().EMPTY_STRING
            if not rawequal(self.currentSongSound, NoSound.getInstance()) then
                resource = self.currentSongSound:getResource()
            end
            PreLogUtil.putOE(require("allbinary_java").to_string(self.commonStrings.EXCEPTION_LABEL) .. require("allbinary_java").to_string(resource), self, self.commonStrings.PROCESS, e)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function MusicManager:waitForStateChange(endingCurrentSongSound, startingCurrentSongSound)
        while rawequal(endingCurrentSongSound:getPlayerP():getState(), Player.STARTED) do
            PreLogUtil.put(self.WAITING_FOR_MEDIA_TO_END, self, self.commonStrings.PROCESS)
            require("java.lang.Thread").sleep(100)
        end
        PreLogUtil.put(tostring(StringMaker.new():append(self.playerStateUtil:convert(endingCurrentSongSound:getPlayerP():getState())):append(self.commonSeps.SPACE):append(self.PLAY):append(startingCurrentSongSound:getResource())), self, self.commonStrings.PROCESS)
        startingCurrentSongSound:getPlayerP():start()
end


-- throws Exception
function MusicManager:stop()
        local try_ok, try_error, try_value = pcall(function()
            local currentSongSound = self.currentSongSound
            if not rawequal(currentSongSound, NoSound.getInstance()) then
                self.stopped = true
                PreLogUtil.put(tostring(StringMaker.new():append(self.ENDING):append(currentSongSound:getResource())), self, self.commonStrings.PROCESS)
                currentSongSound:getPlayerP():stop()
            end
            self.timeDelayHelper:setStartTime(0)
            PreLogUtil.put(tostring(StringMaker.new():append(self.commonStrings.END):append(StringUtil.getInstance():toString(currentSongSound))), self, self.commonStrings.END)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local resource = StringUtil.getInstance().EMPTY_STRING
            if not rawequal(self.currentSongSound, NoSound.getInstance()) then
                resource = self.currentSongSound:getResource()
            end
            PreLogUtil.putOE(require("allbinary_java").to_string(self.commonStrings.EXCEPTION_LABEL) .. require("allbinary_java").to_string(resource), self, self.commonStrings.END, e)
        end
end

return MusicManager

